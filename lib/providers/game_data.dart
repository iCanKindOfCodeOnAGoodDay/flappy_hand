import 'dart:async';
import 'dart:math';

import 'package:flappy_taco/constants.dart';
import 'package:flutter/material.dart';

import '../services/audio_service.dart';
import '../widgets/game_screen/blocks/game_play_box_zone/obstacle_grid/row/columns/columns/effects/cannon_contact_effect_Columns.dart';
import '../widgets/game_screen/blocks/game_play_box_zone/obstacle_grid/row/columns/columns/gunshots/bullet_column.dart';
import '../widgets/game_screen/blocks/game_play_box_zone/obstacle_grid/row/columns/elements/bullets/bullet_widget.dart';
import '../widgets/game_screen/blocks/game_play_box_zone/obstacle_grid/row/columns/elements/bullets/spinning_bullet.dart';
import '../widgets/game_screen/blocks/zone_below_play_box/widgets/magazine_bullet_widget.dart';

/*

March 2025,

Game variables updated and reflecting in App UI to create Game Play -
Many Methods are called very frequently.
We are constantly checking for 'contacts'.
Player contacts with obstacles trigger a loss of life.
Bullet contact with obstacles gain points and destroy incoming view_box.

What are the differences between cannons, guns, bullets, ammo, magazine, etc?
Why does the game freeze with 'Cannon Upgrades'?
Why does the game stall after long running?
What sounds do we want?
Are we managing resources?

   */

/*

DEFINITIONS:

Funcs called often by one another during events that are checked by timers.
We're making a ton of timers and recursive calls from one def to another
to keep the game speed variable adjusting
constantly, in microseconds.
Are you just creating too many timer objects?

 */

enum AmmoType {
  orange,
  blue,
  yellow,
  purple,
  flashing,
  white,
  black,
  second_to_last,
  last,
}

enum LastGamePlayButton {
  climb,
  jump,
  dive,
}

SoundModel soundModel = SoundModel();

class GamePlayVariableDataProvider with ChangeNotifier {
  /*

  Moving Buildings.

    1. Create a new building - Based on time
          - What building height?
          - The fast the buildings x position is changed, the faster the game is.
          - We can track variables from a timer , and when they hit a certain point we can do things like
                - Power-ups, power-downs, lives, space, etc.
    2. Put that building in a list of buildings
    3. Change the x position of each building in the list
              - Once Widgets in the list, the game speed timer calls updateGame() which moves the buildings
    4. Recycle the first building
              - At position x = 0
    5. Create new building off screen at exactly the same time
              - At position x = screenWidth + 50

Managing the player using the same method will be a very easy integration once this is done.

   */

  double screenWidth = 300;
  double screenHeight = 300;
  LastGamePlayButton lastCommand = LastGamePlayButton.climb;
  AmmoType currentAmmunition = AmmoType.orange;
  bool hearSoundEffects = false;
  bool hearBackgroundMusic = false;
  double opacityOfBlackGameBoy = 1.0;
  bool redGameBoyInsteadOfYellow = false;
  bool purpleGameBoy = false;
  bool silverGameBoy = false;
  bool isClimbing = false;
  bool showADeadHand = false;
  int iterateThroughZombieHandList = 0;
  String lifePickupScreenEffectPath = 'bbbbZombieReachRedWhiteBlue.gif';
  String progressUpdate = '';
  bool crashed = true;
  bool userCannotDieRightNow = false;
  int p = 0; // what is this?
  bool shouldDisplayDoublePointsEffects = false;
  int amountOfTimeUserHitDoublePoints = 1;
  bool isPaused = true;
  int buildingSpace = 0;
  bool shouldMakeUpsideDownBuilding = false;
  int score = 0;
  int gameSpeed = 200000;
  int displaySpeed = 100;
  bool shouldDisplayExplosion1 = false;
  bool shouldDisplayExplosion2 = false;
  bool shouldDisplayBloodSplatQuick = false;
  bool shouldDisplayKnifeDefense = false;
  bool displayLifeLossWhenStabbed = false;
  bool shouldDisplayQuickHorror = false;
  bool shouldDisplayQuickLifePickup = false;
  bool shouldDisplayBandaidPickup = false;
  bool shouldDisplayJustPickedUpCannon = false;
  bool shouldShowCoinWinEffect = false;
  int ammunition = 20;
  bool fullyLoaded =
      true; // this is not being used? instead, there is a variable called rounds in magazine, which is set to 18 on reload and init
  bool showSkullBackground = false;
  bool shouldDisplayTimeIncrease = false;
  List<Widget> get cannons =>
      currentAmmoList; // i think cannons represent something dif from ammo?
  /// todo figure out what this cannons is and get rid of it

