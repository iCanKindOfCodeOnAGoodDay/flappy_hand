import 'dart:async';
import 'dart:math';

import 'package:flappy_taco/widgets/winnables/generic_availble_to_win_from_chest_item_widget.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/premium_gats.dart';

enum PremiumContentType {
  gat,
  grenade,
  beast,
  console,
  shank,
  rocket,
}

enum HandColors {
  regular,
  zombieGreen14,
  blackRed18,
  purple11,
  greenPinkWhite17,
  blackPink15,
  redBlack12,
}

class PremiumContentProvider with ChangeNotifier {
  /// hands fish, and faces
  ///
  int indexToIterateThroughFloppyFishList = 0;
  bool _activatedFloppyFish = false;
  bool get activatedFloppyFish => _activatedFloppyFish;
  //// the  image is set here

  //deathStar150.gif
  //katyPerryRidingHorse.gif

  // levelUpStatic.gif
  // levelUpSword.gif
  // levelUpSwordRed.gif
  // String _pathToSelectedBackgroundImage = 'black.png';

  String _pathToSelectedBackgroundImage = 'hhWarp3.GIF';

  // String _pathToSelectedBackgroundImage = 'horror41.JPG';
  String get pathToSelectedBackgroundImage => _pathToSelectedBackgroundImage;
  String _pathToPreviousBackgroundImage = 'warpSpeedBlack.gif';

  String get pathToPreviousBackgroundImage => _pathToPreviousBackgroundImage;
  int _backgroundIndex = 0;
  bool _activatedFloppyFace = false;
  bool get activatedFloppyFace => _activatedFloppyFace;
  int indexToIterateThroughFloppyFaceList = 0;

  /// interesting, when we change the hand below to trump, it only last a little while then becomes thing again
  String _pathToSelectedWalkingHand = 'trumpHeadxx1-22-23.gif';

  // String _pathToSelectedWalkingHand = 'thingStichedWalkingXX.gif';
  String get pathToSelectedWalkingHand => _pathToSelectedWalkingHand;
  String _pathToSelectedDeadHand = 'thingRightTraced.png';
  String get pathToSelectedDeadHand => _pathToSelectedDeadHand;
  HandColors selectedHandColor = HandColors.regular;
  int _indexOfHandColorList = 0;
  String _pathToSelectedBarrier =
      // 'mmjakFuzzyInvertPink.gif';
      // 'mmmZombieFuzzyPink.gif';
      'mmmZombieCombo.gif';
  // String _pathToSelectedBarrier = 'zombieHandXX.gif';
  bool _activatedFireBallAmmo = false;
  bool get activatedFireBallAmmo => _activatedFireBallAmmo;
  bool _activatedSkeletonHand = false;
  bool get activatedSkeletonHand => _activatedSkeletonHand;
  bool _activatedFishAmmo = false;
  bool get activatedFishAmmo => _activatedFishAmmo;
  bool _activatedTrumpAmmo = false;
  bool get activatedTrumpAmmo => _activatedTrumpAmmo;
  bool _activated20MMAmmo = false;
  bool get activated20MMAmmo => _activated20MMAmmo;
  bool _activated40MMAmmo = false;
  bool get activated40MMAmmo => _activated40MMAmmo;
  bool _activatedColorChangingBullets = false;
  bool get activatedColorChangingBullets => _activatedColorChangingBullets;
  bool _activatedShankShooter = false;
  bool get activatedShankShooter => _activatedShankShooter;
  bool _activatedExplodingHitMarkers = false;
  bool get activatedExplodingAmmo => _activatedExplodingHitMarkers;
  bool _activatedExplodingRecoil = false;
  bool get activatedExplodingRecoil => _activatedExplodingRecoil;
  bool _activatedShellCasingsInsteadOfSparks = false;
  bool get activatedShellCasingsInsteadOfSparks =>
      _activatedShellCasingsInsteadOfSparks;
  String get pathToSelectedBarrier => _pathToSelectedBarrier;
  int _iterateThroughBarrierIndex = 0;
  int get iterateThroughBarrierIndex => _iterateThroughBarrierIndex;
  List<String> _barrierFileNames = [
    /// zombies
    'mmmZombieCombo.gif',
  ];
  int _horrorIndex = 0;
  int get horrorIndex => _horrorIndex;
  List<String> backgroundImageFileNames = [
    'horror41.JPG',
  ];
  String _playersGatChoiceString =
      // 'skeletonWhiteARPistolRemakeSkeletonHand.png';
      // 'skeletonARPistolRemakeWhiteBlackTealCombo.gif';
      // 'skeletonGunCompxxInverseBlueOrangexxx.png';
      'skeletonWhiteARPistolRemakeSkeletonHandWhitePinkTint.png';
  String get playersGatChoiceString => _playersGatChoiceString;
  String _playersGrenadeChoiceString = 'standardGrenade1-18-23YellowInvert.png';
  String get playersGrenadeChoiceString => _playersGrenadeChoiceString;
  String _pathToNewItemFromChest = 'xThingKeltechPistol.png';
  String get pathToNewItemFromChest => _pathToNewItemFromChest;
  int _amountOfRubiesReadyToUse = 1985;
  int get amountOfRubiesReadyToUse => _amountOfRubiesReadyToUse;
  String _pathToSelectedKnife = 'kimJongRocketRiding.gif';

