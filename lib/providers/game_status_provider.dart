import 'dart:async';
import 'dart:math';

import 'package:flappy_taco/constants.dart';
import 'package:flappy_taco/widgets/bullet_for_magazine_widget.dart';
import 'package:flappy_taco/widgets/cannon_contact_effect_Columns.dart';
import 'package:flappy_taco/widgets/hell_fire_columns.dart';
import 'package:flappy_taco/widgets/ice_cream_bullet.dart';
import 'package:flappy_taco/widgets/screen_building_blocks/building_widget.dart';
import 'package:flappy_taco/widgets/selected_winnables/selected_grendade_widget.dart';
import 'package:flutter/material.dart';

import '../models/sound_model.dart';
import '../widgets/rotating_icecream_bullet_widget.dart';

/// once the wav files were replaced by the mp3
/// the app began to freeze very hard
/// i had also built a bunch more sound players
///
/// this solution was supposed to prevent freezing
///
/// but it seemed to make the freezing problem happen

enum CannonType {
  orange,
  blue,
  yellow,
  purple,
  flashing,
  white,
  black,
}

enum AmmoType {
  orange,
  blue,
  yellow,
  purple,
  flashing,
  white,
  black,
}

enum LastGamePlayButton {
  climb,
  jump,
  dive,
}

SoundModel soundModel = SoundModel();

class GameStatusProvider with ChangeNotifier {
  /// start the taco position at 6 near center
  int _handPosition = 5;
  int get handPosition => _handPosition;
  LastGamePlayButton _lastCommand = LastGamePlayButton.climb;
  LastGamePlayButton get lastCommand => _lastCommand;

  /// position 10 and 11 are not accessible for the hand
  /// 1, 2, 3 , 4, 5, 6, 7, 8, 9 , 10
  AmmoType _currentAmmunition = AmmoType.orange;
  AmmoType get currentAmmunition => _currentAmmunition;
  bool _hearSoundEffects = true;
  bool get hearSoundEffects => _hearSoundEffects;
  double _opacityOfBlackGameBoy = 1.0;
  double get opacityOfBlackGameBoy => _opacityOfBlackGameBoy;
  bool _redGameBoyInsteadOfYellow = false;
  bool get redGameBoyInsteadOfYellow => _redGameBoyInsteadOfYellow;
  bool _purpleGameBoy = false;
  bool _silverGameBoy = false;
  bool get silverGameBoy => _silverGameBoy;
  bool get purpleGameBoy => _purpleGameBoy;
  bool _hearBackgroundMusic = true;
  bool get hearBackgroundMusic => _hearBackgroundMusic;
  bool _isClimbing = false;
  bool get isClimbing => _isClimbing;
  bool _showADeadHand = false;
  bool get showADeadHand => _showADeadHand;
  //// list of zombie hands
  List<String> _zombieHandsForOnScreenEffectWhenUserGrabsExtraLife = [
    // 'bbbbInvertZombieHandReach.gif',
    // 'bbbbZombieReachBlackBlueGreen.gif',
    'bbbbZombieReachBlackGreen.gif',
    'bbbbZombieReachGreenGreen.gif',
    'bbbbZombieReachPinkBlue.gif',
    'bbbbZombieReachRedGreen.gif',
    'bbbbZombieReachRedWhiteBlue.gif',
  ];
  int _iterateThroughZombieHandList = 0;
  String _pathToZombieHandReach = 'bbbbZombieReachRedWhiteBlue.gif';
  String get pathToZombieHandReach => _pathToZombieHandReach;
  String _progressMessage = '';
  String get progressMessage => _progressMessage;
  bool _crashed = true;
  bool get crashed => _crashed;
  bool _userCantDie = false;
  int _gemPosition = 0;
  String _trackGemType = 'red';

  /// set crashed = true if the user crashed into a knife without any knife defense
  /// if the did have a knife, decrease the value
  ///
  ///
  bool _shouldDisplayDoublePointsEffects = false;
  bool get shouldDisplayDoublePointsEffects =>
      _shouldDisplayDoublePointsEffects;
  int _amountOfTimeUserHitDoublePoints = 1;
  int get amountOfTimeUserHitDoublePoints => _amountOfTimeUserHitDoublePoints;
  bool _isPaused = true;
  bool get isPaused => _isPaused;
  int buildingSpace = 0;
  bool shouldMakeUpsideDownBuilding = false;
  int _score = 0;
  int get score => _score;
  int _gameSpeed = 200000;
  int _reverseGameSpeedToDisplayForUserAsTheyProgress = 100;
  int get reverseGameSpeedToDisplayForUserAsTheyProgress =>
      _reverseGameSpeedToDisplayForUserAsTheyProgress;
  bool _shouldDisplayExplosion1 = false;
  bool get shouldDisplayExplosion1 => _shouldDisplayExplosion1;
  bool _shouldDisplayExplosion2 = false;
  bool get shouldDisplayExplosion2 => _shouldDisplayExplosion2;
  bool _shouldDisplayBloodSplatQuick = false;
  bool get shouldDisplayBloodSplatQuick => _shouldDisplayBloodSplatQuick;
  bool _shouldDisplayKnifeDefense = false;
  bool get shouldDisplayKnifeDefense => _shouldDisplayKnifeDefense;
  bool
      _shouldDisplayLossALifeAndNotAGameOverAndNotAKnifeDefenseDueToBeingStabbed =
      false;
  bool get shouldDisplayLossALifeAndNotAGameOverAndNotAKnifeDefenseDueToBeingStabbed =>
      _shouldDisplayLossALifeAndNotAGameOverAndNotAKnifeDefenseDueToBeingStabbed;
  bool _shouldDisplayQuickHorror = false;
  bool get shouldDisplayQuickHorror => _shouldDisplayQuickHorror;
  bool _shouldDisplayQuickLifePickup = false;
  bool get shouldDisplayQuickLifePickup => _shouldDisplayQuickLifePickup;
  bool _shouldDisplayBandaidPickup = false;
  bool get shouldDisplayBandaidPickup => _shouldDisplayBandaidPickup;
  bool _shouldDisplayJustPickedUpCannon = false;
  bool get shouldDisplayJustPickedUpCannon => _shouldDisplayJustPickedUpCannon;
  bool _shouldShowCoinWinEffect = false;
  bool get shouldShowCoinWinEffect => _shouldShowCoinWinEffect;

  /// this is not being used?
  /// instead, there is a variable called rounds in magazine, which is set to 18 on reload and init
  int _ammunition = 20;
  int get ammunition => _ammunition;
  bool _fullyLoaded = true;
  bool get fullyLoaded => _fullyLoaded;
  bool _showBeastBackground = false;
  bool get showSkullBackground => _showBeastBackground;
  bool _shouldDisplayTimeIncrease = false;
  bool get shouldDisplayTimeIncrease => _shouldDisplayTimeIncrease;
  List<Widget> get cannons => _cannons;
  bool _shouldGetDoublePoints = false;
  String _cannonPath = 'yellowFireBall3.gif';
  String get cannonPath => _cannonPath;
  int _iceCreamBulletIndex = 0;
  int get iceCreamBulletIndex => _iceCreamBulletIndex;
  String _iceCreamBulletPath = 'iceCream1.png';
  String get iceCreamBulletPath => _iceCreamBulletPath;
  String _nextIceCreamBulletPath = 'iceCream2.png';
  String get nextIceCreamBulletPath => _nextIceCreamBulletPath;
  String _iceCreamBulletPathForMagazine = 'iceCream1x.png';
  List get iceCreamBullets => _iceCreamBullets;
  List<Widget> _rotatingIceCreamPickups = [];
  List<Widget> get rotatingIceCreamPickups => _rotatingIceCreamPickups;
  String _pathToTwentyMMBullet = '20mmOrange.png';
  String get pathToTwentyMMBullet => _pathToTwentyMMBullet;
  String _pathToFortyMMBullet = '40mmOrange.png';
  String get pathToFortyMMBullet => _pathToFortyMMBullet;
  String _pathToColorChangingBullet = 'bulletCombo1.gif';
  String get pathToColorChangingBullet => _pathToColorChangingBullet;
  int _number = 0;
  int _amountOFBonusGemsEarnedViaGamePlay = 7;
  int _growingNmber = 3;
  int get amountOFBonusGemsEarnedViaGamePlay =>
      _amountOFBonusGemsEarnedViaGamePlay;
  CannonType _currentCannon = CannonType.orange;
  CannonType get currentCannon => _currentCannon;
  int _roundsInMagazine = 18;
  int get roundsInMagazine => _roundsInMagazine;
  bool _shouldPlayReloadVoiceWarning = false;
  bool _triedFiringWhenOutOfAmmo = false;
  bool get triedFiringWhenOutOfAmmo => _triedFiringWhenOutOfAmmo;
  int _indexToFireDifferentFishBullets = 0;
  int get indexToFireDifferentFishBullets => _indexToFireDifferentFishBullets;
  bool _shouldNotTellHellFireToCancelTimer = true;
  int _basePointsForHittingBarrier = 3;
  int get basePointsForHittingBarrier => _basePointsForHittingBarrier;
  int _comboHits = 0;
  int get comboHits => _comboHits;
  int buildingHeight = 1;

