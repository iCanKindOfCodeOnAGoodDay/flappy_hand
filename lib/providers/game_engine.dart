import 'dart:async';
import 'dart:math';

import 'package:flappy_taco/providers/game_data.dart';
import 'package:flappy_taco/providers/settings_data.dart';
import 'package:flappy_taco/services/audio_service.dart';
import 'package:flutter/material.dart';

import '../enums/screen_effect_type.dart';
import '../models/bullet.dart';
import '../models/obstacle_hit_effect.dart';
import '../models/pickups.dart';
import '../models/screen_effect.dart';
import '../models/zombie_obstacle.dart';

/*

  ANIMATIONS (4 major components animated) - However, the player also has some effects that are stacked below, which should probably somehow be included with the bird.
  Maybe we can do this without creating addition columns like last time?

- How this game is animating movement
- using the same strategy for all moving objects
- except for just like static gifs

  Moving Obstacles:
    1. Initialize buildings
    2. Use game speed timer to update every 16ms the x position of Positioned widgets in a list
              - Once Widgets in the list, the game speed timer calls updateGame() which moves the buildings
              - Just putting a widget in a list of animated widgets will animate that widget
              - Just got to make sure that the GameTimer is calling update()
    3. Recycle the first building
              - At position x = 0 - birdSize
              - Set that position equal to the screenWidth

Managing Player:
    Similarly to buildings, the player in animated using the same method.
    But the player has a fixed x and a flexible y coord.

Moving Gunshots:
    Again, we use the same method for animation. But this time, we are moving from left to right, and managing
    a list of elements which are not automatically recycled.
    Similarly to last method, we track where the bullet is fired from.
    But now we can animate that bullet across the entire screen, many positions (maybe 100 x coords),
    versus 10 positions before
    Any bullets entered at 0 will automatically animate across the screen.

Moving Background image:
    Again, same method. We are using 2 images, which are always side by side. The image being used right now
    is alright. The image is layered behind a frame which it makes it look pretty cool.

Pickups -
    Create pickups in the space between buildings.
    maybe 5% of blank space can have a single pickup.
    When creating a pickup, just choose randomly from the list containing all the pickups and place it in the UI.
    We'll have to finish the contact with power ups checker in the todo list below




Screen Effects will come from the Game Data Provider, called during rebuilds triggered by the GAME ENGINE.


   */
class GameEngine with ChangeNotifier {
  ValueNotifier<bool> gameOverNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<List<ObstacleHitEffect>> activeObstacleEffects =
      ValueNotifier([]);

  void addObstacleHitEffect(int obstacleIndex, double xOffset, double y) {
    final effect = ObstacleHitEffect(
      obstacleIndex: obstacleIndex,
      xOffset: xOffset,
      y: y,
      imagePath: 'images/green_blood_alien_hit_effect.gif',
      duration: Duration(milliseconds: 100),
    );

    activeObstacleEffects.value = [...activeObstacleEffects.value, effect];

    Future.delayed(effect.duration, () {
      activeObstacleEffects.value.remove(effect);
      activeObstacleEffects.notifyListeners();
    });
  }

  bool hearSoundEffects = true;
  SoundModel soundModel = SoundModel();