  // String _pathToSelectedKnife = 'switchBladeBloody.gif';
  String get pathToSelectedKnife => _pathToSelectedKnife;
  // String _pathToSelectedGameConsole = '12dotSquashSuperDevice.gif';
  String _pathToSelectedBeast = 'horseTransparent.gif';
  // 'zzBaby.GIF';
  String get pathToSelectedBeast => _pathToSelectedBeast;
  String _pathToSelectedRocket = 'img-handWings2-16-23.png';
  // 'crystalBallXXXXX.gif';
  String get pathToSelectedRocket => _pathToSelectedRocket;
  String _pathToSelectedGameConsole =
      // 'futuristicGameConsoleNoLogo2BLANKLOGO copy 3.png';
      // 'futuristicGameConsoleNoLogoBLANK.png';
      // 'dotSquashGameConsoleWhiteInvert.png';
      'dotSquashGameConsoleGrey.png';
  // '12dotsquashConsoleExtraDarkWithRedChipDarkGrey.png';
  // '12dotSquashConsoleWhiteChip1.png';
  String get pathToSelectedGameConsole => _pathToSelectedGameConsole;
  List<String> _listOfConsoles = [
    // '44DotSquashComboBlacks.gif',
    // '44DotSquashComboBlues.gif',
    // '44DotSquashComboGreens.gif',
    // '44DotSquashComboGrey.gif',
    // '44DotSquashComboPurps.gif',
    // '44DotSquashComboRedWhiteBlue.gif',
    // '44DotSquashComboWhiteBlack.gif',
    // '12dotsquashConsoleExtraDarkWithLightChipGreen.png',
    // '12dotsquashConsoleExtraDarkWithLightChipGrey.png',
    // '12dotsquashConsoleExtraDarkWithLightChipSaturatedGreen.png',
    // '12dotsquashConsoleExtraDarkWithRedChip2.png',
    // '12dotsquashConsoleExtraDarkWithRedChipDarkGrey.png',
    // '12dotsquashConsoleExtraDarkWithRedChipOrange.png',
    // '12dotsquashConsoleExtraDarkWithRedChipYellow.png',
    // '12dotsquashConsoleLightDarkWithRedChipGrey.png',
    // '12dotSquashConsoleLightGrey2.png',
    // '12dotsquashConsoleLightGreyWithRedChip.png',
    // '12dotsquashConsoleLightWithGreenChip.png',
    // '12dotsquashConsoleLightWithPinkChip.png',
    // '12dotSquashConsoleWhiteChip1.png',
    // '12dotSquashLightWithRedChip.png',
    // '12dotSquashSuperDevice.gif',
    // '12dotSquashWhiteInternalsxx.png',
    // // '12dotSqushGameConsoleInternalsBlue.png',
    // '12dotSqushGameConsoleInternalsBrown.png',
    // '12dotSqushGameConsoleInternalsCamo2.png',
    // '12dotSqushGameConsoleInternalsDarkBlueGreen.png',
    // // '12dotSqushGameConsoleInternalsDarkGreenLightGreen.png',
    // // '12dotSqushGameConsoleInternalsGreen.png',
    // // '12dotSqushGameConsoleInternalsLightBlue.png',
    // // '12dotSqushGameConsoleInternalsLightBrown.png',
    // // '12dotSqushGameConsoleInternalsLightGreen.png',
    // // '12dotSqushGameConsoleInternalsLightGrey.png',
    // // '12dotSqushGameConsoleInternalsLightGreyGreen.png',
    // // '12dotSqushGameConsoleInternalsLightPurp.png',
    // '12dotSqushGameConsoleInternalsLightRedGreen.png',
    // '12dotSqushGameConsoleInternalsPink.png',
    // // '12dotSqushGameConsoleInternalsPinkish.png',
    // '12dotSqushGameConsoleInternalsPurp2.png',
    // '12dotSqushGameConsoleInternalsYellow.png',
    // '12DotSquashSuper.gif',
    /// end devices with chips
    'futuristicGameConsoleNoLogo2BLANKLOGO copy 3.png',
    // 'futuristicGameConsoleNoLogo2BLANKLOGO.png',
    // 'futuristicGameConsoleNoLogo2BLANKLOGOBrightYellow2.png',
    // 'futuristicGameConsoleNoLogo2BLANKLOGOPurp.png',
    // 'dotSquashGameConsoleBrown.png',
    // 'dotSquashGameConsoleBurntBlue.png',
    // 'dotSquashGameConsoleBurntGreen2.png',
    // 'dotSquashGameConsoleBurntGrey.png',
    // 'dotSquashGameConsoleBurntPurple.png',
    // 'dotSquashGameConsoleBurntRed.png',
    // 'dotSquashGameConsoleBurntTan.png',
    // 'dotSquashGameConsoleGreen.png',
    'dotSquashGameConsoleGrey.png',
    // 'dotSquashGameConsolePink.png',
    // 'dotSquashGameConsolePink2.png',
    'dotSquashGameConsoleSilver.png',
    'dotSquashGameConsoleWhite.png',
    'dotSquashGameConsoleWhiteInvert.png',
  ];
  int _consoleListIndex = 0;
  bool _addedAllSkeletonGuns = false;
  bool get addedAllSkeletonGuns => _addedAllSkeletonGuns;
  List<PremiumGatsAndGrenades> itemsWonThatAreAvailableToEquip = [
    PremiumGatsAndGrenades(
        type: PremiumContentType.gat, path: 'xThingRedM4.png'),
  ];
  String _lastWonPrizeTypeForTheCongratsMessage = 'gat';
  String get lastWonPrizeTypeForTheCongratsMessage =>
      _lastWonPrizeTypeForTheCongratsMessage;
  String _pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';
  String get pathToChangeChestImageFromClosedToOpen =>
      _pathToChangeChestImageFromClosedToOpen;
  double _widthOfNewItemForAnimationWhenOpeningChest = 0.0;
  double get widthOfNewItemForAnimationWhenOpeningChest =>
      _widthOfNewItemForAnimationWhenOpeningChest;
  double _heightOfNewItemForAnimationWhenOpeningChest = 0.0;
  double get heightOfNewItemForAnimationWhenOpeningChest =>
      _heightOfNewItemForAnimationWhenOpeningChest;
  bool _shouldHideTheLastPrize = true;
  bool get shouldHideTheLastPrize => _shouldHideTheLastPrize;
  List<String> _pathToEachWinnableBeast = [
    'zzGhost1.gif',
    'zzBaby2.gif',
    'zzBaby.GIF',
  ];
  List<String> _pathToEachWinnableGrenade = [
    // 'icedGrenade1-18-23BlackGreen.png',
    // 'icedGrenade1-18-23Blue.png',
    // 'icedGrenade1-18-23BrightBlue.png',
    // 'icedGrenade1-18-23Gold.png',
    // 'icedGrenade1-18-23Green.png',
    // 'icedGrenade1-18-23NeonGreenA.png',
    // 'icedGrenade1-18-23NeonIce.png',
    // 'icedGrenade1-18-23Orange.png',
    // 'icedGrenade1-18-23Pink.png',
    // 'icedGrenade1-18-23PinkBlack.png',
    // 'icedGrenade1-18-23PinkIce.png',
    // 'icedGrenade1-18-23PinkIceX.png',
    // 'icedGrenade1-18-23Purple.png',
    // 'icedGrenade1-18-23RedBlack.png',
    'icedGrenade1-18-23TiffanyIce.png',
    'icedGrenade1-18-23SaturatedBlueBlack.png',
    'icedGrenade1-18-23SaturatedGreenBlack.png',
    'icedGrenade1-18-23SaturatedLimeIce.png',
    'icedGrenade1-18-23SaturatedNeonGreenIce.png',
    'icedGrenade1-18-23SaturatedOrangeBlack.png',
    'icedGrenade1-18-23SaturatedOrangeIce.png',
    'icedGrenade1-18-23SaturatedOrangeIceX.png',
    'icedGrenade1-18-23SaturatedPinkBlack.png',
    'icedGrenade1-18-23SaturatedPinkIce.png',
    'icedGrenade1-18-23SaturatedPurpleBlack.png',
    'icedGrenade1-18-23SaturatedPurpleIce.png',
    'icedGrenade1-18-23SaturatedRedBlack.png',
    'icedGrenade1-18-23SaturatedTealBlack.png',
    'icedGrenade1-18-23SaturatedTealIce.png',
    'icedGrenade1-18-23SaturatedTurquoiseIce.png',
    'icedGrenade1-18-23SaturatedYellowBlack.png',
    'standardGrenade1-18-23Blue.png',
    'standardGrenade1-18-23BlueStandard3.png',
    'standardGrenade1-18-23BrightBlueInvert.png',
    'standardGrenade1-18-23BrightGreenInvert2.png',
    'standardGrenade1-18-23BrightGreenStandard.png',
    'standardGrenade1-18-23GreenRed.png',
    'standardGrenade1-18-23InvertOrange.png',
    'standardGrenade1-18-23LightGreenStandard.png',
    'standardGrenade1-18-23OrangeInvert.png',
    'standardGrenade1-18-23OrangeStandard.png',
    'standardGrenade1-18-23PinkInvert2.png',
    'standardGrenade1-18-23PinkStandard.png',
    'standardGrenade1-18-23PinkStandardWhite.png',
    'standardGrenade1-18-23PurpleInvert.png',
    'standardGrenade1-18-23RedInvert.png',
    'standardGrenade1-18-23TealStandard.png',
    'standardGrenade1-18-23YellowInvert.png',
    // 'sharkGrenade1-18-23BlueS.png',
    // 'sharkGrenade1-18-23BrightGreenS.png',
    // 'sharkGrenade1-18-23GreenI.png',
    // 'sharkGrenade1-18-23LightBlueS.png',
    // 'sharkGrenade1-18-23NeonGreenI.png',
    // 'sharkGrenade1-18-23OrangeI.png',
    // 'sharkGrenade1-18-23PinkI.png',
    // 'sharkGrenade1-18-23PinkS.png',
    // 'sharkGrenade1-18-23PurpleS.png',
    // 'sharkGrenade1-18-23RedI.png',
    // 'sharkGrenade1-18-23RedS.png',
    // 'sharkGrenade1-18-23SeaFoamS.png',
    // 'sharkGrenade1-18-23YellowI.png',
    'iceGrenade1-18-23NormalCombo.gif',
    'iceGrenade1-18-23SaturatedCombo.gif',
    'SharkBomb-18-23Combo.gif',
    'standardGrenade1-18-23Combo.gif',
  ];
  // List<String> get pathToEachWinnableShank => _pathToEachWinnableShank;
  List<String> _pathToEachWinnableShank = [
    'bbbbPurpleBottleInvert.gif',
    'bbbbBlueKnucksInvert.gif',
    'bbbbDuctTapeKnifeInverse.gif',
    'bbbbHammerInvertBlue.gif',
    'bbbbKnuckKnifeInvert.gif',
    'bbbbMeatCleaverInvert.gif',
    'bbbbNinjaStarInvert.gif',
    'xxNinjaStar.gif',
  ];
  List<String> _pathToEachWinnableSkeletonGat = [
    'skeletonARPistolRemakeBlacksCombo.gif',
    'skeletonARPistolRemakeBlacksGreenCombo.gif',
    'skeletonARPistolRemakeBlacksPurpleCombo.gif',
    'skeletonARPistolRemakeBlacksYelllowCombo.gif',
    'skeletonARPistolRemakeColorfulCombos.gif',
    'skeletonARPistolRemakeWhiteBlackTealCombo.gif',
    'skeletonWhiteARPistolRemakeSkeletonHandXXX.png',
    'skeletonWhiteARPistolRemakeSkeletonHandBlack2.png',
    'skeletonWhiteARPistolRemakeSkeletonHandBluePink.png',
    'skeletonWhiteARPistolRemakeSkeletonHandBrightGreen.png',
    'skeletonWhiteARPistolRemakeSkeletonHandBrightYellow.png',
    'skeletonWhiteARPistolRemakeSkeletonHandGreen.png',
    'skeletonWhiteARPistolRemakeSkeletonHandTiffany.png',
    'skeletonWhiteARPistolRemakeSkeletonHandWhitePinkTint.png',
    'skeletonCompGunBlackxxx.png',
    'skeletonGunCompxxBlueOrange.png',
    'skeletonGunCompxxGreenNeonPink.png',
    'skeletonGunCompxxGreenPink.png',
    'skeletonGunCompxxGreenPurple.png',
    'skeletonGunCompxxInverseBlueOrangexxx.png',
    'skeletonGunCompxxInverseGreenPurple.png',
    'skeletonGunCompxxInverseNeonGreenPink.png',
    'skeletonGunCompxxInverseNeonGreenPink2.png',
    'skeletonGunCompxxInverseNeonPinkGreen.png',
    'skeletonGunCompxxInverseOrangeBlue.png',
    'skeletonGunCompxxInversePinkGreen.png',
    'skeletonGunCompxxInversePurpleGreen.png',
    'skeletonGunCompxxInverseRedGreen.png',
    'skeletonGunCompxxInverseRedWhiteBlue.png',
    'skeletonGunCompxxInverseTealYellow.png',
    'skeletonGunCompxxInverseTransGold.png',
    'skeletonGunCompxxInverseTurquoiseRed.png',
    'skeletonGunCompxxInverseWhitePinkTeal.png',
    'skeletonGunCompxxInverseYellowAndLightBlue.png',
    'skeletonGunCompxxInverseYellowBlue.png',
    'skeletonGunCompxxOrangeBlue.png',
    'skeletonGunCompxxYellowBlue.png',
    'skeletonWhiteARPistolRemakeSkeletonHand.png',
    'skeletonOpticPistolBlackNeonGreen.png',
    'skeletonOpticPistolBlackPurp.png',
    'skeletonOpticPistolBlackRed.png',
    'skeletonOpticPistolBlackSky.png',
    'skeletonOpticPistolBlackTan.png',
    'skeletonOpticPistolBlackTan2.png',
    'skeletonOpticPistolBlackTeal.png',
    'skeletonOpticPistolBlackYellow.png',
    'skeletonOpticPistolDarkPurpleOrange.png',
    'skeletonOpticPistolLightBlackGreen.png',
    'skeletonOpticPistolLightOrangeGreen.png',
    'skeletonOpticPistolLightOrangePink.png',
    'skeletonOpticPistolLightPink.png',
    'skeletonOpticPistolLightYellowBlack.png',
    'skeletonOpticPistolWhiteBlue.png',
    'skeletonDraco1.png',
    'skeletonDracoBlack.png',
    'skeletonDracoBlackBrass.png',
    'skeletonDracoBlackBrassbbb.png',
    'skeletonDracoBlackGreen.png',
    'skeletonDracoBlackGreenx.png',
    'skeletonDracoBlackGreenz.png',
    'skeletonDracoBlackOrangez.png',
    'skeletonDracoBlackPurplez.png',
    'skeletonDracoBlackRedx.png',
    'skeletonDracoBlackYellowz.png',
    'skeletonDracoBlueDark.png',
    'skeletonDracoBlueOrangeGreenbb.png',
    'skeletonDracoDarkPink.png',
    'skeletonDracoGoldPinkbbb.png',
    'skeletonDracoGreen.png',
    'skeletonDracoGreen2.png',
    'skeletonDracoInvert.png',
    'skeletonDracoOrangePink.png',
    'skeletonDracoOrangePinkx.png',
    'skeletonDracoPinkBabyBlue.png',
    'skeletonDracoPinkBlueGreenBB.png',
    'skeletonDracoPinkChrome.png',
    'skeletonDracoPinkMetal.png',
    'skeletonDracoPinkWhiteTiffanyxxx.png',
    'skeletonDracoPinkYellowBB.png',
    'skeletonDracoRed.png',
    'skeletonDracoRedBluebb.png',
    'skeletonDracoRedYellowPurplebb.png',
    'skeletonDracoWhite.png',
    'skeletonDracoWhiteBlueGreenx.png',
    'skeletonDracoWhiteGreenPinkYellow.png',
    'skeletonDracoWhitePink.png',
    'skeletonDracoWhitePink2.png',
    'skeletonDracoWhiteTurquoise.png',
    'skeletonDracoWhitexxx.png',
    'skeletonDracoYellow.png',
    'skeletonDracoYellowOrange.png',
    'skeletonDracoYellowPink.png',
    'skeletonCompGunCombo.gif',
    'skeletonDrakoCombo.gif',
    'skeletonGrenadeLauncherCombo.gif',
    'skeletonOpticPistolCombo.gif',
    'skeletonGrenadeLauncherRemakeGreen.png',
    'skeletonGrenadeLauncherRemakeHotPink.png',
    'skeletonGrenadeLauncherRemakePinkBlack.png',
    'skeletonGrenadeLauncherRemakePinkWhite.png',
    'skeletonGrenadeLauncherRemakeWhite.png',
    'skeletonGunARPistolStickMag.png',
    'skeletonGunARPistolStickMagOrange.png',
    'skeletonGunARPistolStickMagOrangeInvert.png',
    'skeletonGunARWhitePurple.png',
    'skeletonGunARWhiteTeal.png',
    'skeletonGunBlackGoldArPistol.png',
    'skeletonGunBlackGreenARPistol.png',
    'skeletonGunBlackPinkArPistol.png',
    'skeletonGunBlackPurpleArPistol.png',
    'skeletonGunBlackRedHandGun.png',
    'skeletonGunBluePistol.png',
    'skeletonGunChromeArPistol.png',
    'skeletonGunLightBlueBlackHandGun.png',
    'skeletonGunPinkPistol.png',
    'skeletonGunRedWhitePistol.png',
    'skeletonGunVector.png',
    'skeletonGunVectorBlueGreen.png',
    'skeletonGunVectorGrey.png',
    'skeletonGunVectorPinkDisturabance.png',
    'skeletonGunVectorPinkDisturbace2.png',
    'skeletonGunVectorPinkOrange.png',
    'skeletonGunVectorPinkPurple.png',
    'skeletonGunVectorPurpleBlue.png',
    'skeletonGunVectorRedYellowOrange.png',
    'skeletonGunVectorWhiteBlueInvert.png',
    'skeletonKeltechBlack.png',
    'skeletonKeltechBluedRed.png',
    'skeletonKeltechBlueGreen.png',
    'skeletonKeltechGreenedPink.png',
    'skeletonKeltechGreenPink.png',
    'skeletonKeltechGreenPurple.png',
    'skeletonKeltechOrangeGreen.png',
    'skeletonKeltechPinkBlue.png',
    'skeletonKeltechTealBrownze.png',
    'skeletonKeltechWhite.png',
    'skeletonKeltechWhiteOrangeBlue.png',
    'skeletonKeltechWhitePurpleGreen.png',
    'skeletonKeltechYellowPurple.png',
  ];
  List<String> _listOfPathsToFloppyFishFileNames = [
    'blueFishSpeedUp.gif',
    'goldFishSpeedUp.gif',
    'greenFishSpeedUp.gif',
    'pinkFishSpeedUp2.gif',
    'zzFish2.GIF',
  ];
  List<GenericWinnableItemFromChest> _winnables = [];
  List<String> _listOfPathsToFloppyFaceFileNames = [
    'zzDuck.gif',
    '21Savage.gif',
    'trumpHeadxx1-22-23.gif',
  ];
  List<HandColors> handColorsEnum = [
    HandColors.regular,
    HandColors.zombieGreen14,
    HandColors.blackRed18,
    HandColors.purple11,
    HandColors.greenPinkWhite17,
    HandColors.blackPink15,
    HandColors.redBlack12,
  ];
  List<String> get listOfPathsToFloppyFishFileNames =>
      _listOfPathsToFloppyFishFileNames;
  // List<String> backgroundImagesFileNames = [
  //   "dcLoopGrayScale.gif",
  //   "caveDarkRed.gif",
  //
  //   'caveLightBrown.gif',
  //   //
  //   // 'blackWater.gif',
  //   'fire.gif',
  //   // 'errorMessage.GIF',
  //   // 'redChip.jpg',
  //   // // 'enlessColorHoleRecoloredYellowOrange.gif',
  //   // 'fusion3.gif',
  //   // 'fusionRed.gif',
  //   // 'katyPerrySexy.gif',
  //   // 'microChipOne.gif',
  //   // "mileySnoopNicholasCage.gif",
  //   // 'purpleEnergyBlack.gif',
  //   // 'xxNinjaStar.gif',
  //   // 'colorfulX.gif',
  //   // 'colorful2.gif',
  //   // 'bloodMoon.gif',
  //   // 'blackWhiteExplosion.gif',
  //   // 'blackTunnel.gif',
  // "bgBlackHole.GIF",
  // "bgReactorCore.GIF",
  //
  //   // 'blackWater.gif',
  //   // "bgAlienWorld.GIF",
  //   // "bgApple.GIF",
  //   // "bgBitArtCity.GIF",
  //   // "bgBitArtTokyo.GIF",
  //   // "bgBitCity.GIF",
  //   "bgBlackHole.GIF",
  //   // "bgCityScape.GIF",
  //   // "bgColorCubes.GIF",
  //   // "bgColorSpirals.GIF",
  //   // "bgColorWaves.GIF",
  //   // "bgCube.GIF",
  //   // "bgEndlessRunner.GIF",
  //   // "bgFlower.GIF",
  //   // "bgFlowerX.GIF",
  //   // "bgForrestNight.GIF",
  //   // "bgForrestScary.GIF",
  //   // "bgHandStars.GIF",
  //   // "bgIllusion.GIF",
  //   // "bgOwl.GIF",
  //   // "bgPlanets.GIF",
  //   "bgReactorCore.GIF",
  //   // "bgRipples.GIF",
  //   // "bgSamuri.GIF",
  //   // "bgSpiralX.GIF",
  //   // "bgStar.GIF",
  //   // "bgTokyo.GIF",
  //   // "bgTriangleGlow.GIF",
  //   // "bgWaterWalker.GIF",
  //   // "bgWaves.GIF",
  //   // "bgWolfJump.GIF",
  //   // "bonusCar.GIF",
  //   // "bonusCar2.GIF",
  //   // "bonusCar3.GIF",
  //   // "bonusCar4.GIF",
  //   // "bonusCrumble.GIF",
  //   // "bonusEscalator2.GIF",
  //   // "bonusEww.GIF",
  //   // "bonusEyes.GIF",
  //   // "bonusGeo.GIF",
  //   // "bonusGeo2.GIF",
  //   // "bonusGeo3.GIF",
  //   // "bonusGeo4.GIF",
  //   // "bonusHotdog.GIF",
  //   // "bonusHotdog2.GIF",
  //   // "bonusHotdog3.GIF",
  //   // "bonusKaleido.GIF",
  //   // "bonusMountains.GIF",
  //   // "bonusMountains2.GIF",
  //   // "bonusRoad.GIF",
  //   // "bonusShapes.GIF",
  //   // "bonusShapes2.GIF",
  //   // "bonusShapes3.GIF",
  //   // "bonusShapes4.GIF",
  //   "bonusSpace2.GIF",
  //   // "bonusSpaceStairs.GIF",
  //   // "bonusSpiral.GIF",
  //   // "bonusSplash.GIF",
  //   // "bonusStayingAlive.GIF",
  //   // "bonusStreaks.GIF",
  //   // "bonusTractor.GIF",
  //   // "bonusTraffic.GIF",
  //   // "bonusTraffic2.GIF",
  //   // "bonusTraffic3.GIF",
  //   // "bonusTraffic4.GIF",
  // ];