  /// game speed is not going faster
  /// because the timer needs to be canceled, and a new timer created which moves faster
  // void increaseGameSpeed() {
  //   /// cancel previous timer
  //   /// create a new timer, faster
  //   /// check for game over, and move the buildings, create new ones, destroy at index 0, etc.
  //   // int speed = 150;
  //   gameSpeedTimer.cancel();
  //   _gameSpeed = _gameSpeed - 10;
  //   startGame();
  // }
  // void increaseSpeedEveryTenSeconds() {
  //   var timer = Timer.periodic(Duration(seconds: 10), (timer) {
  //     increaseGameSpeed();
  //   });
  // }
  BuildingWidget theLast = BuildingWidget(
    buildingHeight: 0,
    powerUpPosition: 0,
  );
  BuildingWidget secondToLast = BuildingWidget(
    buildingHeight: 0,
    powerUpPosition: 0,
  );
  List<BuildingWidget> buildings = [
    /// 5 empty buildings

    BuildingWidget(
      buildingHeight: 0,
      powerUpPosition: 0,
    ),
    BuildingWidget(
      buildingHeight: 0,
      powerUpPosition: 0,
    ),
    BuildingWidget(
      buildingHeight: 0,
      powerUpPosition: 0,
    ),
    BuildingWidget(
      buildingHeight: 0,
      powerUpPosition: 0,
    ),
    BuildingWidget(
      buildingHeight: 0,
      powerUpPosition: 0,
    ),
    BuildingWidget(
      buildingHeight: 0,
      powerUpPosition: 0,
    ),
    BuildingWidget(
      buildingHeight: 0,
      powerUpPosition: 0,
    ),
    BuildingWidget(
      buildingHeight: 0,
      powerUpPosition: 0,
    ),
    BuildingWidget(
      buildingHeight: 0,
      powerUpPosition: 0,
    ),
    BuildingWidget(
      buildingHeight: 0,
      powerUpPosition: 0,
    ),
    BuildingWidget(
      buildingHeight: 0,
      powerUpPosition: 0,
    ),
    BuildingWidget(
      buildingHeight: 0,
      powerUpPosition: 0,
    ),
    BuildingWidget(
      buildingHeight: 0,
      powerUpPosition: 0,
    ),
  ];

  int chooseRandomHeight() {
    /// creates and returns a random int between 1-5
    return Random().nextInt(12) + 0;
  }

  Timer gameSpeedTimer =
      Timer.periodic(Duration(microseconds: 150000), (timer) {});
  // 1.5 seconds

  List<Widget> redGems = [];

  List<Widget> colorGems = [];

  List<Widget> extraLives = [kExtraLife];

  List<Widget> flames = [
    // CannonAmmunition(),
    // CannonAmmunition(),
    // CannonAmmunition(),
    // CannonAmmunition(),
    // CannonAmmunition(),
    // CannonAmmunition(),

    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    kblankIcon,
  ];

  List<Widget> flamesSecond = [
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    kblankIcon,
  ];

  List<Widget> nukeList = [];

  List<Widget> _cannons = [
    RotatingIcecreamBullet(
      path: 'iceCream1.png',
      height: 40.0,
      width: 40.0,
    )
  ];
  List<IceCreamBullet> _iceCreamBullets = [
    IceCreamBullet(iceCreamPath: 'iceCream1.png'),
    IceCreamBullet(iceCreamPath: 'iceCream2.png'),
    IceCreamBullet(iceCreamPath: 'iceCream3.png'),
    IceCreamBullet(iceCreamPath: 'iceCream4.png'),
    IceCreamBullet(iceCreamPath: 'iceCream5.png'),
    IceCreamBullet(iceCreamPath: 'iceCream6.png'),
    IceCreamBullet(iceCreamPath: 'iceCream8.png'),
    IceCreamBullet(iceCreamPath: 'iceCream7.png'),
    IceCreamBullet(iceCreamPath: 'iceCreamXXX.gif'),
  ];

  List<IceCreamBulletForMagazine> _iceCreamRoundsForMagazine = [
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream1x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream2x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream3x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream4x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream5x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream6x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream7x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream8x.png'),
    IceCreamBulletForMagazine(iceCreamPath: 'iceCream9X.gif'),
  ];
  List<HellFireContactColumns> contactGrid = [
    HellFireContactColumns(potentialContactPosition: -1),
    HellFireContactColumns(potentialContactPosition: -1),
    HellFireContactColumns(potentialContactPosition: -1),
    HellFireContactColumns(potentialContactPosition: -1),
    HellFireContactColumns(potentialContactPosition: -1),
    HellFireContactColumns(potentialContactPosition: -1),
    HellFireContactColumns(potentialContactPosition: -1),
    HellFireContactColumns(potentialContactPosition: -1),
    HellFireContactColumns(potentialContactPosition: -1),
    HellFireContactColumns(potentialContactPosition: -1),
    HellFireContactColumns(potentialContactPosition: -1),
    HellFireContactColumns(potentialContactPosition: -1),
  ];

  void resetScore() {
    _score = 0;
    notifyListeners();
  }

  void pauseGame() {
    _showADeadHand = true;
    _isPaused = true;
    notifyListeners();
  }

  void resumeGame() {
    _isPaused = false;
    notifyListeners();
  }

  void start() {
    _isPaused = false;
    // _showADeadHand = false;
    startGame();

    notifyListeners();
  }

  void cancelGameSpeedTimerToCreateANewOne() {
    gameSpeedTimer.cancel();

    _number = Random().nextInt(_growingNmber);
    if (_number > 1) {
      /// that's the magic number add a gem!
      _amountOFBonusGemsEarnedViaGamePlay =
          _amountOFBonusGemsEarnedViaGamePlay + 3;
      // notifyListeners();
    }

    /// was 150, reset it to 100 - game play was speeding up to fast
    _gameSpeed = _gameSpeed - 100;
    _reverseGameSpeedToDisplayForUserAsTheyProgress =
        _reverseGameSpeedToDisplayForUserAsTheyProgress + 2;
    print('game speed is = $_gameSpeed');
    startGame();
  }

  /// this is the game loop, gamespeedtimer is essentially a loop, creating buildings and increasing speed as game play happens over time
  /// to stop the loop, we can call cancel the timer from outside of this function
  void startGame() {
    // increaseSpeedEveryTenSeconds();
    _showADeadHand = false;

    /// here we should probably cancel the previous timer if one exists
    /// game was crashing at end... this may be why
    gameSpeedTimer =
        Timer.periodic(Duration(microseconds: _gameSpeed), (timer) {
      if (_crashed == false) {
        /// make game speed up as you play
        // _gameSpeed--;
        // print('game spped $_gameSpeed');
        updateProgressMessage();
        if (_isPaused == false) {
          _score = _score + (1 * _amountOfTimeUserHitDoublePoints);

          if (buildingSpace >= 3) {
            createBuilding();
            contactWithPowerUpChecker();
            checkForBadPowerUps();
            // contactWithPowerUpCheckerIndex1();
            buildingSpace = 0;
            cancelGameSpeedTimerToCreateANewOne();
          } else {
            buildingSpace++;

            createEmptyBuildingSpace();
            contactWithPowerUpChecker();
            checkForBadPowerUps();

            notifyListeners();
          }
        }
      } else {
        timer.cancel();
        print('canceling building creation timer');
      }
    });
    notifyListeners();
  }

