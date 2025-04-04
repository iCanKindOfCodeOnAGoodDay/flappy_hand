import 'dart:async';
import 'dart:math';

import 'package:flappy_taco/constant_lists.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/game_screen/game_screen_drawers/chest_drawer_view/chest/available_prize.dart';
import '../widgets/game_screen/game_screen_drawers/chest_drawer_view/prizes/others_changes/winnable_gun.dart';

/*

March 2025

Settings & customizations are configured
Variable Data Is Provided to UI
The user must change settings_view
for any of these
methods
to be called

   */

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

class SettingsDataProvider with ChangeNotifier {
  int indexToIterateThroughFloppyFishList = 0;
  bool activatedFloppyFish = false;
  // String pathToSelectedBackgroundImage = 'warp_speed_5fps.gif'; // animated background
  // String pathToSelectedBackgroundImage =
  //     'space_zombie_lower_position_background_square.png'; // static background
  String pathToSelectedBackgroundImage =
      'cyber_black_game_screen.PNG'; // black background
  // String pathToPreviousBackgroundImage =
  //     'space_zombie_background_square.PNG'; // for what?
  String pathToPreviousBackgroundImage =
      'space_zombie_lower_position_background_square.png'; // for what?
  bool activatedFloppyFace = false;
  int indexToIterateThroughFloppyFaceList = 0;
  String pathToSelectedWalkingHand = 'astronaut2.GIF';
  // 'eyeBallFlying2.gif;
  // first import was not loading so changed to new file -- we can use this image for 'bird' but not for extra lives bottom view_box?
  String pathToSelectedDeadHand = 'astronaut2.GIF';
  HandColors selectedHandColor = HandColors.regular;
  int _indexOfHandColorList = 0;
  String pathToSelectedBarrier =
      'mmZombieChargeInvertRed.gif'; // todo remove: this is no longer used
  bool activatedFireBallAmmo = true;
  bool activatedSkeletonHand = false;
  bool activatedFishAmmo = false;
  bool activatedTrumpAmmo = false;
  bool activated20MMAmmo = false;
  // default 20mm ammo activitated - although does not really match with picks and cannons and bottom view_box bullets
  bool activated40MMAmmo = true;
  bool activatedColorChangingBullets = false;
  bool activatedShankShooter = false;
  // default exploding ammo contact with view_box
  bool activatedExplodingAmmo = true;

  /// default recoil that explodes
  bool activatedExplodingRecoil = true;
  bool activatedShellCasingsInsteadOfSparks = false;
  int iterateThroughBarrierIndex = 0;

  ///  remove unused code that used to be able to select background images
  int backgroundIndex = 0;
  String gunPath = 'skeletonDracoPinkChrome.png';
  String grenadePath = 'standardGrenade1-18-23BrightGreenStandard.png';
  String pathToNewItemFromChest = 'xThingKeltechPistol.png';
  int rubies = 1985;
  String pathToSelectedKnife = 'switchBladeBloody.gif';
  String monsterPath = 'friendlyMonster3.gif';
  String pathToSelectedRocket =
      'img-handWings2-16-23.png'; // what was the rocket? Dont remember which power up position
  String pathToSelectedGameConsole =
      'futuristicGameConsoleNoLogo2BLANKLOGO copy 3.png';
  int consoleListIndex = 0;
  bool addedAllSkeletonGuns = false;
  String lastWonPrizeTypeForTheCongratsMessage = 'gun';
  String pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';
  double chestAnimationWidth = 0.0;
  double chestAnimationHeight = 0.0;
  bool shouldHideTheLastPrize = true;

  /// this is the variable if last prize should be hidden, default

  List<PremiumItems> itemsWonThatAreAvailableToEquip = [
    PremiumItems(
        type: PremiumContentType.gat, path: 'skeletonDracoPinkChrome.png'),
    PremiumItems(
        type: PremiumContentType.grenade,
        path: 'standardGrenade1-18-23BrightGreenStandard.png'),
    PremiumItems(type: PremiumContentType.shank, path: 'switchBladeBloody.gif'),
  ];

  /*

  At this point
  We start with customization availble from the end drawer.
  All customizations available from the chest_drawer_view
  are below this section.

   */