  void updateHandToFloppyFishes() {
    if (indexToIterateThroughFloppyFishList <=
        _listOfPathsToFloppyFishFileNames.length - 1) {
      indexToIterateThroughFloppyFishList++;
    } else {
      indexToIterateThroughFloppyFishList = 0;
    }
    _pathToSelectedWalkingHand =
        _listOfPathsToFloppyFishFileNames[indexToIterateThroughFloppyFishList];
    notifyListeners();
  }

  // void toggleActivationOfFloppyFace() {
  //   _activatedFloppyFace = !_activatedFloppyFace;
  //   notifyListeners();
  // }

  void updateHandToFloppyFaces() {
    if (indexToIterateThroughFloppyFaceList <=
        _listOfPathsToFloppyFaceFileNames.length - 1) {
      indexToIterateThroughFloppyFaceList++;
    } else {
      indexToIterateThroughFloppyFaceList = 0;
    }
    _pathToSelectedWalkingHand =
        _listOfPathsToFloppyFaceFileNames[indexToIterateThroughFloppyFaceList];
    notifyListeners();
  }

  void nextHandColor() {
    if (_indexOfHandColorList <= handColorsEnum.length - 1) {
      _indexOfHandColorList++;
    } else {
      _indexOfHandColorList = 0;
    }
    updatePathToHandColor(HandColors.regular);
  }