  void gameOver() {
    int obstacleHeight = buildings[0].buildingHeight;
    // _hellFireIsActive = false;
    if (_userCantDie == false) {
      if (obstacleHeight <= 5) {
        if (_handPosition <= obstacleHeight + 1) {
          if (extraLives.isNotEmpty == true) {
            soundModel.playOtherSounds('femaleDeath.mp3', _hearSoundEffects);
            _userCantDie = true;
            tinyAmountOfTimeForInvinsibility();
            extraLives.removeAt(extraLives.length - 1);
            fireBloodSplatQuick();
            notifyListeners();
          } else if (extraLives.isEmpty == true) {
            /// first thing that we should do is cancel the game speed timer
            print('should play game over sounds - crashed in bottom');
            soundModel.gameOver(hearSoundEffects);
            fireQuickHorror();

            _crashed = true;
            _showADeadHand = true;

            notifyListeners();
          }
        }
      } else if (obstacleHeight >= 6) {
        print('obstance hight from top $obstacleHeight');
        if (_handPosition >= obstacleHeight - 1) {
          if (extraLives.isNotEmpty == true) {
            soundModel.playOtherEight('femaleDeath.mp3', _hearSoundEffects);
            fireBloodSplatQuick();

            _userCantDie = true;
            tinyAmountOfTimeForInvinsibility();
            extraLives.removeAt(extraLives.length - 1);
            notifyListeners();
          }

          /// one wiggle room for top buildlings
          else if (extraLives.isEmpty == true) {
            /// this is when user dies by hitting a top building
            fireQuickHorror();

            _crashed = true;
            // _isClimbing = true;
            _showADeadHand = true;
            print('should play game over sounds - crashed in top');
            soundModel.gameOver(hearSoundEffects);

            notifyListeners();
          }
        }
      }
    }
  }

  void turnOnSoundEffects() {
    _hearSoundEffects = true;
    notifyListeners();
  }

  void turnOffSoundEffects() {
    _hearSoundEffects = false;
    notifyListeners();
  }

  void setBackgroundMusicToFalse() {
    _hearBackgroundMusic = false;
    notifyListeners();
  }

  void setBackgroundMusicToTrue() {
    _hearBackgroundMusic = true;
    notifyListeners();
  }

  void updateGameBoyOpacity() {
    for (var i = 0; i < 12; i++) {
      int delay = i * 100;
      int _evenOrOdd = 2;
      Timer(Duration(milliseconds: delay), () {
        _opacityOfBlackGameBoy = (Random().nextInt(3) + 1) / 10;
        _evenOrOdd = Random().nextInt(4) + 1;
        if (_evenOrOdd == 2) {
          _purpleGameBoy = true;
        } else if (_evenOrOdd == 1) {
          _redGameBoyInsteadOfYellow = true;
          _purpleGameBoy = false;
          _silverGameBoy = false;
        } else if (_evenOrOdd == 4) {
          _silverGameBoy = true;
          _purpleGameBoy = false;
          _redGameBoyInsteadOfYellow = false;
        } else {
          _redGameBoyInsteadOfYellow = false;
          _purpleGameBoy = false;
          _silverGameBoy = false;
        }
        notifyListeners();
      });
    }
  }

  /// this is for the effect on screen when a life is picked up a hand comes from the bottom of the screen like a zombie reaching oout of a grave when it comes back alive
  void updateZombiePath() {
    if (_iterateThroughZombieHandList <
        _zombieHandsForOnScreenEffectWhenUserGrabsExtraLife.length - 1) {
      _iterateThroughZombieHandList++;
    } else {
      _iterateThroughZombieHandList = 0;
    }
    _pathToZombieHandReach =
        _zombieHandsForOnScreenEffectWhenUserGrabsExtraLife[
            _iterateThroughZombieHandList];
    notifyListeners();
  }

  void resetGame() {
    /// what about canceling the game speed timer?
    _showADeadHand = false;
    _reverseGameSpeedToDisplayForUserAsTheyProgress = 100;
    _amountOfTimeUserHitDoublePoints = 1;
    _gameSpeed = 150000;
    _pathToTwentyMMBullet = '20mmOrange.png';
    _pathToFortyMMBullet = '40mmOrange.png';

    _pathToColorChangingBullet = 'bulletCombo1.gif';

    soundModel.playOtherSounds('arcadeStartUp.mp3', _hearSoundEffects);
    resetHellFireColumns();
    resetHellFireContactLocations();
    reloadHellFire();
    _iceCreamBulletIndex = 0;
    _iceCreamBulletPath = _iceCreamBullets[_iceCreamBulletIndex].iceCreamPath;

    _nextIceCreamBulletPath =
        _iceCreamBullets[_iceCreamBulletIndex + 1].iceCreamPath;

    _currentAmmunition = AmmoType.orange;
    _currentCannon = CannonType.orange;
    _cannons = [
      RotatingIcecreamBullet(
        path: _iceCreamBullets[0].iceCreamPath,
        height: 40.0,
        width: 40.0,
      )
    ];
    // _shouldNotTellHellFireToCancelTimer = true;
    hellFirePowerUp();
    // moveHellFire();
    nukeList = [];
    // flames = [];
    extraLives = [kExtraLife];
    redGems = [];
    colorGems = [];
    _progressMessage = '';
    _handPosition = 5;
    _score = 0;
    _crashed = false;
    resetBuildings();
    notifyListeners();
  }

  void resetBuildings() {
    buildings = [
      BuildingWidget(
        buildingHeight: 0,
        powerUpPosition: 0,
      ),
      BuildingWidget(
        buildingHeight: 0,
        powerUpPosition: 0,
      ),
      BuildingWidget(
        buildingHeight: 0,
        powerUpPosition: 0,
      ),
      BuildingWidget(
        buildingHeight: 0,
        powerUpPosition: 0,
      ),
      BuildingWidget(
        buildingHeight: 0,
        powerUpPosition: 0,
      ),
      BuildingWidget(
        buildingHeight: 0,
        powerUpPosition: 0,
      ),
      BuildingWidget(
        buildingHeight: 0,
        powerUpPosition: 0,
      ),
      BuildingWidget(
        buildingHeight: 0,
        powerUpPosition: 0,
      ),
      BuildingWidget(
        buildingHeight: 0,
        powerUpPosition: 0,
      ),
      BuildingWidget(
        buildingHeight: 0,
        powerUpPosition: 0,
      ),
      BuildingWidget(
        buildingHeight: 0,
        powerUpPosition: 0,
      ),
      BuildingWidget(
        buildingHeight: 0,
        powerUpPosition: 0,
      ),
      BuildingWidget(
        buildingHeight: 0,
        powerUpPosition: 0,
      ),
    ];
  }

  // void moveHellFireContact() {
  //   hellFireColumns.removeAt(hellFireColumns.length - 1);
  //
  //   hellFireColumns.insert(
  //       0,
  //       HellFirePowerUpColumns(
  //         firePosition: -1,
  //       ));
  //
  //   notifyListeners();
  // }

  void handClimb() {
    if (_isPaused == false) {
      /// when user taps, let the taco climb
      if (_handPosition < 10) {
        if (_crashed == false) {
          // soundModel.playOtherEight('jumpSwipe.mp3');
          // soundModel.playOtherNine('splatDeath.mp3');
          soundModel.playTapSound(_hearSoundEffects);

          _isClimbing = true;
          _lastCommand = LastGamePlayButton.climb;

          /// let the user jump through to pickup powerups
          _handPosition++;
          _handPosition++;
          // _handPosition = _handPosition + 2;
          // gameOver();

          notifyListeners();
        }
      }
    }

    gameOver();
  }