  void playEffect(ScreenEffectType type) {
    switch (type) {
      case ScreenEffectType.bomb:
        // copy grenade for now
        triggerScreenEffect(
          type,
          'images/blackRedYellowExplosion.gif',
          Duration(milliseconds: 400),
        );
        break;
      case ScreenEffectType.grenade:
        triggerScreenEffect(
          type,
          'images/explosionFlames.gif',
          Duration(milliseconds: 600),
        );
        soundModel.playOtherSounds5x('customExplosion.mp3', hearSoundEffects);

        break;
      case ScreenEffectType.asteroid:
        triggerScreenEffect(
          type,
          'images/blood2.gif',

          /// didn't i just turn this to black? THIS IS THE RED ONE LOL
          Duration(milliseconds: 800),
        );
        soundModel.knifePickup(hearSoundEffects);
        break;
      case ScreenEffectType.mac10:
        triggerScreenEffect(
          type,
          'images/macGruberGunshots.gif',
          Duration(milliseconds: 800),
        );
        soundModel.bloodPickup(hearSoundEffects);
        // this is the mac 10
        break;
      case ScreenEffectType.ammoUpgrade:
        triggerScreenEffect(
          type,
          'images/fireBallXPurple.gif',
          Duration(milliseconds: 100),
        );
        soundModel.cannonPickup(hearSoundEffects);
        break;
      case ScreenEffectType.shotgun:

        /// this one is the shotgun that plays macgruber
        triggerScreenEffect(
          type,
          'images/macGruberGunshots.gif',
          Duration(milliseconds: 800),
        );
        soundModel.crystalPickup(hearSoundEffects);
        break;
      case ScreenEffectType.acid:
        triggerScreenEffect(
          type,
          'images/blood2.gif',
          Duration(milliseconds: 100),
        );
        Future.delayed(Duration(milliseconds: 100), () {
          triggerScreenEffect(
            type,
            'images/probe_patrol_abduction_tall.gif',
            Duration(milliseconds: 1200),
          );
        });

        break;
      case ScreenEffectType.life:
        triggerScreenEffect(
            type, 'images/hand_grab_effect.gif', Duration(milliseconds: 800));
        soundModel.lifePickup(hearSoundEffects);

        break;
    }
  }

  final ValueNotifier<List<Obstacle>> obstacles = ValueNotifier([]);

  ValueNotifier<List<ScreenEffect>> activeScreenEffects = ValueNotifier([]);
  void triggerScreenEffect(
      ScreenEffectType type, String imagePath, Duration duration) {
    final effect = ScreenEffect(
      type: type,
      imagePath: imagePath,
      duration: duration,
    );

    activeScreenEffects.value = [...activeScreenEffects.value, effect];

    Future.delayed(duration, () {
      activeScreenEffects.value.removeWhere((e) => e.type == type);
      activeScreenEffects.notifyListeners();
    });
  }

  late GamePlayVariableDataProvider gameData;
  late SettingsDataProvider settings;

  void updateDependencies(
      GamePlayVariableDataProvider gd, SettingsDataProvider s) {
    gameData = gd;
    settings = s;
  }

  double zombieScreenHeight = 400;
  double zombieScreenWidth = 400;
  final double birdSize = 25; // half actual bird size
  double birdY = 300;
  double birdVelocity = 0;
  double gravity = 0.6;
  double jumpStrength = -5;

  final double obstacleWidth = 50;
  final double gapHeight = 150;
  final double obstacleSpeed = 3; // was 2 // gamespeed

  // List<double> obstacleX = [];
  // List<double> obstacleHeights = [];

  List<double> pickupX = []; // dynamic - animated value
  List<double> pickupY = []; // static

  bool gameOver = false;
  Timer? gameLoop;
  final double birdX = 50;

  Timer? oneSecondGlobalGamePlayTimer;
  int secondsSurvived = 0;

  void spawnNewObstacle() {
    final random = Random();

    double lastX =
        obstacles.value.isEmpty ? zombieScreenWidth : obstacles.value.last.x;

    double spacing = 150 + random.nextDouble() * 250;

    final newObstacle = Obstacle(
      x: lastX + spacing,
      height: random.nextDouble() * (zombieScreenHeight - gapHeight),
    );

    // Create a new list to trigger ValueNotifier
    obstacles.value = List.from(obstacles.value)..add(newObstacle);
  }

  // i'm a little confused on this one - are we using it?
  void setGameOverFalse() {
    gameOver = false;
    gameOverNotifier.value = false;
    notifyListeners();
  }