  /// looks like this func might be getting called during gameplay perhaps on a level up or a double points
  void updatePathToHandColor(HandColors color) {
    if (color == HandColors.regular) {
      _pathToSelectedWalkingHand = 'trumpHeadxx1-22-23.gif';

      // _pathToSelectedWalkingHand = 'thingStichedWalkingXX.gif';
      _pathToSelectedDeadHand = 'thingRightTraced.png';
      notifyListeners();
    }
  }

  void toggleFireBallAmmo() {
    _activatedFireBallAmmo = !_activatedFireBallAmmo;
    notifyListeners();
  }

  void toggleSkeletonHand() {
    _activatedSkeletonHand = !_activatedSkeletonHand;
    notifyListeners();
  }

  void toggleFishAmmo() {
    _activatedTrumpAmmo = false;
    _activatedShankShooter = false;
    _activated40MMAmmo = false;
    _activatedColorChangingBullets = false;
    _activated20MMAmmo = false;
    _activatedFishAmmo = !_activatedFishAmmo;
    notifyListeners();
  }

  void toggleTrumpAmmo() {
    _activatedShankShooter = false;
    _activated40MMAmmo = false;
    _activatedColorChangingBullets = false;
    _activated20MMAmmo = false;
    _activatedFishAmmo = false;
    _activatedTrumpAmmo = !_activatedTrumpAmmo;
    notifyListeners();
  }