  List<Widget> currentAmmoList = [
    Ammo(
      path: 'iceCream1.png',
      height: 40.0,
      width: 40.0,
    )
  ];

  /// TODO - what is this?
  String cannonPath = 'yellowFireBall3.gif';
  int bulletIndex = 0;
  String bulletPath = '40mmCombo.gif';
  String nextBulletFilePath = 'fireball6.png';
  String _bullet_path_bottom_screen = '40mmBlackWhite.png';
  List get iceCreamBullets => _bullets_list;
  List<Widget> rotatingPickupWidgets = [];
  String bulletPath20mm = '20mmOrange.png';
  String pathToFortyMMBullet = '40mmOrange.png';
  String pathToColorChangingBullet = 'bulletCombo1.gif';
  int n1 = 0; // what is this?
  int growingGemProbabilityNumber = 3; // what is this?
  int amountOFBonusGemsEarnedViaGamePlay = 7;
  int roundsInMagazine = 18;
  bool triedFiringWhenOutOfAmmo = false;
  int indexToFireDifferentFishBullets = 0;
  int basePointsForHittingBarrier = 3;
  int comboHits = 0;
  int buildingHeight = 1;
  List<Widget> redGems = []; // define - still working out what these will be
  List<Widget> grenadesReady = []; // define
  List<Widget> extraLives = [
    Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/astronaut2.GIF'),
        ),
      ),
    ),
  ];

  /// default values are initial rounds displayed bottom of the view_box
  List<Widget> bulletsBottom1 = [
    MagazineBullet(bullet_path: 'greyFireBall.gif'),
    MagazineBullet(bullet_path: 'greyFireBall.gif'),
    MagazineBullet(bullet_path: 'greyFireBall.gif'),
    MagazineBullet(bullet_path: 'greyFireBall.gif'),
    MagazineBullet(bullet_path: 'greyFireBall.gif'),
    kblankIcon,
  ];

  List<Widget> bulletsBottom2 = [
    MagazineBullet(bullet_path: 'greyFireBall.gif'),
    MagazineBullet(bullet_path: 'greyFireBall.gif'),
    MagazineBullet(bullet_path: 'greyFireBall.gif'),
    MagazineBullet(bullet_path: 'greyFireBall.gif'),
    MagazineBullet(bullet_path: 'greyFireBall.gif'),
    MagazineBullet(bullet_path: 'greyFireBall.gif'),
    MagazineBullet(bullet_path: 'greyFireBall.gif'),
    MagazineBullet(bullet_path: 'greyFireBall.gif'),
    MagazineBullet(bullet_path: 'greyFireBall.gif'),
    MagazineBullet(bullet_path: 'greyFireBall.gif'),
    MagazineBullet(bullet_path: 'greyFireBall.gif'),
    MagazineBullet(bullet_path: 'greyFireBall.gif'),
    kblankIcon,
  ];

  List<GunfireColumns> gunShotColumns = [
    GunfireColumns(firePosition: -1),
    GunfireColumns(firePosition: -1),
    GunfireColumns(firePosition: -1),
    GunfireColumns(firePosition: -1),
    GunfireColumns(firePosition: -1),
    GunfireColumns(firePosition: -1),
    GunfireColumns(firePosition: -1),
    GunfireColumns(firePosition: -1),
    GunfireColumns(firePosition: -1),
    GunfireColumns(firePosition: -1),
    GunfireColumns(firePosition: -1),
    GunfireColumns(firePosition: -1),
    GunfireColumns(firePosition: -1),
  ];

  List<BulletWidget> _bullets_list = [
    BulletWidget(path: '40mmBlackWhite.png'),
    BulletWidget(path: '40mmOrange.png'),
    BulletWidget(path: '40mmGreen3.png'),
    BulletWidget(path: '40mmPink.png'),
    BulletWidget(path: '40mmBlue.png'),
    BulletWidget(path: '40mmRed.png'),
    BulletWidget(path: '40mmCombo.gif'),
    BulletWidget(path: 'greyFireBall.gif'),
  ];

  List<BulletContactCheckerColumns> bulletZombieContactGrid = [
    BulletContactCheckerColumns(potentialContactPosition: -1),
    BulletContactCheckerColumns(potentialContactPosition: -1),
    BulletContactCheckerColumns(potentialContactPosition: -1),
    BulletContactCheckerColumns(potentialContactPosition: -1),
    BulletContactCheckerColumns(potentialContactPosition: -1),
    BulletContactCheckerColumns(potentialContactPosition: -1),
    BulletContactCheckerColumns(potentialContactPosition: -1),
    BulletContactCheckerColumns(potentialContactPosition: -1),
    BulletContactCheckerColumns(potentialContactPosition: -1),
    BulletContactCheckerColumns(potentialContactPosition: -1),
    BulletContactCheckerColumns(potentialContactPosition: -1),
    BulletContactCheckerColumns(potentialContactPosition: -1),
  ];

  List<String> zombieHandsForOnScreenEffectWhenUserGrabsExtraLife = [
    'bbbbZombieReachBlackGreen.gif',
    'bbbbZombieReachGreenGreen.gif',
    'bbbbZombieReachPinkBlue.gif',
    'bbbbZombieReachRedGreen.gif',
    'bbbbZombieReachRedWhiteBlue.gif',
  ];