  List<HandColors> handColorsEnum = [
    HandColors.regular,
    HandColors.zombieGreen14,
    HandColors.blackRed18,
    HandColors.purple11,
    HandColors.greenPinkWhite17,
    HandColors.blackPink15,
    HandColors.redBlack12,
  ];

  void setFish() {
    if (indexToIterateThroughFloppyFishList <= moreFish.length - 1) {
      indexToIterateThroughFloppyFishList++;
    } else {
      indexToIterateThroughFloppyFishList = 0;
    }
    pathToSelectedWalkingHand = moreFish[indexToIterateThroughFloppyFishList];
    notifyListeners();
  }

  void setFace() {
    if (indexToIterateThroughFloppyFaceList <= faces.length - 1) {
      indexToIterateThroughFloppyFaceList++;
    } else {
      indexToIterateThroughFloppyFaceList = 0;
    }
    pathToSelectedWalkingHand = faces[indexToIterateThroughFloppyFaceList];
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
      pathToSelectedWalkingHand = 'trumpHeadxx1-22-23.gif';
      pathToSelectedDeadHand = 'thingRightTraced.png';
      notifyListeners();
    }
  }

  void toggleFireBallAmmo() {
    activatedFireBallAmmo = !activatedFireBallAmmo;
    notifyListeners();
  }

  void toggleSkeletonHand() {
    activatedSkeletonHand = !activatedSkeletonHand;
    notifyListeners();
  }

  void toggleFishAmmo() {
    activatedTrumpAmmo = false;
    activatedShankShooter = false;
    activated40MMAmmo = false;
    activatedColorChangingBullets = false;
    activated20MMAmmo = false;
    activatedFishAmmo = !activatedFishAmmo;
    notifyListeners();
  }

  void toggleTrumpAmmo() {
    activatedShankShooter = false;
    activated40MMAmmo = false;
    activatedColorChangingBullets = false;
    activated20MMAmmo = false;
    activatedFishAmmo = false;
    activatedTrumpAmmo = !activatedTrumpAmmo;
    notifyListeners();
  }

  void toggle20MMAmmo() {
    activatedTrumpAmmo = false;
    activatedFishAmmo = false;
    activatedShankShooter = false;
    activated40MMAmmo = false;
    activatedColorChangingBullets = false;
    activated20MMAmmo = !activated20MMAmmo;
    notifyListeners();
  }

  void toggle40MMAmmo() {
    activatedTrumpAmmo = false;
    activatedFishAmmo = false;
    activatedColorChangingBullets = false;
    activatedShankShooter = false;
    activated20MMAmmo = false;
    activated40MMAmmo = !activated40MMAmmo;
    notifyListeners();
  }

  void toggleColorChangingAmmo() {
    activatedTrumpAmmo = false;
    activatedFishAmmo = false;
    activatedShankShooter = false;
    activated20MMAmmo = false;
    activated40MMAmmo = false;
    activatedColorChangingBullets = !activatedColorChangingBullets;
    notifyListeners();
  }

  void toggleShankShooter() {
    activatedFishAmmo = false;
    activated20MMAmmo = false;
    activated40MMAmmo = false;
    activatedTrumpAmmo = false;
    activatedColorChangingBullets = false;
    activatedShankShooter = !activatedShankShooter;
    notifyListeners();
  }

  void toggleExplodingHitMarkers() {
    activatedExplodingAmmo = !activatedExplodingAmmo;
    notifyListeners();
  }

  void toggleExplodingRecoil() {
    activatedExplodingRecoil = !activatedExplodingRecoil;
    activatedShellCasingsInsteadOfSparks = false;
    notifyListeners();
  }

  void toggleShellCasingsInsteadOfSparks() {
    activatedShellCasingsInsteadOfSparks =
        !activatedShellCasingsInsteadOfSparks;
    activatedExplodingRecoil = false;
    notifyListeners();
  }

  void changeBarrier() {
    if (iterateThroughBarrierIndex >= buildingBarrierFileNames.length - 1) {
      iterateThroughBarrierIndex = 0;
    } else {
      iterateThroughBarrierIndex++;
    }
    pathToSelectedBarrier =
        buildingBarrierFileNames[iterateThroughBarrierIndex];
    pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';

    notifyListeners();
  }

  void changeBackground(bool n) {
    if (n == false) {
      if (backgroundIndex >= backgroundImageFileNames.length) {
        /// start from the beginning of the list
        backgroundIndex = 0;
        pathToSelectedBackgroundImage = backgroundImageFileNames[0];
        pathToPreviousBackgroundImage =
            backgroundImageFileNames[backgroundImageFileNames.length - 1];
      } else {
        backgroundIndex++;
        pathToSelectedBackgroundImage =
            backgroundImageFileNames[backgroundIndex];

        pathToPreviousBackgroundImage =
            backgroundImageFileNames[backgroundIndex - 1];
      }
    } else {
      /// go backwards on the list
      if (backgroundIndex < 0) {
        /// if we have reached the beginning of the list
        backgroundIndex = backgroundImageFileNames.length - 1;

        pathToSelectedBackgroundImage =
            backgroundImageFileNames[backgroundImageFileNames.length - 1];

        pathToPreviousBackgroundImage = backgroundImageFileNames[0];
      } else {
        backgroundIndex--;
        pathToPreviousBackgroundImage =
            backgroundImageFileNames[backgroundIndex - 1];

        pathToSelectedBackgroundImage =
            backgroundImageFileNames[backgroundIndex];
      }
    }
    notifyListeners();
  }

  void changeKnife(String knifePath) {
    pathToSelectedKnife = knifePath;
    pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';
    notifyListeners();
  }

  void changeBeast(String beastPath) {
    monsterPath = beastPath;
    pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';
    notifyListeners();
  }

  void changeRocket(String rocketPath) {
    monsterPath = rocketPath;
    pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';
    notifyListeners();
  }

  // what are the differencce and which is used????
  void changeConsole(String consolePath) {
    pathToSelectedGameConsole = consolePath;
    pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';
    notifyListeners();
  }

  //
  //
  // what are the differencce and which is used????
  //
  //
  void changeConsoleForTesting() {
    if (consoleListIndex > consolePathList.length - 1) {
      consoleListIndex = 0;
    } else {
      consoleListIndex++;
    }
    pathToSelectedGameConsole = consolePathList[consoleListIndex];
    pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';
    notifyListeners();
  }

  // what are the differencce and which is used????
  void changeConsoleForTestingBackwards() {
    if (consoleListIndex < 0) {
      consoleListIndex = consolePathList.length - 1;
    } else {
      consoleListIndex--;
    }
    pathToSelectedGameConsole = consolePathList[consoleListIndex];
    pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';
    notifyListeners();
  }

  /*

  At this point
  We have reached the chest_drawer_view.
  All customizations available from the chest_drawer_view
  are available below.

   */

  void addAllSkeletonGatsAsAvailableForTesting() {
    addedAllSkeletonGuns = !addedAllSkeletonGuns;
    if (addedAllSkeletonGuns == false) {
      itemsWonThatAreAvailableToEquip = [];
      for (var i = 0; i < guns.length - 1; i++) {
        itemsWonThatAreAvailableToEquip
            .add(PremiumItems(type: PremiumContentType.gat, path: guns[i]));
      }
    } else {
      itemsWonThatAreAvailableToEquip = [];
    }

    notifyListeners();
  }

  void changeGun(String gatName) {
    gunPath = gatName;
    // shouldHideTheLastPrize = true;
    pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';

    notifyListeners();
  }

  void changeGrenade(String grenadeName) {
    grenadePath = grenadeName;
    // shouldHideTheLastPrize = true;
    pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';

    notifyListeners();
  }

  void setLastPrizeTypeForCongratsMessage() {
    var type = itemsWonThatAreAvailableToEquip[
            itemsWonThatAreAvailableToEquip.length - 1]
        .type;
    if (type == PremiumContentType.gat) {
      lastWonPrizeTypeForTheCongratsMessage = 'gun';
    } else if (type == PremiumContentType.shank) {
      lastWonPrizeTypeForTheCongratsMessage = 'knife';
    } else if (type == PremiumContentType.console) {
      lastWonPrizeTypeForTheCongratsMessage = 'console';
    } else if (type == PremiumContentType.beast) {
      lastWonPrizeTypeForTheCongratsMessage = 'monster';
    } else if (type == PremiumContentType.grenade) {
      lastWonPrizeTypeForTheCongratsMessage = 'grenade';
    }
    notifyListeners();
  }

  void equipLastWonPrize() {
    // height = 0;
    var lastWonPrizeType = itemsWonThatAreAvailableToEquip[
            itemsWonThatAreAvailableToEquip.length - 1]
        .type;
    var lastWonItemPath = itemsWonThatAreAvailableToEquip[
            itemsWonThatAreAvailableToEquip.length - 1]
        .path;
    if (lastWonPrizeType == PremiumContentType.gat) {
      changeGun(lastWonItemPath);
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

  // chest_drawer_view animation
  void handleOpenChestAnimation() {
    for (var i = 0; i < 250; i++) {
      chestAnimationHeight = 30;
      chestAnimationWidth = 30;
      Timer(Duration(milliseconds: i * 4), () {
        chestAnimationHeight++;
        chestAnimationWidth++;
        notifyListeners();
      });
    }
  }

  // chest_drawer_view animation
  void handleAnimationWhenSelectingAnItemFromList(String itemPath) {
    pathToNewItemFromChest = itemPath;
    shouldHideTheLastPrize = false;
    for (var i = 0; i < 200; i++) {
      chestAnimationHeight = 100;
      chestAnimationWidth = 100;
      Timer(Duration(milliseconds: i * 4), () {
        chestAnimationHeight++;
        chestAnimationWidth++;
        notifyListeners();
      });
    }
  }

  // chest_drawer_view animation
  void closeChestAndHideLastPrize() {
    shouldHideTheLastPrize = true;
    pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';
    chestAnimationHeight = 0;
    notifyListeners();
  }

  // chest_drawer_view animation
  void openChestToGetRandomPrize() async {
    closeChestAndHideLastPrize();
    Timer(Duration(milliseconds: 1200), () {
      shouldHideTheLastPrize = false;
      pathToChangeChestImageFromClosedToOpen = 'pinkChestClosed.gif';
      notifyListeners();
      handleOpenChestAnimation();
    });
    int r;
    int i;
    r = Random().nextInt(3);
    if (r == 1) {
      i = Random().nextInt(guns.length - 1);
      itemsWonThatAreAvailableToEquip
          .add(PremiumItems(path: guns[i], type: PremiumContentType.gat));
      pathToNewItemFromChest = guns[i];
    } else if (r == 2) {
      /// player won a grenade
      i = Random().nextInt(grenades.length - 1);
      itemsWonThatAreAvailableToEquip.add(
          PremiumItems(path: grenades[i], type: PremiumContentType.grenade));
      pathToNewItemFromChest = grenades[i];
    } else if (r == 3) {
      /// player won a beast
      i = Random().nextInt(beasts.length - 1);
      itemsWonThatAreAvailableToEquip
          .add(PremiumItems(path: beasts[i], type: PremiumContentType.beast));
      pathToNewItemFromChest = beasts[i];
    } else if (r == 0) {
      i = Random().nextInt(knives.length - 1);

      /// player won a knife
      itemsWonThatAreAvailableToEquip
          .add(PremiumItems(path: knives[i], type: PremiumContentType.shank));
      pathToNewItemFromChest = knives[i];
    }

    notifyListeners();
    // Timer(Duration(milliseconds: 1200), () {
    //   pathToChangeChestImageFromClosedToOpen = 'pinkChestOpen.gif';
    //   notifyListeners();
    // });

    setLastPrizeTypeForCongratsMessage();
  }

  ListView displayAllWinnables() {
    /// clear previous widgets to prevent duplicats
    winnables = [];

    /// create a generic winnable widget for each type
    /// guns
    for (var i = 0; i < guns.length - 1; i++) {
      winnables.add(AvailablePrize(path: guns[i]));
    }
    for (var i = 0; i < grenades.length - 1; i++) {
      winnables.add(AvailablePrize(path: grenades[i]));
    }
    for (var i = 0; i < beasts.length - 1; i++) {
      winnables.add(AvailablePrize(path: beasts[i]));
    }
    for (var i = 0; i < knives.length - 1; i++) {
      winnables.add(AvailablePrize(path: knives[i]));
    }
    return ListView(
      scrollDirection: Axis.horizontal,
      children: winnables,
    );
  }
}