  void handJump() {
    if (_isPaused == false) {
      //// now every time the hand jumps resources will be disposed
      soundModel.playTapSound(_hearSoundEffects);
      // soundModel.playOtherSounds('wingsNewTwo.mp3', _hearSoundEffects);

      /// when user taps, let the taco climb
      if (_handPosition <= 7) {
        if (_crashed == false) {
          _lastCommand = LastGamePlayButton.jump;
          _isClimbing = true;
          _handPosition++;
          _handPosition++;
          _handPosition++;
          _handPosition++;
          // _handPosition = _handPosition + 4;
          // gameOver();

          notifyListeners();
        }
      } else {
        if (_crashed == false) {
          _isClimbing = true;
          _handPosition++;
          _handPosition++;
          _handPosition++;
          _handPosition++;
          if (_handPosition > 11) {
            _handPosition = 11;
          }
          // _handPosition = 11;
          notifyListeners();
        }
      }
      gameOver();
    }
  }

  void handDive() {
    if (_isPaused == false) {
      soundModel.playOtherSeven('sciFiDive.mp3', _hearSoundEffects);

      /// when user taps, let the taco climb
      if (_handPosition <= 4) {
        if (_crashed == false) {
          _lastCommand = LastGamePlayButton.dive;
          _isClimbing = false;
          // _handPosition = 1;
          _handPosition--;
          _handPosition--;
          _handPosition--;
          if (_handPosition < 1) {
            _handPosition = 1;
          }
          // gameOver();
          notifyListeners();
        }
      } else {
        if (_crashed == false) {
          _isClimbing = false;
          _handPosition--;
          _handPosition--;
          _handPosition--;
          _handPosition--;

          // _handPosition = _handPosition - 4;
          notifyListeners();
        }
      }
      gameOver();
    }
  }

  void updateProgressMessage() {
    if (_score > 20 && _score < 25) {
      _progressMessage = 'wow!';
      // increaseGameSpeed();
      notifyListeners();
    } else if (_score > 25 && _score < 49) {
      _progressMessage = '';
      notifyListeners();
    } else if (_score > 50 && _score < 55) {
      _progressMessage = 'super!';
      // increaseGameSpeed();
      notifyListeners();
    } else if (_score > 55 && _score < 74) {
      _progressMessage = '';
      notifyListeners();
    } else if (_score > 75 && _score < 80) {
      _progressMessage = 'WHOA!!';
      // increaseGameSpeed();
      notifyListeners();
    } else if (_score > 80 && _score < 100) {
      _progressMessage = '';
      notifyListeners();
    } else if (_score > 100 && _score < 105) {
      _progressMessage = 'YAAAA!!';
      // increaseGameSpeed();
      notifyListeners();
    } else if (_score > 105) {
      _progressMessage = '';
      notifyListeners();
    }
  }