  void toggle20MMAmmo() {
    _activatedTrumpAmmo = false;
    _activatedFishAmmo = false;
    _activatedShankShooter = false;
    _activated40MMAmmo = false;
    _activatedColorChangingBullets = false;
    _activated20MMAmmo = !_activated20MMAmmo;
    notifyListeners();
  }

  void toggle40MMAmmo() {
    _activatedTrumpAmmo = false;

    _activatedFishAmmo = false;
    _activatedColorChangingBullets = false;
    _activatedShankShooter = false;
    _activated20MMAmmo = false;
    _activated40MMAmmo = !_activated40MMAmmo;
    notifyListeners();
  }

  void toggleColorChangingAmmo() {
    _activatedTrumpAmmo = false;

    _activatedFishAmmo = false;

    _activatedShankShooter = false;
    _activated20MMAmmo = false;
    _activated40MMAmmo = false;
    _activatedColorChangingBullets = !_activatedColorChangingBullets;
    notifyListeners();
  }

  void toggleShankShooter() {
    _activatedFishAmmo = false;

    _activated20MMAmmo = false;
    _activated40MMAmmo = false;
    _activatedTrumpAmmo = false;

    _activatedColorChangingBullets = false;
    _activatedShankShooter = !_activatedShankShooter;
    notifyListeners();
  }