  void gameLoopNew() {
    final random = Random();
    for (int i = 0; i < 3; i++) {
      spawnNewObstacle();
    }
    updateGame();
    gameLoop = Timer.periodic(Duration(milliseconds: 16), (_) {
      updateGame();

      notifyListeners();
    });

    oneSecondGlobalGamePlayTimer = Timer.periodic(Duration(seconds: 1), (_) {
      secondsSurvived++;
      notifyListeners();
    });
  }

  int pickupNum = 99; // code for no pickup
  // called by gameLoopNew
  void updateGame() {
    updateBackgroundImageAnimation();
    moveBulletsAcrossScreen();
    // ✅ actually store the created pickup
    final maybePickup = maybeCreatePickup(birdY);
    if (maybePickup != null) {
      activePickups.value = List.from(activePickups.value)..add(maybePickup);
    }

    updatePickups();

    if (!gameOver) {
      // Update bird physicsR
      birdVelocity += gravity;
      birdY += birdVelocity;

      List<int> obstaclesToRemove = [];

      /// ----- OBSTACLE LOOP -----
      updateObstacles();

      if (gameOver) return;

      // reach top
      if (birdY < 0) {
        birdY = birdY += 10;
      }
      // reached bottom
      else if (birdY + birdSize > zombieScreenHeight) {
        jump();
      }

      for (int index in obstaclesToRemove.reversed) {
        obstacles.value.removeAt(index);
      }

      /// ----- OBSTACLE SPAWNING (run once per frame) -----
      if (obstacles.value.isEmpty ||
          obstacles.value.last.x < zombieScreenWidth - 250) {
        spawnNewObstacle();
      }
      // Ground/ceiling collision
      // if (birdY < 0 || birdY + birdSize > zombieScreenHeight) {
      //   gameOver = true;
      // }
      notifyListeners();
    }
  }

  void endGame() {
    soundModel.gameOver(hearSoundEffects);
    triggerScreenEffect(
        ScreenEffectType.gameOver, 'images/gameOver.GIF', Duration(seconds: 2));
    triggerScreenEffect(ScreenEffectType.asteroid,
        'images/blood2LightGreen.gif', Duration(milliseconds: 1500));

    gameOver = true;
    gameOverNotifier.value = true;
    gameLoop?.cancel();
    oneSecondGlobalGamePlayTimer?.cancel();
    notifyListeners();
  }

  void updateObstacles() {
    if (gameOver) return;

    List<int> obstaclesToRemove = [];

    for (int i = 0; i < obstacles.value.length; i++) {
      obstacles.value[i].x -= obstacleSpeed;

      // Flag for removal if off screen
      if (obstacles.value[i].x + obstacleWidth < 0) {
        obstaclesToRemove.add(i);
        continue;
      }

      // Collision detection
      final birdRect = Rect.fromLTWH(birdX, birdY, birdSize, birdSize);

      final topRect = Rect.fromLTWH(
        obstacles.value[i].x,
        0,
        obstacleWidth - 30,
        obstacles.value[i].height - 25,
      );

      final bottomY = obstacles.value[i].height + gapHeight;
      final bottomRect = Rect.fromLTWH(
        obstacles.value[i].x,
        bottomY,
        obstacleWidth - 50,
        zombieScreenHeight - bottomY,
      );

      // bullet collision
      int a = 0;
      while (a < bullets.value.length) {
        final bulletRect = Rect.fromLTWH(bullets.value[a].x, birdY, 30, 30);

        bool hit = false;

        if (bulletRect.overlaps(topRect)) {
          addObstacleHitEffect(
              i, bullets.value[a].x - obstacles.value[i].x + 35, birdY);

          if (obstacles.value[i].height >= 20) {
            addObstacleHitEffect(
                i, bullets.value[a].x - obstacles.value[i].x + 35, birdY);
            obstacles.value[i].height -= 20;
          }
          hit = true;
        } else if (bulletRect.overlaps(bottomRect)) {
          addObstacleHitEffect(
              i, bullets.value[a].x - obstacles.value[i].x + 35, birdY);
          obstacles.value[i].height += 20;
          hit = true;
        }

        if (hit) {
          bullets.value.removeAt(a);
        } else {
          a++;
        }
      }

      /// bird collision
      if (birdRect.overlaps(topRect) || birdRect.overlaps(bottomRect)) {
        endGame();
        return; // Stop further processing if game ends
      }
    }

    // Remove flagged obstacles
    for (int index in obstaclesToRemove.reversed) {
      obstacles.value.removeAt(index);
    }

    // Spawn new obstacles if needed
    while (obstacles.value.isEmpty ||
        obstacles.value.last.x < zombieScreenWidth + 100) {
      spawnNewObstacle();
    }

    obstacles.notifyListeners(); // Notify that obstacles list has changed
  }