/*

DEFINITIONS:

      March 2025,

 */

  // void resetGame() {
  //   /// what about canceling the game speed timer?
  //   showADeadHand = false;
  //   displaySpeed = 100;
  //   amountOfTimeUserHitDoublePoints = 1;
  //   gameSpeed = 150000;
  //   bulletPath20mm = '20mmOrange.png';
  //   pathToFortyMMBullet = '40mmOrange.png';
  //   pathToColorChangingBullet = 'bulletCombo1.gif';
  //   soundModel.playOtherSounds('arcadeStartUp.mp3', hearSoundEffects);
  //   reloadGun2();
  //   bulletIndex = 0;
  //   bulletPath = _bullets_list[0].path;
  //   nextBulletFilePath = _bullets_list[1].path;
  //   currentAmmunition = AmmoType.orange;
  //   currentAmmoList = [
  //     Ammo(
  //       path: _bullets_list[0].path,
  //       height: 40.0,
  //       width: 40.0,
  //     )
  //   ];
  //   redGems = [];
  //   progressUpdate = '';
  //   // playerPosition = 5;
  //   score = 0;
  //   crashed = false;
  //   // startGun();
  //   grenadesReady = [];
  //   extraLives = [
  //     Container(
  //       height: 40.0,
  //       width: 40.0,
  //       decoration: BoxDecoration(
  //         image: DecorationImage(
  //           fit: BoxFit.cover,
  //           image: AssetImage(
  //             // 'images/thingWalkingStichedXXLeft.gif',
  //             'images/astronaut2.GIF',
  //           ),
  //         ),
  //       ),
  //     ),
  //   ];
  //   notifyListeners();
  // }

  //// PICKUPS EFFECTS

  void pickupSound() {
    p = Random().nextInt(100);
    // sound effects gun and 'shield' - which is an old idea for the gun shotgun upgrade
    if
        // Knife Pickup Power-Down
        (p == 4 || p == 7) {
      // _trackGemType = 'knife'.toUpperCase();
      // soundModel.knifeScrape(hearSoundEffects);
    }
    // Special Gun Pickup Power-up
    else if (p == 10 || p == 6) {
      // soundModel.playOtherSounds5x('magicSpell.mp3', hearSoundEffects);
    }
    // Ammo Upgrade Power-up
    else if (p == 1) {
      // soundModel.playOtherSounds5x('fuseSound.mp3', hearSoundEffects);
    }
    // Monster Power-down
    else if (p == 5) {
      // soundModel.playOtherSounds('1-21-23Warning.mp3', hearSoundEffects);
    } else if
        // Grenade Power-up
        (p == 8) {
      // soundModel.playOtherSounds5x('timerTicking.mp3', hearSoundEffects);
    }
    // Ammo type upgade
    else if (p == 3 || p == 2) {
      // soundModel.playOtherSounds5x('shieldPowerup.mp3', hearSoundEffects);
    } else if (p == 9) {
      // extra life
      soundModel.playOtherSounds5x('magicHum.mp3', hearSoundEffects);
    }
    notifyListeners();
  }

  void displayDoublePointsEffect() {
    updateGameBoyOpacity();
    amountOfTimeUserHitDoublePoints++;
    score = score + 1000;
    shouldDisplayDoublePointsEffects = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      shouldDisplayDoublePointsEffects = false;
      notifyListeners();
    });
  }

  void displayExplosionEffect1() {
    // score = score + 50;
    shouldDisplayExplosion1 = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      shouldDisplayExplosion1 = false;
      notifyListeners();
    });
  }

  void displayExplosionEffect2() {
    // score = score + 50;
    shouldDisplayExplosion2 = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      shouldDisplayExplosion2 = false;
      notifyListeners();
    });
  }

  void displayBloodSplatEffect() {
    // score = score + 50;
    shouldDisplayBloodSplatQuick = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      shouldDisplayBloodSplatQuick = false;
      notifyListeners();
    });
  }

  void displayKnifeDefenseEffect() {
    // score = score + 50;
    userCannotDieRightNow = true;
    quickCantDieTime();
    shouldDisplayKnifeDefense = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      shouldDisplayKnifeDefense = false;
      notifyListeners();
    });
  }

  void displayLifeLossWhenStabbedEffect() {
    // score = score + 50;
    displayLifeLossWhenStabbed = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      displayLifeLossWhenStabbed = false;
      notifyListeners();
    });
  }

  void displayMonsterPickupEffect() {
    // score = score + 50;
    shouldDisplayQuickHorror = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      shouldDisplayQuickHorror = false;
      notifyListeners();
    });
  }

  void displayLifePickupEffect() {
    // score = score + 50;
    shouldDisplayQuickLifePickup = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      shouldDisplayQuickLifePickup = false;
      notifyListeners();
    });
  }

  void displayBloodPickupEffect() {
    // score = score + 50;
    shouldDisplayBandaidPickup = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      shouldDisplayBandaidPickup = false;
      notifyListeners();
    });
  }

  void displayCoinWinEffect() {
    // score = score + 10;
    shouldShowCoinWinEffect = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      shouldShowCoinWinEffect = false;
      notifyListeners();
    });
  }

  /// TODO moved to game engine - must find rest of logic to clear errors in game engine
  // void upgradeAmmo() {
  //   if (bulletIndex < _bullets_list.length - 1) {
  //     // will this prevent us walking off index
  //     // gunUpgradePickupEffect();
  //     bulletIndex++;
  //     bulletPath = _bullets_list[bulletIndex].path;
  //     _bullet_path_bottom_screen = _bullets_list[bulletIndex].path;
  //     nextBulletFilePath = _bullets_list[bulletIndex + 1].path;
  //   } else {
  //     nextBulletFilePath = _bullets_list[_bullets_list.length - 1].path;
  //     shouldDisplayJustPickedUpCannon = true;
  //     notifyListeners();
  //     Future.delayed(Duration(milliseconds: 1200), () {
  //       shouldDisplayJustPickedUpCannon = false;
  //       notifyListeners();
  //     });
  //   }
  // }

  /// time bomb
  void displayGrenadeEffect() {
    soundModel.playOtherSounds5x('customExplosion.mp3', hearSoundEffects);
    displayDoublePointsEffect();
    displayExplosionEffect1();
    grenadesReady.removeAt(grenadesReady.length - 1);
    // explodeBuildingsWithDisplayNotPowerUps();
    notifyListeners();
  }

  void fireCrystalBallTimeDecrease() {
    gameSpeed = gameSpeed - 10000;
    displaySpeed = displaySpeed + 100;
    // score = score + 50;
    shouldDisplayTimeIncrease = true;
    displayDoublePointsEffect();
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      shouldDisplayTimeIncrease = false;
      notifyListeners();
    });
  }

  void reloadGun() {
    fullyLoaded = !fullyLoaded;
    notifyListeners();
  }

  void reloadGun2() {
    triedFiringWhenOutOfAmmo = false;
    soundModel.playReloadSound(hearSoundEffects);
    roundsInMagazine = 18;
    bulletsBottom1 = [
      MagazineBullet(bullet_path: _bullet_path_bottom_screen),
      MagazineBullet(bullet_path: _bullet_path_bottom_screen),
      MagazineBullet(bullet_path: _bullet_path_bottom_screen),
      MagazineBullet(bullet_path: _bullet_path_bottom_screen),
      MagazineBullet(bullet_path: _bullet_path_bottom_screen),
      MagazineBullet(bullet_path: _bullet_path_bottom_screen),
      kblankIcon,
    ];
    bulletsBottom2 = [
      MagazineBullet(bullet_path: _bullet_path_bottom_screen),
      MagazineBullet(bullet_path: _bullet_path_bottom_screen),
      MagazineBullet(bullet_path: _bullet_path_bottom_screen),
      MagazineBullet(bullet_path: _bullet_path_bottom_screen),
      MagazineBullet(bullet_path: _bullet_path_bottom_screen),
      MagazineBullet(bullet_path: _bullet_path_bottom_screen),
      MagazineBullet(bullet_path: _bullet_path_bottom_screen),
      MagazineBullet(bullet_path: _bullet_path_bottom_screen),
      MagazineBullet(bullet_path: _bullet_path_bottom_screen),
      MagazineBullet(bullet_path: _bullet_path_bottom_screen),
      MagazineBullet(bullet_path: _bullet_path_bottom_screen),
      MagazineBullet(bullet_path: _bullet_path_bottom_screen),
      kblankIcon,
    ];
    fullyLoaded = true;
    notifyListeners();
  }

  /// TODO moved to game engine - must find rest of logic to clear errors in game engine
  //
  // void pointsForHittingPerCannonType() {
  //   if (crashed == false) {
  //     if (isPaused == false) {
  //       if (currentAmmunition == AmmoType.orange) {
  //         if (shouldDisplayDoublePointsEffects == false) {
  //           basePointsForHittingBarrier = 3;
  //           score = score + (3 * amountOfTimeUserHitDoublePoints);
  //         } else {
  //           score = score + (6 * amountOfTimeUserHitDoublePoints);
  //           basePointsForHittingBarrier = 6;
  //         }
  //         notifyListeners();
  //       } else if (currentAmmunition == AmmoType.yellow) {
  //         if (shouldDisplayDoublePointsEffects == false) {
  //           basePointsForHittingBarrier = 7;
  //           score = score + (7 * amountOfTimeUserHitDoublePoints);
  //         } else {
  //           score = score + (14 * amountOfTimeUserHitDoublePoints);
  //           basePointsForHittingBarrier = 14;
  //         }
  //         notifyListeners();
  //       } else if (currentAmmunition == AmmoType.blue) {
  //         if (shouldDisplayDoublePointsEffects == false) {
  //           basePointsForHittingBarrier = 12;
  //           score = score + (12 * amountOfTimeUserHitDoublePoints);
  //         } else {
  //           score = score + (24 * amountOfTimeUserHitDoublePoints);
  //           basePointsForHittingBarrier = 24;
  //         }
  //         notifyListeners();
  //       } else if (currentAmmunition == AmmoType.purple) {
  //         if (shouldDisplayDoublePointsEffects == false) {
  //           basePointsForHittingBarrier = 18;
  //           score = score + (18 * amountOfTimeUserHitDoublePoints);
  //         } else {
  //           basePointsForHittingBarrier = 36;
  //           score = score + (36 * amountOfTimeUserHitDoublePoints);
  //         }
  //         notifyListeners();
  //       } else if (currentAmmunition == AmmoType.flashing) {
  //         if (shouldDisplayDoublePointsEffects == false) {
  //           basePointsForHittingBarrier = 25;
  //           score = score + (25 * amountOfTimeUserHitDoublePoints);
  //         } else {
  //           basePointsForHittingBarrier = 50;
  //           score = score + (50 * amountOfTimeUserHitDoublePoints);
  //         }
  //         notifyListeners();
  //       } else if (currentAmmunition == AmmoType.black) {
  //         if (shouldDisplayDoublePointsEffects == false) {
  //           basePointsForHittingBarrier = 35;
  //           score = score + (35 * amountOfTimeUserHitDoublePoints);
  //         } else {
  //           basePointsForHittingBarrier = 70;
  //           score = score + (70 * amountOfTimeUserHitDoublePoints);
  //         }
  //         notifyListeners();
  //       } else if (currentAmmunition == AmmoType.white) {
  //         if (shouldDisplayDoublePointsEffects == false) {
  //           basePointsForHittingBarrier = 45;
  //           score = score + (45 * amountOfTimeUserHitDoublePoints);
  //         } else {
  //           basePointsForHittingBarrier = 90;
  //           score = score + (90 * amountOfTimeUserHitDoublePoints);
  //         }
  //         notifyListeners();
  //       }
  //     }
  //     notifyListeners();
  //   }
  // }
  //
  // void handleComboHitsMessageAndHoldTripleHit() {
  //   if (comboHits < 3) {
  //     comboHits++;
  //     if (comboHits == 2) {
  //       soundModel.playOtherThree('metalPlinkOne.mp3', hearSoundEffects);
  //       Future.delayed(Duration(milliseconds: 1200), () {
  //         comboHits = 0;
  //         notifyListeners();
  //       });
  //       // soundModel.playOtherFour('metalPlinkThree.mp3');
  //     }
  //     if (comboHits >= 3) {
  //       displayDoublePointsEffect();
  //       soundModel.playOtherFive('tipleKill.mp3', hearSoundEffects);
  //       soundModel.playOtherFour('metalPlinkThree.mp3', hearSoundEffects);
  //       Future.delayed(Duration(milliseconds: 1200), () {
  //         comboHits = 0;
  //         notifyListeners();
  //       });
  //     }
  //   } else {
  //     Future.delayed(Duration(milliseconds: 1200), () {
  //       comboHits = 0;
  //       notifyListeners();
  //     });
  //   }
  // }

  void turnOnSoundEffects() {
    hearSoundEffects = true;
    notifyListeners();
  }

  void turnOffSoundEffects() {
    hearSoundEffects = false;
    notifyListeners();
  }

  void setBackgroundMusicToFalse() {
    hearBackgroundMusic = false;
    notifyListeners();
  }

  void setBackgroundMusicToTrue() {
    hearBackgroundMusic = true;
    notifyListeners();
  }

  // used for an effect? Maybe called during explosion to change the colors of the console?
  void updateGameBoyOpacity() {
    for (var i = 0; i < 12; i++) {
      int delay = i * 100;
      int _evenOrOdd = 2;
      Timer(Duration(milliseconds: delay), () {
        opacityOfBlackGameBoy = (Random().nextInt(3) + 1) / 10;
        _evenOrOdd = Random().nextInt(4) + 1;
        if (_evenOrOdd == 2) {
          purpleGameBoy = true;
        } else if (_evenOrOdd == 1) {
          redGameBoyInsteadOfYellow = true;
          purpleGameBoy = false;
          silverGameBoy = false;
        } else if (_evenOrOdd == 4) {
          silverGameBoy = true;
          purpleGameBoy = false;
          redGameBoyInsteadOfYellow = false;
        } else {
          redGameBoyInsteadOfYellow = false;
          purpleGameBoy = false;
          silverGameBoy = false;
        }
        notifyListeners();
      });
    }
  }

  void updateZombiePath() {
    /*

  Effect on view_box when a life is picked up
  Hand comes from the bottom of the view_box like a zombie reaching
  out of a grave when it comes back alive


   */

    if (iterateThroughZombieHandList <
        zombieHandsForOnScreenEffectWhenUserGrabsExtraLife.length - 1) {
      iterateThroughZombieHandList++;
    } else {
      iterateThroughZombieHandList = 0;
    }
    lifePickupScreenEffectPath =
        zombieHandsForOnScreenEffectWhenUserGrabsExtraLife[
            iterateThroughZombieHandList];
    notifyListeners();
  }

  void quickCantDieTime() {
    Future.delayed(Duration(milliseconds: 1200), () {
      userCannotDieRightNow = false;
      notifyListeners();
    });
  }

  // TODO Is this in use and meaningful?
  void updateProgressMessage() {
    if (score > 20 && score < 25) {
      progressUpdate = 'wow!';
      // increaseGameSpeed();
      notifyListeners();
    } else if (score > 25 && score < 49) {
      progressUpdate = '';
      notifyListeners();
    } else if (score > 50 && score < 55) {
      progressUpdate = 'super!';
      // increaseGameSpeed();
      notifyListeners();
    } else if (score > 55 && score < 74) {
      progressUpdate = '';
      notifyListeners();
    } else if (score > 75 && score < 80) {
      progressUpdate = 'WHOA!!';
      // increaseGameSpeed();
      notifyListeners();
    } else if (score > 80 && score < 100) {
      progressUpdate = '';
      notifyListeners();
    } else if (score > 100 && score < 105) {
      progressUpdate = 'YAAAA!!';
      // increaseGameSpeed();
      notifyListeners();
    } else if (score > 105) {
      progressUpdate = '';
      notifyListeners();
    }
  }
}