  void toggleExplodingHitMarkers() {
    _activatedExplodingHitMarkers = !_activatedExplodingHitMarkers;
    notifyListeners();
  }

  void toggleExplodingRecoil() {
    _activatedExplodingRecoil = !_activatedExplodingRecoil;
    _activatedShellCasingsInsteadOfSparks = false;
    notifyListeners();
  }

  void toggleShellCasingsInsteadOfSparks() {
    _activatedShellCasingsInsteadOfSparks =
        !_activatedShellCasingsInsteadOfSparks;
    _activatedExplodingRecoil = false;
    notifyListeners();
  }

  void changeBarrier() {
    if (_iterateThroughBarrierIndex >= _barrierFileNames.length - 1) {
      _iterateThroughBarrierIndex = 0;
    } else {
      _iterateThroughBarrierIndex++;
    }
    _pathToSelectedBarrier = _barrierFileNames[_iterateThroughBarrierIndex];
    _pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';

    notifyListeners();
  }

  void changeBackgroundImageHorror(bool goBackwardsOnTheList) {
    /// go forward on the list
    if (goBackwardsOnTheList == false) {
      if (_horrorIndex >= backgroundImageFileNames.length) {
        /// start from the beginning of the list
        _horrorIndex = 0;
        _pathToSelectedBackgroundImage = backgroundImageFileNames[0];
        _pathToPreviousBackgroundImage =
            backgroundImageFileNames[backgroundImageFileNames.length - 1];
      } else {
        _horrorIndex++;
        _pathToSelectedBackgroundImage = backgroundImageFileNames[_horrorIndex];

        _pathToPreviousBackgroundImage =
            backgroundImageFileNames[_horrorIndex - 1];
      }
    } else {
      /// go backwards on the list
      if (_horrorIndex < 0) {
        /// if we have reached the beginning of the list
        _horrorIndex = backgroundImageFileNames.length - 1;

        _pathToSelectedBackgroundImage =
            backgroundImageFileNames[backgroundImageFileNames.length - 1];

        _pathToPreviousBackgroundImage = backgroundImageFileNames[0];
      } else {
        _horrorIndex--;
        _pathToPreviousBackgroundImage =
            backgroundImageFileNames[_horrorIndex - 1];

        _pathToSelectedBackgroundImage = backgroundImageFileNames[_horrorIndex];
      }
    }
    notifyListeners();
  }