  double actualScreenWidth =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window)
          .size
          .width; // depreciated - will be removed in updateR

  double actualScreenHeight =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window)
          .size
          .height; // depreciated - will be removed in update

  List<double> backgroundImageX = [];

  void setupBackgroundAnimationImageList() {
    backgroundImageX = [
      0,
      actualScreenWidth,
    ];
    // notifyListeners();
  }

  double backgroundImageSpeed = 1;

  void updateBackgroundImageAnimation() {
    List<double> newPositions = [];

    for (int i = 0; i < backgroundImageX.length; i++) {
      double x = backgroundImageX[i] - backgroundImageSpeed;
      // If offscreen to the left, reposition to the far right
      if (x <= -actualScreenWidth) {
        x += actualScreenWidth * 2; // wrap around
      }
      newPositions.add(x);
    }
    backgroundImageX = newPositions;
    notifyListeners();
  }

  void jump() {
    if (!gameOver) {
      birdVelocity = jumpStrength;
    } else {
      resetGame();
    }
    notifyListeners();
  }

  void resetGame() {
    gameOver = false;
    gameOverNotifier.value = false;
    birdY = 300;
    birdVelocity = 0;
    secondsSurvived = 0;
    obstacles.value.clear();

    for (int i = 0; i < 3; i++) {
      spawnNewObstacle();
    }

    gameLoop?.cancel();
    oneSecondGlobalGamePlayTimer?.cancel();
    gameLoopNew(); // restart your loop
    notifyListeners();
  }

  void shootJump() {
    birdY = birdY - 150;
    jump();
    notifyListeners();
  }

  void doubleJump() {
    if (!gameOver) {
      birdY = birdY - 75;
      jump();
    } else {
      // Restart game
      gameOver = false;
      birdY = 300;
      birdVelocity = 0;
      for (int i = 0; i < obstacles.value.length - 1; i++) {
        obstacles.value[i].x = zombieScreenWidth + i * 200;
        obstacles.value[i].height =
            Random().nextDouble() * (zombieScreenHeight - gapHeight);
      }
    }
    notifyListeners();
  }

  /*

  Besides basics, we'll use below this point for game data related to the game.

   */

  bool displayGunShot = false;
  bool gunCoolDown = true;

  void fireGun() async {
    if (gunCoolDown) {
      gunCoolDown = false; // prevent double firing
      displayGunShot = true;
      notifyListeners();

      await Future.delayed(Duration(
          milliseconds:
              150)); // modified async is key to Keep the rest of the game responsive while this delay happens
      displayGunShot = false;
      gunCoolDown = true;
      notifyListeners();
    }
  }

  final ValueNotifier<List<Bullet>> bullets = ValueNotifier([]);
  int laserCounter = 0;

  void addNewBulletForAnimation() {
    // soundModel.playOtherSounds("laserBlast.mp3", hearSoundEffects);

    /// this is to be called each time the gun should be fired, the bullet should automatically animated if Game loop is calling animatedBulletsAcrossScreen()
    bullets.value = List.from(bullets.value)..add(Bullet(x: birdX, y: birdY));
    notifyListeners();
  }

  double gunShotImageSpeed = 10;

  void moveBulletsAcrossScreen() {
    for (int i = 0; i < bullets.value.length; i++) {
      if (bullets.value[i].x == birdX) {
        bullets.value[i].y = birdY; // removed when off screen
        notifyListeners();
      }
      bullets.value[i].x += gunShotImageSpeed; // move right
      if (bullets.value[i].x >= actualScreenWidth) {
        bullets.value.removeAt(i);
        bullets.notifyListeners();
      }
    }
  }

  /// TODO finish pickups
  List<String> pickups = [for (var i in ScreenEffectType.values) i.name];

  final ValueNotifier<List<Pickup>> activePickups = ValueNotifier([]);
  bool alreadyPickedUp = false;

  void updatePickups() {
    activePickups.value.removeWhere((pickup) => pickup.x < -50);

    for (var pickup in activePickups.value) {
      pickup.x -= obstacleSpeed;
      if (!alreadyPickedUp) {
        alreadyPickedUp = true;
        Future.delayed(Duration(milliseconds: 200), () {
          alreadyPickedUp = false;
        }); // prevent from picking up many duplicates at a time

        ///Collision Detection - Pickups
        final pickupRect = Rect.fromLTWH(pickup.x, pickup.y, 50, 50);
        final birdRect = Rect.fromLTWH(birdX, birdY, birdSize, birdSize);
        if (pickupRect.overlaps(birdRect)) {
          handlePickup(pickup); // Your custom logic
          // triggerScreenEffect(ScreenEffectType.bomb,
          //     "images/bombFlames.gif", Duration(seconds: 1));
          // print("should trigger screen effect");
        }
      }
    }
  }

  void handlePickup(Pickup pickup) {
    print("GOT PICKUP TYPE: '${pickup.type}'");

    switch (pickup.type) {
      case 'acid':
        playEffect(ScreenEffectType.acid);
        break;
      case 'asteroid':
        playEffect(ScreenEffectType.asteroid);
        break;

      case 'grenade':
        playEffect(ScreenEffectType.grenade);
        break;

      case 'bomb':
        playEffect(ScreenEffectType.bomb);
        break;

      case 'mac10':
        playEffect(ScreenEffectType.mac10);
        break;

      case 'life':
        playEffect(ScreenEffectType.life);
        break;

      case 'ammoUpgrade':
        playEffect(
            ScreenEffectType.ammoUpgrade); // mismatched name, now handled ✅
        break;

      case 'shotgun':
        playEffect(ScreenEffectType.shotgun);
        break;

      default:
        print("💥 Unknown pickup: '${pickup.type}' — using bomb fallback");
        playEffect(ScreenEffectType.bomb);
    }
  }

  Pickup? maybeCreatePickup(double birdY) {
    int oneInTwenty = Random().nextInt(300); // 5% chance
    if (oneInTwenty != 0) return null;

    int pickupNumber = Random().nextInt(pickups.length);
    String type = pickups[pickupNumber];
    String path;

    if (type == 'gameOver')
      return null; // stop creating pickups for gameOver that have default values for iconpath and effect
    switch (type) {
      case 'asteroid':
        path = settings.pathToSelectedKnife;
        break;
      case 'grenade':
        path = settings.grenadePath;
        break;
      case 'bomb':
        path = 'bomb_pickup_2.png';
        break;
      case 'shotgun':
        path = settings.shotgunPath;
        break;
      case 'life':
        path = settings.pathSelectedPlayer;
        break;
      case 'ammoUpgrade':
        path = 'fireBallXPurple.gif';
        break;
      case 'mac10':
        path = 'mac_10_flipped.png';
        break;
      case 'acid':
        path = 'probe_patrol_UFO_lights.png';
        break;
      default:
        path = settings.pathToSelectedKnife;
    }

    // Place pickup slightly off screen to the right, with some variation in height
    double pickupX = zombieScreenWidth + 50;
    double pickupY = birdY + Random().nextInt(60) - 30; // small random offset

    return Pickup(
      type: type,
      imagePath: 'images/$path',
      x: pickupX,
      y: pickupY.clamp(0, zombieScreenHeight - 30), // prevent going off screen
    );
  }
}