  void handFall() {
    var timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      gameOver();
      // soundModel.playFallingSound('wingsNewOne.mp3');
      // soundModel.playTapSound();

      print(_handPosition);
      // notifyListeners();
      if (_crashed == false) {
        if (_isPaused == false) {
          if (_handPosition >= 2) {
            /// call game over to check to see if game over should happen
            /// if not this function will be called again
            // gameOver();

            _handPosition--;
            _isClimbing = false;
            notifyListeners();
          }
          // timer.cancel();
        }
      } else {
        // gameOver();

        /// if game over happens, then _crashed will be true
        timer.cancel();
        // pauseGame();
        // notifyListeners();
        print('canceling taco fall timer');
      }
    });
    // notifyListeners();
  }

  /// all timers can be cancled by timer.cancel();
  /// check if game over is true and if it is the timers will cancel individually
  /// to reset the state of the app

  // int _crashedPosition = 0;

  //
  // void updateToCrashedPosition() {
  //   _handPosition = _crashedPosition;
  //   notifyListeners();
  // }

  void tinyAmountOfTimeForInvinsibility() {
    Future.delayed(Duration(milliseconds: 1200), () {
      _userCantDie = false;
      notifyListeners();
    });
  }

  void createBuilding() {
    // BuildingWidget theLast = buildings[0];
    if (_crashed == false) {
      theLast = buildings[0];
      buildings.removeAt(0);
      buildings.insert(
          buildings.length,
          BuildingWidget(
            buildingHeight: chooseRandomHeight(),
            powerUpPosition: 0,
          ));

      notifyListeners();
      gameOver();
    }
  }

  void createEmptyBuildingSpace() {
    gameOver();

    /// take the last created building & move it's position to the left
    buildings.removeAt(0);
    randomGemPosition();

    /// create a buildling
    /// add it to the list of buildlings
    /// at the last index of buildling list
    buildings.insert(
        buildings.length,
        BuildingWidget(
          /// by setting powerup position to 7, there should always be a powerup created
          powerUpPosition: _gemPosition,
          buildingHeight: -5,
        ));
    notifyListeners();
  }

  void fireDoublePointsEffects() {
    /// todo - better to combine all of the sounds
    soundModel.playOtherThree('arcadeAndApplause.mp3', _hearSoundEffects);
    // _score = _score + 50;
    updateGameBoyOpacity();
    _amountOfTimeUserHitDoublePoints++;
    _score = _score + 1000;
    _shouldDisplayDoublePointsEffects = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      _shouldDisplayDoublePointsEffects = false;
      notifyListeners();
    });
  }

  void fireExplosion1() {
    // _score = _score + 50;
    _shouldDisplayExplosion1 = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      _shouldDisplayExplosion1 = false;
      notifyListeners();
    });
  }

  void fireExplosion2() {
    // _score = _score + 50;
    _shouldDisplayExplosion2 = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      _shouldDisplayExplosion2 = false;
      notifyListeners();
    });
  }

  void fireBloodSplatQuick() {
    // _score = _score + 50;
    _shouldDisplayBloodSplatQuick = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      _shouldDisplayBloodSplatQuick = false;
      notifyListeners();
    });
  }

  void fireQuickKnifeDefense() {
    // _score = _score + 50;
    /// prevent user from dying while wonder woman pulls her shield out!
    _userCantDie = true;
    tinyAmountOfTimeForInvinsibility();
    _shouldDisplayKnifeDefense = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      _shouldDisplayKnifeDefense = false;
      notifyListeners();
    });
  }

  void fireQuickScreamWhenUserLosesALifeAndNotARedGemWhenStabbed() {
    // _score = _score + 50;
    _shouldDisplayLossALifeAndNotAGameOverAndNotAKnifeDefenseDueToBeingStabbed =
        true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      _shouldDisplayLossALifeAndNotAGameOverAndNotAKnifeDefenseDueToBeingStabbed =
          false;
      notifyListeners();
    });
  }

  void fireQuickHorror() {
    // _score = _score + 50;
    _shouldDisplayQuickHorror = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      _shouldDisplayQuickHorror = false;
      notifyListeners();
    });
  }

  void fireQuickLifePickup() {
    // _score = _score + 50;
    _shouldDisplayQuickLifePickup = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      _shouldDisplayQuickLifePickup = false;
      notifyListeners();
    });
  }

  void fireQuickBandaidPickup() {
    // _score = _score + 50;
    _shouldDisplayBandaidPickup = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      _shouldDisplayBandaidPickup = false;
      notifyListeners();
    });
  }

  void fireJustPickedUpCannon() {
    if (_iceCreamBulletIndex < _iceCreamBullets.length - 1) {
      addFreshlyPickedUpIceCreamToGamePlayAreaForRotatingAnimation();
      _iceCreamBulletIndex++;
      _iceCreamBulletPath = _iceCreamBullets[_iceCreamBulletIndex].iceCreamPath;
      _iceCreamBulletPathForMagazine =
          _iceCreamRoundsForMagazine[_iceCreamBulletIndex].iceCreamPath;

      if (_iceCreamBulletIndex < 7) {
        _nextIceCreamBulletPath =
            _iceCreamBullets[_iceCreamBulletIndex + 1].iceCreamPath;
      }
    }
    // _score = _score + 50;
    _shouldDisplayJustPickedUpCannon = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      _shouldDisplayJustPickedUpCannon = false;
      notifyListeners();
    });
  }

  void fireCoinWinEffect() {
    // _score = _score + 10;
    _shouldShowCoinWinEffect = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      _shouldShowCoinWinEffect = false;
      notifyListeners();
    });
  }

  void blowUpBuildingsButNotPowerUps() {
    for (var i = 0; i < 13; i++) {
      var eachBuildingsPowerUpPosition = buildings[i].powerUpPosition;
      if (eachBuildingsPowerUpPosition == 7 ||
          eachBuildingsPowerUpPosition == 4) {
        buildings.removeAt(i);

        /// replace knifes with extra lifes
        buildings.insert(
            i, BuildingWidget(buildingHeight: -5, powerUpPosition: 9));
      }
      if (eachBuildingsPowerUpPosition <= 0 ||
          eachBuildingsPowerUpPosition > 10) {
        /// remove any building that does not have a powerup (cannot have) i.e. obstacles
        buildings.removeAt(i);
        buildings.insert(
            i, BuildingWidget(buildingHeight: 20, powerUpPosition: 0));
        // buildings[i].buildingHeight = 20;
      }
    }
  }

  /// time bomb
  void timeBombExplosionOnScreen() {
    // soundModel.playOtherThree('sciFiBitExplosion.mp3');
    // soundModel.playOtherFour('whistle.mp3', _hearSoundEffects);
    // soundModel.playOtherFour('whistle.mp3', _hearSoundEffects);
    // soundModel.playOtherFour('zapAndExplosion.mp3', _hearSoundEffects);
    soundModel.playOtherSounds5x('customExplosion.mp3', _hearSoundEffects);

    // soundModel.playOtherFive('sizzlePop.mp3');
    // soundModel.playOtherSix('popDebris.mp3', _hearSoundEffects);

    fireDoublePointsEffects();
    fireExplosion1();

    nukeList.removeAt(nukeList.length - 1);
    blowUpBuildingsButNotPowerUps();

    notifyListeners();
  }

  void switchCannon() {
    _fullyLoaded = !_fullyLoaded;
    notifyListeners();
  }

  void turnOnAndOffBeastBackground() {
    _showBeastBackground = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      _showBeastBackground = false;
      notifyListeners();
    });
  }

  void contactWithPowerUpChecker() {
    int _gemLocationAtIndexZero = buildings[0].powerUpPosition;

    if (_handPosition == _gemLocationAtIndexZero ||
        _handPosition + 1 == _gemLocationAtIndexZero ||
        _handPosition - 1 == _gemLocationAtIndexZero) {
      if (_gemLocationAtIndexZero == 3 || _gemLocationAtIndexZero == 2) {
        fireJustPickedUpCannon();
        soundModel.cannonPickup(hearSoundEffects);

        ///hell fire cannon
        if (_currentCannon == CannonType.orange) {
          _currentCannon = CannonType.yellow;
          _cannons = [
            RotatingIcecreamBullet(
              path: _iceCreamBullets[0].iceCreamPath,
              height: 40.0,
              width: 40.0,
            )
          ];
          _cannons.add(RotatingIcecreamBullet(
            path: _iceCreamBullets[1].iceCreamPath,
            height: 40.0,
            width: 40.0,
          ));
          _currentAmmunition = AmmoType.yellow;
          _cannonPath = 'yellowFireBall3.gif';
          _pathToTwentyMMBullet = '20mmGreen.png';
          _pathToFortyMMBullet = '40mmGreen3.png';
          _pathToColorChangingBullet = 'bulletCombo1.gif';

          /// adds two cannons
          notifyListeners();
        } else if (_currentCannon == CannonType.yellow) {
          _currentCannon = CannonType.blue;
          _cannons.add(RotatingIcecreamBullet(
            path: _iceCreamBullets[2].iceCreamPath,
            height: 40.0,
            width: 40.0,
          ));
          _currentAmmunition = AmmoType.blue;
          _cannonPath = 'invertGreenFireBall.gif';
          _pathToTwentyMMBullet = '20mmBlue.png';
          _pathToFortyMMBullet = '40mmBlue.png';
          _pathToColorChangingBullet = 'bulletCombo2.gif';

          notifyListeners();
        } else if (_currentCannon == CannonType.blue) {
          _currentCannon = CannonType.purple;
          _cannons.add(RotatingIcecreamBullet(
            path: _iceCreamBullets[3].iceCreamPath,
            height: 40.0,
            width: 40.0,
          ));
          _currentAmmunition = AmmoType.purple;
          _cannonPath = 'fireBallXPurple.gif';
          _pathToTwentyMMBullet = '20mmPurpleBright.png';
          _pathToFortyMMBullet = '40mmPink.png';
          _pathToColorChangingBullet = 'bulletCombo3.gif';

          notifyListeners();
        } else if (_currentCannon == CannonType.purple) {
          _currentCannon = CannonType.flashing;
          _cannons.add(RotatingIcecreamBullet(
            path: _iceCreamBullets[4].iceCreamPath,
            height: 40.0,
            width: 40.0,
          ));
          _currentAmmunition = AmmoType.flashing;
          _cannonPath = 'fireBallXFlashing2.gif';
          _pathToTwentyMMBullet = '20mmRed.png';
          _pathToFortyMMBullet = '40mmRed.png';
          _pathToColorChangingBullet = 'bulletCombo4.gif';

          notifyListeners();
        } else if (_currentCannon == CannonType.flashing) {
          _currentCannon = CannonType.black;
          _currentAmmunition = AmmoType.black;
          _cannons.add(RotatingIcecreamBullet(
            path: _iceCreamBullets[5].iceCreamPath,
            height: 40.0,
            width: 40.0,
          ));
          _pathToTwentyMMBullet = '20mmBlack.png';
          _pathToFortyMMBullet = '40mmBlack.png';
          _pathToColorChangingBullet = 'bulletCombo5.gif';

          notifyListeners();
        } else if (_currentCannon == CannonType.black) {
          _currentCannon = CannonType.white;
          _cannons.add(RotatingIcecreamBullet(
            path: _iceCreamBullets[6].iceCreamPath,
            height: 40.0,
            width: 40.0,
          ));
          _cannonPath = 'whiteFireBall.gif';
          _pathToTwentyMMBullet = '20mmWhite.png';
          _pathToFortyMMBullet = '40mmBlackWhite.png';
          _pathToColorChangingBullet = 'bulletCombo6.gif';

          notifyListeners();
        } else if (_currentCannon == CannonType.white) {
          //// let user be rewarded for catching a cannon after they are already on cannon whiteR
          // _currentCannon = CannonType.white;
          // _cannons.add(kLargeHellfireWhite);
          // _currentAmmunition = AmmoType.white;
          cannons.add(RotatingIcecreamBullet(
            path: _iceCreamBullets[7].iceCreamPath,
            height: 40.0,
            width: 40.0,
          ));

          _pathToFortyMMBullet = '40mmCombo.gif';
          _pathToColorChangingBullet = 'bulletCombo7.gif';

          fireDoublePointsEffects();

          notifyListeners();
        }
        // flames.add(CannonAmmunition());
        // notifyListeners();
        print('user caught a FLAME');
      } else if (_gemLocationAtIndexZero == 9) {
        updateZombiePath();

        ///extra life
        fireQuickLifePickup();

        /// todo - this sound is not playing
        soundModel.lifePickup(hearSoundEffects);

        // however, this sound was playing ... it was being called from the fireQuickLifePickup()
        soundModel.playOtherSounds5x('1-21-23Gingle8Bit.mp3', hearSoundEffects);

        /// give the user an extra life
        extraLives.add(kExtraLife);
        fireDoublePointsEffects();
        notifyListeners();

        print('user got extra life');
      } else if (_gemLocationAtIndexZero == 10) {
        /// used to be 6 and 10, now lets just put this at 10, and 6 will be the speed up negative powerup

        soundModel.bloodPickup(hearSoundEffects);

        /// this fire func used to call to play this sound
        soundModel.playOtherSounds5x('1-21-23Gingle8Bit.mp3', hearSoundEffects);
        fireQuickBandaidPickup();
        fireDoublePointsEffects();
        redGems.add(kBlood);
        notifyListeners();

        /// increase users red gem count
        print('user made contact with red gem');
      } else if (_gemLocationAtIndexZero == 1) {
        fireDoublePointsEffects();

        /// user caught a bomb blow up obstacles instantly
        blowUpBuildingsButNotPowerUps();
        soundModel.playOtherSounds5x('customExplosion.mp3', _hearSoundEffects);

        fireExplosion2();
        print('user caught a flashing gem');
      } else if (_gemLocationAtIndexZero == 8) {
        /// TODO - condense these sounds
        soundModel.playOtherSounds('sizzlePop.mp3', _hearSoundEffects);
        soundModel.playOtherSeven('sciFiPowerupThree.mp3', _hearSoundEffects);

        ///empty buildings
        nukeList.add(
          SelectedGrenadeWidget(
            onScreenPickupAndNotAGrenadeButton: false,
          ),

          ///TODO add a custom widget that holds the string from the other provider
        );
        print('user caught a nuke');
      }
    }
  }

  /// negative power ups, knife, beast, time increase.
  void checkForBadPowerUps() {
    int _gemLocationAtIndexZero = buildings[0].powerUpPosition;

    if (_handPosition - 1 == _gemLocationAtIndexZero ||
        _handPosition == _gemLocationAtIndexZero) {
      if (_gemLocationAtIndexZero == 4 || _gemLocationAtIndexZero == 7) {
        soundModel.knifePickup(hearSoundEffects);

        if (redGems.isEmpty && extraLives.isEmpty) {
          soundModel.playOtherSounds('jumpScare.mp3', _hearSoundEffects);

          fireQuickScreamWhenUserLosesALifeAndNotARedGemWhenStabbed();
          // fireBloodSplatQuick();

          print('user got stabbed and game over');

          _crashed = true;
          pauseGame();
          notifyListeners();
        } else if (redGems.isNotEmpty) {
          fireQuickScreamWhenUserLosesALifeAndNotARedGemWhenStabbed();

          redGems.removeAt(redGems.length - 1);
          print('red gem stab protection - 1 red gem');
          fireQuickKnifeDefense();

          notifyListeners();
        } else if (extraLives.isNotEmpty) {
          fireQuickScreamWhenUserLosesALifeAndNotARedGemWhenStabbed();
          // soundModel.playOtherFour('negativePowerupTwo.mp3', _hearSoundEffects);

          extraLives.removeAt(extraLives.length - 1);
          print(
              'user got stabbed and had no red gems so lost a life but not a game over');

          notifyListeners();
        }
      } else if (_gemLocationAtIndexZero == 5) {
        turnOnAndOffBeastBackground();

        soundModel.horsePickup(hearSoundEffects);
      } else if (_gemLocationAtIndexZero == 6) {
        /// crystal ball!
        /// show
        fireCrystalBallTimeDecrease();
        soundModel.crystalPickup(hearSoundEffects);
      }
    }
  }

  //// rather than speeding game up, slow it down?!?!?!?
  /// the game speeds up when you hit a crystal ball
  /// to make game play faster, decrease game speed

  void fireCrystalBallTimeDecrease() {
    _gameSpeed = _gameSpeed - 10000;
    _reverseGameSpeedToDisplayForUserAsTheyProgress =
        _reverseGameSpeedToDisplayForUserAsTheyProgress + 100;
    // _score = _score + 50;
    _shouldDisplayTimeIncrease = true;
    fireDoublePointsEffects();
    notifyListeners();
    Future.delayed(Duration(milliseconds: 1200), () {
      _shouldDisplayTimeIncrease = false;
      notifyListeners();
    });
  }

  void unloadHellFire() {
    flames = [];
    flamesSecond = [];
    notifyListeners();
  }

  void reloadHellFire() {
    _triedFiringWhenOutOfAmmo = false;
    soundModel.playReloadSound(_hearSoundEffects);

    _roundsInMagazine = 18;
    flames = [
      IceCreamBulletForMagazine(iceCreamPath: _iceCreamBulletPathForMagazine),
      IceCreamBulletForMagazine(iceCreamPath: _iceCreamBulletPathForMagazine),
      IceCreamBulletForMagazine(iceCreamPath: _iceCreamBulletPathForMagazine),
      IceCreamBulletForMagazine(iceCreamPath: _iceCreamBulletPathForMagazine),
      IceCreamBulletForMagazine(iceCreamPath: _iceCreamBulletPathForMagazine),
      IceCreamBulletForMagazine(iceCreamPath: _iceCreamBulletPathForMagazine),
      kblankIcon,
    ];
    flamesSecond = [
      IceCreamBulletForMagazine(iceCreamPath: _iceCreamBulletPathForMagazine),
      IceCreamBulletForMagazine(iceCreamPath: _iceCreamBulletPathForMagazine),
      IceCreamBulletForMagazine(iceCreamPath: _iceCreamBulletPathForMagazine),
      IceCreamBulletForMagazine(iceCreamPath: _iceCreamBulletPathForMagazine),
      IceCreamBulletForMagazine(iceCreamPath: _iceCreamBulletPathForMagazine),
      IceCreamBulletForMagazine(iceCreamPath: _iceCreamBulletPathForMagazine),
      IceCreamBulletForMagazine(iceCreamPath: _iceCreamBulletPathForMagazine),
      IceCreamBulletForMagazine(iceCreamPath: _iceCreamBulletPathForMagazine),
      IceCreamBulletForMagazine(iceCreamPath: _iceCreamBulletPathForMagazine),
      IceCreamBulletForMagazine(iceCreamPath: _iceCreamBulletPathForMagazine),
      IceCreamBulletForMagazine(iceCreamPath: _iceCreamBulletPathForMagazine),
      IceCreamBulletForMagazine(iceCreamPath: _iceCreamBulletPathForMagazine),
      kblankIcon,
    ];
    _fullyLoaded = true;
    notifyListeners();
  }

  void addFreshlyPickedUpIceCreamToGamePlayAreaForRotatingAnimation() {
    _rotatingIceCreamPickups = [];
    _rotatingIceCreamPickups.add(
      Center(
          child: Container(
              height: 300.0,
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotatingIcecreamBullet(
                    path: '$_iceCreamBulletPath',
                    height: 300.0,
                    width: 300.0,
                  ),
                ],
              ))),
    );
  }

  // bool _shieldIsActive = false;
  //
  // bool get shieldIsActive => _shieldIsActive;

  /// some of these are duplicates,  so the sounds will occur instantly upon creation of the powerups rather than upon 'catching' the powerups

  // knife, fireball, bomb, timebomb, skelaton, life, and a bandaid
  /// 7 different types of powerups
  /// this function does not determine what types of powerups to create
  /// it just creates an int value, which will create a powerup if that int value is a match in the buildling widget
  ///
  ///
  /// 1 nuke
  /// 2 & 3 cannon upgrade
  /// 4 & 7 knife
  /// 5 skellaton rampage
  /// 6 is a bandaid & 10 bandaid
  /// 8 is a timebomb
  /// 9 extra life

  void randomGemPosition() {
    _gemPosition = Random().nextInt(100);
    notifyListeners();
    if (_gemPosition == 4 || _gemPosition == 7) {
      _trackGemType = 'knife'.toUpperCase();
      soundModel.knifeScrape(hearSoundEffects);

      print('gem type $_trackGemType');
      notifyListeners();
    } else if (_gemPosition == 10 || _gemPosition == 6) {
      /// bandaid
      soundModel.playOtherSounds5x('magicSpell.mp3', _hearSoundEffects);

      notifyListeners();
    } else if (_gemPosition == 1) {
      /// life
      soundModel.playOtherSounds5x('fuseSound.mp3', _hearSoundEffects);

      notifyListeners();
    } else if (_gemPosition == 5) {
      /// skellaton
      // soundModel.playOtherSounds5x('emergencyAlertFourDings.mp3');
      soundModel.playOtherSounds('1-21-23Warning.mp3', _hearSoundEffects);

      notifyListeners();
    } else if (_gemPosition == 8) {
      /// timebomb
      soundModel.playOtherSounds5x('timerTicking.mp3', _hearSoundEffects);

      notifyListeners();
    } else if (_gemPosition == 3 || _gemPosition == 2) {
      // cannon upgrade
      soundModel.playOtherSounds5x('shieldPowerup.mp3', _hearSoundEffects);

      /// what the fuck powerup is this? fireball

      notifyListeners();
    } else if (_gemPosition == 9) {
      // extra life
      soundModel.playOtherSounds5x('magicHum.mp3', _hearSoundEffects);
      notifyListeners();
    }
    notifyListeners();
  }

  // void activateShield() {
  //   buildings = [];
  //   notifyListeners();
  //
  //   /// deploy the shield
  //   buildings = [
  //     /// 5 empty buildings
  //
  //     BuildingWidget(
  //       buildingHeight: 21,
  //       powerUpPosition: 0,
  //     ),
  //     BuildingWidget(
  //       buildingHeight: 21,
  //       powerUpPosition: 0,
  //     ),
  //     BuildingWidget(
  //       buildingHeight: 21,
  //       powerUpPosition: 0,
  //     ),
  //     BuildingWidget(
  //       buildingHeight: 21,
  //       powerUpPosition: 0,
  //     ),
  //     BuildingWidget(
  //       buildingHeight: 21,
  //       powerUpPosition: 0,
  //     ),
  //     BuildingWidget(
  //       buildingHeight: 21,
  //       powerUpPosition: 0,
  //     ),
  //     BuildingWidget(
  //       buildingHeight: 21,
  //       powerUpPosition: 0,
  //     ),
  //     BuildingWidget(
  //       buildingHeight: 21,
  //       powerUpPosition: 0,
  //     ),
  //     BuildingWidget(
  //       buildingHeight: 21,
  //       powerUpPosition: 0,
  //     ),
  //     BuildingWidget(
  //       buildingHeight: 21,
  //       powerUpPosition: 0,
  //     ),
  //     BuildingWidget(
  //       buildingHeight: 21,
  //       powerUpPosition: 0,
  //     ),
  //     BuildingWidget(
  //       buildingHeight: 21,
  //       powerUpPosition: 0,
  //     ),
  //     BuildingWidget(
  //       buildingHeight: 21,
  //       powerUpPosition: 0,
  //     ),
  //   ];
  //   notifyListeners();
  // }

  void updateFrequencyOfGemsEarnedBasedOnScore() {
    if (_score <= 10000) {
      _growingNmber = 1;
    } else if (_score <= 20000) {
      _growingNmber = 2;
    } else if (_score <= 30000) {
      _growingNmber = 3;
    } else if (_score <= 40000) {
      _growingNmber = 4;
    } else if (_score <= 50000) {
      _growingNmber = 5;
    } else if (_score <= 60000) {
      _growingNmber = 6;
    } else if (_score <= 70000) {
      _growingNmber = 7;
    }
  }

  List<HellFirePowerUpColumns> hellFireColumns = [
    HellFirePowerUpColumns(firePosition: -1),
    HellFirePowerUpColumns(firePosition: -1),
    HellFirePowerUpColumns(firePosition: -1),
    HellFirePowerUpColumns(firePosition: -1),
    HellFirePowerUpColumns(firePosition: -1),
    HellFirePowerUpColumns(firePosition: -1),
    HellFirePowerUpColumns(firePosition: -1),
    HellFirePowerUpColumns(firePosition: -1),
    HellFirePowerUpColumns(firePosition: -1),
    HellFirePowerUpColumns(firePosition: -1),
    HellFirePowerUpColumns(firePosition: -1),
    HellFirePowerUpColumns(firePosition: -1),
    HellFirePowerUpColumns(firePosition: -1),
  ];

  void resetHellFireColumns() {
    hellFireColumns = [
      HellFirePowerUpColumns(firePosition: -1),
      HellFirePowerUpColumns(firePosition: -1),
      HellFirePowerUpColumns(firePosition: -1),
      HellFirePowerUpColumns(firePosition: -1),
      HellFirePowerUpColumns(firePosition: -1),
      HellFirePowerUpColumns(firePosition: -1),
      HellFirePowerUpColumns(firePosition: -1),
      HellFirePowerUpColumns(firePosition: -1),
      HellFirePowerUpColumns(firePosition: -1),
      HellFirePowerUpColumns(firePosition: -1),
      HellFirePowerUpColumns(firePosition: -1),
      HellFirePowerUpColumns(firePosition: -1),
      HellFirePowerUpColumns(firePosition: -1),
    ];
    notifyListeners();
  }

  void moveHellFire() {
    hellFireColumns.removeAt(hellFireColumns.length - 1);

    hellFireColumns.insert(
        0,
        HellFirePowerUpColumns(
          firePosition: -1,
        ));

    notifyListeners();
  }

  // List<HellFireContactColumns> hellFireContactColumns = [];

  void resetHellFireContactLocations() {
    contactGrid = [
      HellFireContactColumns(potentialContactPosition: -1),
      HellFireContactColumns(potentialContactPosition: -1),
      HellFireContactColumns(potentialContactPosition: -1),
      HellFireContactColumns(potentialContactPosition: -1),
      HellFireContactColumns(potentialContactPosition: -1),
      HellFireContactColumns(potentialContactPosition: -1),
      HellFireContactColumns(potentialContactPosition: -1),
      HellFireContactColumns(potentialContactPosition: -1),
      HellFireContactColumns(potentialContactPosition: -1),
      HellFireContactColumns(potentialContactPosition: -1),
      HellFireContactColumns(potentialContactPosition: -1),
      HellFireContactColumns(potentialContactPosition: -1),
    ];
    notifyListeners();
  }

  ///contact points and fire animations at the correct contact point
  ///with 1/50th the amount of code or so
  ///display contactGrid as a stack in from of the game play areas
  void contactFiveOrLess() {
    for (var i = 0; i < 11; i++) {
      if (buildings[i].buildingHeight <= 5) {
        if (buildings[i].buildingHeight >= _handPosition &&
            buildings[i].buildingHeight <= 12 &&
            buildings[i].buildingHeight >= 1) {
          /// then contact has been made
          handleComboHitsMessageAndHoldTripleHit();

          /// decrease the building height
          buildings[i].buildingHeight = buildings[i].buildingHeight - 1;
          contactGrid.removeAt(i);
          contactGrid.insert(i,
              HellFireContactColumns(potentialContactPosition: _handPosition));

          /// add a animation when the gunshot hits a target
          notifyListeners();
          Future.delayed(Duration(milliseconds: 400), () {
            resetHellFireContactLocations();
            contactGrid.removeAt(i);

            /// remove the animation effect quickly
            contactGrid.insert(
                i, HellFireContactColumns(potentialContactPosition: 21));
            pointsForHittingPerCannonType();
            notifyListeners();

            /// 21 adds a blank column
          });
        }
      }
    }
  }

  void contactSixOrMore() {
    for (var i = 0; i < 11; i++) {
      if (buildings[i].buildingHeight >= 6) {
        if (buildings[i].buildingHeight <= _handPosition + 2 &&
            buildings[i].buildingHeight <= 12 &&
            buildings[i].buildingHeight >= 1) {
          /// then contact has been made
          handleComboHitsMessageAndHoldTripleHit();
          // _comboHits++;
          // if (_comboHits >= 3) {
          //   fireDoublePointsEffects();
          // }
          /// todo implement destruction of barriers for only upgrade cannons
          buildings[i].buildingHeight = buildings[i].buildingHeight + 1;

          contactGrid.removeAt(i);
          contactGrid.insert(
              i,
              HellFireContactColumns(
                  potentialContactPosition: _handPosition + 1));

          /// add a animation when the gunshot hits a target
          /// at the location of contact
          notifyListeners();
          Future.delayed(Duration(milliseconds: 400), () {
            resetHellFireContactLocations();
            contactGrid.removeAt(i);

            /// remove the animation effect quickly
            contactGrid.insert(
                i, HellFireContactColumns(potentialContactPosition: 21));
            pointsForHittingPerCannonType();

            /// 21 adds a blank column
            notifyListeners();
          });
        }
      }
    }
  }

  void pointsForHittingPerCannonType() {
    if (_crashed == false) {
      if (_isPaused == false) {
        if (_currentCannon == CannonType.orange) {
          if (_shouldDisplayDoublePointsEffects == false) {
            _basePointsForHittingBarrier = 3;
            _score = _score + (3 * _amountOfTimeUserHitDoublePoints);
          } else {
            _score = _score + (6 * _amountOfTimeUserHitDoublePoints);
            _basePointsForHittingBarrier = 6;
          }
          notifyListeners();
        } else if (_currentCannon == CannonType.yellow) {
          if (_shouldDisplayDoublePointsEffects == false) {
            _basePointsForHittingBarrier = 7;
            _score = _score + (7 * _amountOfTimeUserHitDoublePoints);
          } else {
            _score = _score + (14 * _amountOfTimeUserHitDoublePoints);
            _basePointsForHittingBarrier = 14;
          }
          notifyListeners();
        } else if (_currentCannon == CannonType.blue) {
          if (_shouldDisplayDoublePointsEffects == false) {
            _basePointsForHittingBarrier = 12;
            _score = _score + (12 * _amountOfTimeUserHitDoublePoints);
          } else {
            _score = _score + (24 * _amountOfTimeUserHitDoublePoints);
            _basePointsForHittingBarrier = 24;
          }
          notifyListeners();
        } else if (_currentCannon == CannonType.purple) {
          if (_shouldDisplayDoublePointsEffects == false) {
            _basePointsForHittingBarrier = 18;
            _score = _score + (18 * _amountOfTimeUserHitDoublePoints);
          } else {
            _basePointsForHittingBarrier = 36;
            _score = _score + (36 * _amountOfTimeUserHitDoublePoints);
          }
          notifyListeners();
        } else if (_currentCannon == CannonType.flashing) {
          if (_shouldDisplayDoublePointsEffects == false) {
            _basePointsForHittingBarrier = 25;
            _score = _score + (25 * _amountOfTimeUserHitDoublePoints);
          } else {
            _basePointsForHittingBarrier = 50;
            _score = _score + (50 * _amountOfTimeUserHitDoublePoints);
          }
          notifyListeners();
        } else if (_currentCannon == CannonType.black) {
          if (_shouldDisplayDoublePointsEffects == false) {
            _basePointsForHittingBarrier = 35;
            _score = _score + (35 * _amountOfTimeUserHitDoublePoints);
          } else {
            _basePointsForHittingBarrier = 70;
            _score = _score + (70 * _amountOfTimeUserHitDoublePoints);
          }
          notifyListeners();
        } else if (_currentCannon == CannonType.white) {
          if (_shouldDisplayDoublePointsEffects == false) {
            _basePointsForHittingBarrier = 45;
            _score = _score + (45 * _amountOfTimeUserHitDoublePoints);
          } else {
            _basePointsForHittingBarrier = 90;
            _score = _score + (90 * _amountOfTimeUserHitDoublePoints);
          }
          notifyListeners();
        }
      }
      notifyListeners();
    }
  }

  void handleComboHitsMessageAndHoldTripleHit() {
    /// dont incremnet combo hits if it's greater than 3
    if (_comboHits < 3) {
      _comboHits++;
      if (_comboHits == 2) {
        // soundModel.playOtherSeven('sizzlePop.mp3');
        soundModel.playOtherThree('metalPlinkOne.mp3', _hearSoundEffects);
        Future.delayed(Duration(milliseconds: 1200), () {
          _comboHits = 0;
          notifyListeners();
        });
        // soundModel.playOtherFour('metalPlinkThree.mp3');
      }
      if (_comboHits >= 3) {
        fireDoublePointsEffects();
        soundModel.playOtherFive('tipleKill.mp3', _hearSoundEffects);
        soundModel.playOtherFour('metalPlinkThree.mp3', _hearSoundEffects);
        Future.delayed(Duration(milliseconds: 1200), () {
          _comboHits = 0;
          notifyListeners();
        });
      }
    } else {
      Future.delayed(Duration(milliseconds: 1200), () {
        _comboHits = 0;
        notifyListeners();
      });
    }
  }

  void fireContact() {
    if (_handPosition == 5) {
      if (buildings[1].buildingHeight >= 1 &&
          buildings[1].buildingHeight <= 5) {
        contactGrid.removeAt(1);
        contactGrid.add(HellFireContactColumns(potentialContactPosition: 1));
        notifyListeners();
        Future.delayed(Duration(milliseconds: 200), () {
          contactGrid.removeAt(1);
          notifyListeners();
        });
      } else if (buildings[2].buildingHeight >= 1 &&
          buildings[2].buildingHeight <= 5) {
        contactGrid.removeAt(2);
        contactGrid.add(HellFireContactColumns(potentialContactPosition: 1));
        notifyListeners();
        Future.delayed(Duration(milliseconds: 200), () {
          contactGrid.removeAt(2);
          notifyListeners();
        });
      } else if (buildings[3].buildingHeight >= 1 &&
          buildings[3].buildingHeight <= 5) {
        contactGrid.removeAt(3);
        contactGrid.add(HellFireContactColumns(potentialContactPosition: 1));
        notifyListeners();
        Future.delayed(Duration(milliseconds: 200), () {
          contactGrid.removeAt(3);
          notifyListeners();
        });
      }
    }
  }

  /// combo data provider
  ///

  void fireHellFire() {
    _indexToFireDifferentFishBullets = Random().nextInt(5);

    if (flamesSecond.isEmpty == false) {
      _fullyLoaded = false;
      if (_roundsInMagazine > 0) {
        if (_isPaused == false) {
          _triedFiringWhenOutOfAmmo = false;
          _roundsInMagazine--;
          // soundModel.playLaserSound();
          soundModel.playLaserSound(_hearSoundEffects);
          // soundModel.playOtherSoundsTwo('shortLaserSplat.mp3');
        }

        /// reset combo hits
        if (_isPaused == false) {
          if (_comboHits < 3) {
            _comboHits = 0;
          }
        }
        if (_isPaused == false) {
          moveHellFire();
          hellFireColumns.removeAt(hellFireColumns.length - 1);

          hellFireColumns.insert(
              0,
              HellFirePowerUpColumns(
                /// by setting powerup position to 7, there should always be a powerup created
                firePosition: _handPosition,
              ));
          contactFiveOrLess();
          contactSixOrMore();

          /// used to onlly climb when firing, now lets just climb everytime the user presses the climb button, and fire hell fire seperately
          // handClimb();

          // fireContact();
          notifyListeners();
          if (flames.length > 0) {
            flames.removeAt(0);
            notifyListeners();
          } else if (flamesSecond.length > 0) {
            flamesSecond.removeAt(0);
            notifyListeners();
          }
        }
      } else {
        _triedFiringWhenOutOfAmmo = true;
        // print('trried firing when out of ammo is = $_triedFiringWhenOutOfAmmo');
        notifyListeners();
        soundModel.playReloadMaleVoice(_hearSoundEffects);
      }
    }
  }

  void hellFirePowerUp() {
    var timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      if (_crashed == false) {
        /// use a different conditional to determine if hell fire is active
        if (_isPaused == false) {
          moveHellFire();

          notifyListeners();
        }
      } else {
        resetHellFireColumns();
        timer.cancel();
        print('canceling building creation timer');
      }
    });
    notifyListeners();
  }
}