  void changeKnife(String knifePath) {
    _pathToSelectedKnife = knifePath;
    // _shouldHideTheLastPrize = true;
    _pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';

    notifyListeners();
  }

  void changeBeast(String beastPath) {
    _pathToSelectedBeast = beastPath;
    // _shouldHideTheLastPrize = true;
    _pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';

    notifyListeners();
  }

  void changeRocket(String rocketPath) {
    _pathToSelectedBeast = rocketPath;
    // _shouldHideTheLastPrize = true;
    _pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';

    notifyListeners();
  }

  void changeConsole(String consolePath) {
    _pathToSelectedGameConsole = consolePath;
    // _shouldHideTheLastPrize = true;
    _pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';

    notifyListeners();
  }

  void changeConsoleForTesting() {
    if (_consoleListIndex > _listOfConsoles.length - 1) {
      _consoleListIndex = 0;
    } else {
      _consoleListIndex++;
    }
    _pathToSelectedGameConsole = _listOfConsoles[_consoleListIndex];
    // _shouldHideTheLastPrize = true;
    _pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';
    notifyListeners();
  }

  void changeConsoleForTestingBackwards() {
    if (_consoleListIndex < 0) {
      _consoleListIndex = _listOfConsoles.length - 1;
    } else {
      _consoleListIndex--;
    }
    _pathToSelectedGameConsole = _listOfConsoles[_consoleListIndex];
    // _shouldHideTheLastPrize = true;
    _pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';
    notifyListeners();
  }

  /// skeleton gats
  ///

  void addAllSkeletonGatsAsAvailableForTesting() {
    _addedAllSkeletonGuns = !_addedAllSkeletonGuns;
    if (_addedAllSkeletonGuns == false) {
      itemsWonThatAreAvailableToEquip = [];
      for (var i = 0; i < _pathToEachWinnableSkeletonGat.length - 1; i++) {
        itemsWonThatAreAvailableToEquip.add(PremiumGatsAndGrenades(
            type: PremiumContentType.gat,
            path: _pathToEachWinnableSkeletonGat[i]));
      }
    } else {
      itemsWonThatAreAvailableToEquip = [];
    }

    notifyListeners();
  }

  void changeGat(String gatName) {
    _playersGatChoiceString = gatName;
    // _shouldHideTheLastPrize = true;
    _pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';

    notifyListeners();
  }

  void changeGrenade(String grenadeName) {
    _playersGrenadeChoiceString = grenadeName;
    // _shouldHideTheLastPrize = true;
    _pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';

    notifyListeners();
  }

  void setLastPrizeTypeForCongratsMessage() {
    var type = itemsWonThatAreAvailableToEquip[
            itemsWonThatAreAvailableToEquip.length - 1]
        .type;
    if (type == PremiumContentType.gat) {
      _lastWonPrizeTypeForTheCongratsMessage = 'gat';
    } else if (type == PremiumContentType.shank) {
      _lastWonPrizeTypeForTheCongratsMessage = 'shank';
    } else if (type == PremiumContentType.console) {
      _lastWonPrizeTypeForTheCongratsMessage = 'console';
    } else if (type == PremiumContentType.beast) {
      _lastWonPrizeTypeForTheCongratsMessage = 'beast';
    } else if (type == PremiumContentType.grenade) {
      _lastWonPrizeTypeForTheCongratsMessage = 'time bomb';
    }
    notifyListeners();
  }

  void equipLastWonPrize() {
    // _heightOfNewItemForAnimationWhenOpeningChest = 0;
    var lastWonPrizeType = itemsWonThatAreAvailableToEquip[
            itemsWonThatAreAvailableToEquip.length - 1]
        .type;
    var lastWonItemPath = itemsWonThatAreAvailableToEquip[
            itemsWonThatAreAvailableToEquip.length - 1]
        .path;
    if (lastWonPrizeType == PremiumContentType.gat) {
      changeGat(lastWonItemPath);
    } else if (lastWonPrizeType == PremiumContentType.grenade) {
      changeGrenade(lastWonItemPath);
    } else if (lastWonPrizeType == PremiumContentType.beast) {
      changeBeast(lastWonItemPath);
    } else if (lastWonPrizeType == PremiumContentType.shank) {
      changeKnife(lastWonItemPath);
    } else if (lastWonPrizeType == PremiumContentType.console) {
      changeConsole(lastWonItemPath);
    }
    notifyListeners();
  }

  void handleAnimation() {
    for (var i = 0; i < 300; i++) {
      /// TODO this is where the item size is decided, if game console is won, then size should be different
      /// the brass knucks dont fit either!
      _heightOfNewItemForAnimationWhenOpeningChest = 100;
      _widthOfNewItemForAnimationWhenOpeningChest = 100;
      Timer(Duration(milliseconds: i * 4), () {
        _heightOfNewItemForAnimationWhenOpeningChest++;
        _widthOfNewItemForAnimationWhenOpeningChest++;
        notifyListeners();
      });
    }
  }

  void handleAnimationWhenSelectingAnItemFromList(String itemPath) {
    _pathToNewItemFromChest = itemPath;
    _shouldHideTheLastPrize = false;
    for (var i = 0; i < 300; i++) {
      _heightOfNewItemForAnimationWhenOpeningChest = 100;
      _widthOfNewItemForAnimationWhenOpeningChest = 100;
      Timer(Duration(milliseconds: i * 4), () {
        _heightOfNewItemForAnimationWhenOpeningChest++;
        _widthOfNewItemForAnimationWhenOpeningChest++;
        notifyListeners();
      });
    }
  }

  void closeChestAndHideLastPrize() {
    _shouldHideTheLastPrize = true;

    _pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';
    _heightOfNewItemForAnimationWhenOpeningChest = 0;
    notifyListeners();
  }

  void openChestToGetRandomPrize() async {
    //// each winnable item type has it's own list
    // the random int should be a combination of each winnable (length - 1)
    /// add a widget with that index for that list
    closeChestAndHideLastPrize();
    Timer(Duration(milliseconds: 1200), () {
      _shouldHideTheLastPrize = false;
      _pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';
      notifyListeners();

      handleAnimation();
    });
    int _randomIntRepresentingOneTypeOfItemWon;
    int _randomIntRepresetingPrizeIndex;
    _randomIntRepresentingOneTypeOfItemWon = Random().nextInt(3);
    if (_randomIntRepresentingOneTypeOfItemWon == 1) {
      /// player won a gat
      /// pick a random prize index
      /// then add a premium item with type gat to the user's available items
      _randomIntRepresetingPrizeIndex =
          Random().nextInt(_pathToEachWinnableSkeletonGat.length - 1);
      itemsWonThatAreAvailableToEquip.add(PremiumGatsAndGrenades(
          path: _pathToEachWinnableSkeletonGat[_randomIntRepresetingPrizeIndex],
          type: PremiumContentType.gat));
      _pathToNewItemFromChest =
          _pathToEachWinnableSkeletonGat[_randomIntRepresetingPrizeIndex];
    } else if (_randomIntRepresentingOneTypeOfItemWon == 2) {
      /// player won a grenade
      _randomIntRepresetingPrizeIndex =
          Random().nextInt(_pathToEachWinnableGrenade.length - 1);
      itemsWonThatAreAvailableToEquip.add(PremiumGatsAndGrenades(
          path: _pathToEachWinnableGrenade[_randomIntRepresetingPrizeIndex],
          type: PremiumContentType.grenade));
      _pathToNewItemFromChest =
          _pathToEachWinnableGrenade[_randomIntRepresetingPrizeIndex];
    } else if (_randomIntRepresentingOneTypeOfItemWon == 3) {
      /// player won a beast
      _randomIntRepresetingPrizeIndex =
          Random().nextInt(_pathToEachWinnableBeast.length - 1);
      itemsWonThatAreAvailableToEquip.add(PremiumGatsAndGrenades(
          path: _pathToEachWinnableBeast[_randomIntRepresetingPrizeIndex],
          type: PremiumContentType.beast));
      _pathToNewItemFromChest =
          _pathToEachWinnableBeast[_randomIntRepresetingPrizeIndex];
    } else if (_randomIntRepresentingOneTypeOfItemWon == 0) {
      _randomIntRepresetingPrizeIndex =
          Random().nextInt(_pathToEachWinnableShank.length - 1);

      /// player won a shank
      itemsWonThatAreAvailableToEquip.add(PremiumGatsAndGrenades(
          path: _pathToEachWinnableShank[_randomIntRepresetingPrizeIndex],
          type: PremiumContentType.shank));
      _pathToNewItemFromChest =
          _pathToEachWinnableShank[_randomIntRepresetingPrizeIndex];
    }

    notifyListeners();
    Timer(Duration(milliseconds: 1200), () {
      _pathToChangeChestImageFromClosedToOpen = 'pinkChestOpen.gif';
      notifyListeners();
    });

    setLastPrizeTypeForCongratsMessage();
  }

  Column displayAllWinnables() {
    /// clear previous widgets to prevent duplicats
    _winnables = [];

    /// create a generic winnable widget for each type
    /// guns
    for (var i = 0; i < _pathToEachWinnableSkeletonGat.length - 1; i++) {
      _winnables.add(GenericWinnableItemFromChest(
          path: _pathToEachWinnableSkeletonGat[i]));
    }
    for (var i = 0; i < _pathToEachWinnableGrenade.length - 1; i++) {
      _winnables.add(
          GenericWinnableItemFromChest(path: _pathToEachWinnableGrenade[i]));
    }
    for (var i = 0; i < _pathToEachWinnableBeast.length - 1; i++) {
      _winnables
          .add(GenericWinnableItemFromChest(path: _pathToEachWinnableBeast[i]));
    }
    for (var i = 0; i < _pathToEachWinnableShank.length - 1; i++) {
      _winnables
          .add(GenericWinnableItemFromChest(path: _pathToEachWinnableShank[i]));
    }
    return Column(
      children: _winnables,
    );
  }
}
