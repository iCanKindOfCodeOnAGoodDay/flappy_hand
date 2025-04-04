// /// TODO remove to work with newBuildings
// void updateColumns() {
//   double screenWidth =
//       MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
//   // Move all obstacles left
//   for (int i = 0; i < _columnPositions.length; i++) {
//     _columnPositions[i] -= obstacleSpeed;
//   }
//   notifyListeners(); // Update UI
// }
//
// /// TODO remove to work with newBuildings
// List<Buildings> get buildings => List.generate(
//   /*
//     Building Height Key
//
//         --
//     21        gold coin
//     PU 0      power-up building
//     <=5       bottom building - any value less than zero creates an empty space
//     20        gold coin
//     6-11      top building - any value greater than 11, but not 20 and 21 is used to create empty space
//                            - note, ignored if power up position is zero above
//
//
//     Building heights work with Collision detection
//     checks power-up, top building, then bottom building
//       How frequently are you updating the list of buildings?
//
//
//      */
//   _columnPositions.length,
//       (index) => Buildings(
//     positionX: _columnPositions[index], // ✅ Position changes dynamically
//     // positionX: 4,
//
//     //TODO this is not the formula for building heights...
//     buildingHeight: 7,
//     powerUpPosition: _assignPowerUp(index), // ✅ Assign power-ups randomly
//   ),
// );
//
// /// TODO remove to work with newBuildings
// void createBuildingNew(buildingHeight) {
//   /*
//               21        gold coin
//               PU 0      power-up building
//               <=5       bottom building - any value less than zero creates an empty space
//               20        gold coin
//               6-11      top building
//               How to create empty space building?
//    */
//   buildings.add(Buildings(
//     positionX: _columnPositions.last, //  Position changes dynamically
//     buildingHeight: buildingHeight,
//
//     /// top o bottom, what type of buildling?
//     powerUpPosition: Random().nextInt(40), //  Assign power-ups randomly
//   ));
//   buildings.removeAt(0); // maybe should check if there is one there for now?
// }
//
// /// TODO remove to work with newBuildings
// // Function to assign power-ups dynamically
// int _assignPowerUp(int index) {
//   if (index % 7 == 0) return 7; // Knife
//   if (index % 6 == 0) return 8; // Grenade
//   if (index % 9 == 0) return 10; // Blood
//   return 0; // No power-up
// }
//
// /// TODO remove to work with newBuildings
// ///TODO you are never adding new buildings
// List<double> _columnPositions = [
//   1,
//   100,
//   200,
//   300,
//   400,
//   500,
//   600,
//   700,
// ]; // X positions of columns
//
// /// TODO remove to work with newBuildings
// void createBuilding() {
//   /// this function creates a zombie obstacle.
//   // BuildingWidget theLast = elements[0];
//   if (crashed == false) {
//     if (_columnPositions[0] <= 1) {
//       _columnPositions.removeAt(0);
//       _columnPositions.add(700);
//       _columnPositions[0] -= 50;
//     }
//     // theLast = buildings[0];Z
//     // buildings.removeAt(0);
//     // buildings.insert(
//     //     buildings.length,
//     //     Buildings(
//     //       buildingHeight: 2,
//     //
//     //       powerUpPosition: 0,
//     //       positionX: 700,
//     //     ));
//     playerCollisionChecker();
//   }
//   notifyListeners();
// }
//
// /// TODO remove to work with newBuildings
// // not being called ever anyways
// void createEmptyBuildingSpace() {
//   playerCollisionChecker(); // Check for collisions
//   if (_columnPositions.isNotEmpty) {
//     print(_columnPositions);
//   }
//   // Get the position of the last building to determine spacing for the new one
//   double lastX = _columnPositions.isNotEmpty
//       ? _columnPositions.last
//       : MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width +
//       50;
//   // Insert a new "empty space" building at the correct position
//   _columnPositions.add(lastX + 100); // Ensures spacing is maintained
//   notifyListeners(); // Update UI
// }
//
// /// TODO remove to work with newBuildings
// final double obstacleSpeed = 3.0; // Pixels per frame
//
// /// Looks like this has been declared throughout the file but is updated in functions
// // Instance of Game Speed Timer
// Timer gameSpeedTimer = // 1.5 seconds
// Timer.periodic(Duration(microseconds: 150000), (timer) {});
//
// /// TODO remove to work with newBuildings
// void resetBuildings() {
//   double screenWidth =
//       MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
//   for (int i = 0; i < 8; i++) {
//     _columnPositions.add(screenWidth +
//         (i * 150)); // Reduce spacing to make them visible faster
//   }
//
//   print("Initial Column Positions: $_columnPositions");
//
//   notifyListeners();
// }
//
// /// TODO remove to work with newBuildings
// // not really sure what the purpose of these were?
// Buildings theLast = Buildings(
//   buildingHeight: 0,
//   powerUpPosition: 0,
//   positionX:
//   MediaQueryData.fromView(WidgetsBinding.instance.window).size.width + 50,
// );
//
// /// TODO remove to work with newBuildings
// Buildings secondToLast = Buildings(
//   buildingHeight: 0,
//   powerUpPosition: 0,
//   positionX:
//   MediaQueryData.fromView(WidgetsBinding.instance.window).size.width + 50,
// );
//
// // hand fall and hand jump check collision - put them in here
// // then use new method of moving the 'buildings'
// // game loop
// void startGame() {
//   /*
//
//   March 2025,
//
//   How many calls is the game making per micro second here?
//   This could be the cause of system overload.
//
//   The game is performing too many instructions too rapidly.
//
//   gameSpeedTimer is a local variable
//
//   Once this function is called it never stops running
//   Because the timer.periodic keeps making the comparisons and calls
//
//   until crashed == true, then the timer cancels
//
//    */
//   // resetBuildings();
//
//   /// TODO remove to work with newBuildings
//   List<Buildings> startingBuildings = List.generate(
//       _columnPositions.length,
//           (index) => Buildings(
//           buildingHeight: 1,
//           powerUpPosition: 6,
//           positionX: _columnPositions[index]));
//   for (Buildings b in startingBuildings) {
//     buildings.add(b);
//   }
//
//   showADeadHand = false;
//
//   // game loop
//   gameSpeedTimer = Timer.periodic(Duration(seconds: 1), (timer) {
//     if (crashed == false) {
//       updateProgressMessage();
//       if (isPaused == false) {
//         score + 1;
//         if (buildingSpace >= 3) {
//           // startGame(); // this is a recursive call!! and we are inside of a timer periodic
//
//           print(buildings);
//
//           /// TODO remove to work with newBuildings
//           createBuilding(); // elements resources are managed by only having a fixed amount
//           contactWithPowerUpChecker();
//           checkForPowerDowns();
//           buildingSpace = 0;
//           // cancelGameSpeedTimerToCreateANewOne(); // manage timer resource
//           /*
//
//             You are creating a new timer object ever how many microseconds?
//
//              */
//         } else {
//           buildingSpace++;
//           // createEmptyBuildingSpace();
//           contactWithPowerUpChecker();
//           checkForPowerDowns();
//           notifyListeners();
//         }
//       }
//     } else {
//       /// TODO - well, else what?
//     }
//   });
//   notifyListeners();
// }

// todo - zombie collision checker with gun 1 and 2
// void gunShotZombieCollisionChecker1() {
//   for (var i = 0; i < 11; i++) {
//     if (buildings[i].buildingHeight <= 5) {
//       if (buildings[i].buildingHeight >= playerPosition &&
//           buildings[i].buildingHeight <= 12 &&
//           buildings[i].buildingHeight >= 1) {
//         /// then contact has been made
//         handleComboHitsMessageAndHoldTripleHit();
//
//         /// decrease the building height
//         buildings[i].buildingHeight = buildings[i].buildingHeight - 1;
//         bulletZombieContactGrid.removeAt(i);
//         bulletZombieContactGrid.insert(
//             i,
//             BulletContactCheckerColumns(
//                 potentialContactPosition: playerPosition));
//
//         /// add a animation when the gunshot hits a target
//         notifyListeners();
//         Future.delayed(Duration(milliseconds: 400), () {
//           resetBulletContactCheckerColumns();
//           bulletZombieContactGrid.removeAt(i);
//
//           /// remove the animation effect quickly
//           bulletZombieContactGrid.insert(
//               i, BulletContactCheckerColumns(potentialContactPosition: 21));
//           pointsForHittingPerCannonType();
//           notifyListeners();
//
//           /// 21 adds a blank columns
//         });
//       }
//     }
//   }
// }

// void gunShotZombieCollisionChecker2() {
//   for (var i = 0; i < 11; i++) {
//     if (buildings[i].buildingHeight >= 6) {
//       if (buildings[i].buildingHeight <= playerPosition + 2 &&
//           buildings[i].buildingHeight <= 12 &&
//           buildings[i].buildingHeight >= 1) {
//         /// then contact has been made
//         handleComboHitsMessageAndHoldTripleHit();
//         buildings[i].buildingHeight = buildings[i].buildingHeight + 1;
//         bulletZombieContactGrid.removeAt(i);
//         bulletZombieContactGrid.insert(
//             i,
//             BulletContactCheckerColumns(
//                 potentialContactPosition: playerPosition + 1));
//
//         /// add a animation when the gunshot hits a target
//         /// at the location of contact
//         notifyListeners();
//         Future.delayed(Duration(milliseconds: 400), () {
//           resetBulletContactCheckerColumns();
//           bulletZombieContactGrid.removeAt(i);
//
//           /// remove the animation effect quickly
//           bulletZombieContactGrid.insert(
//               i, BulletContactCheckerColumns(potentialContactPosition: 21));
//           pointsForHittingPerCannonType();
//
//           /// 21 adds a blank columns
//           notifyListeners();
//         });
//       }
//     }
//   }
// }

/// TODO check for pick ups again!
// void contactWithPowerUpChecker() {
//   int _gemLocationAtIndexZero = buildings[0].powerUpPosition;
//   if (playerPosition == _gemLocationAtIndexZero ||
//       playerPosition + 1 == _gemLocationAtIndexZero ||
//       playerPosition - 1 == _gemLocationAtIndexZero) {
//     // first condition is gun upgrade
//     if (_gemLocationAtIndexZero == 3 || _gemLocationAtIndexZero == 2) {
//       upgradeAmmo();
//       soundModel.cannonPickup(hearSoundEffects);
//       if (currentAmmunition == AmmoType.orange) {
//         currentAmmunition = AmmoType.blue;
//         cannonPath = 'yellowFireBall3.gif';
//         bulletPath20mm = '20mmGreen.png';
//         pathToFortyMMBullet = '40mmGreen3.png';
//         pathToColorChangingBullet = 'bulletCombo1.gif';
//         currentAmmoList = [];
//         currentAmmoList.add(Ammo(
//           path: _bullets_list[1].path,
//           height: 40.0,
//           width: 40.0,
//         ));
//         notifyListeners();
//       } else if (currentAmmunition == AmmoType.blue) {
//         currentAmmunition = AmmoType.yellow;
//         cannonPath = 'invertGreenFireBall.gif';
//         bulletPath20mm = '20mmBlue.png';
//         pathToFortyMMBullet = '40mmBlue.png';
//         pathToColorChangingBullet = 'bulletCombo2.gif';
//         currentAmmoList = [];
//         currentAmmoList.add(Ammo(
//           path: _bullets_list[2].path,
//           height: 40.0,
//           width: 40.0,
//         ));
//
//         notifyListeners();
//       } else if (currentAmmunition == AmmoType.yellow) {
//         currentAmmunition = AmmoType.purple;
//         cannonPath = 'fireBallXPurple.gif';
//         bulletPath20mm = '20mmPurpleBright.png';
//         pathToFortyMMBullet = '40mmPink.png';
//         pathToColorChangingBullet = 'bulletCombo3.gif';
//         currentAmmoList = [];
//         currentAmmoList.add(Ammo(
//           path: _bullets_list[3].path,
//           height: 40.0,
//           width: 40.0,
//         ));
//         notifyListeners();
//       } else if (currentAmmunition == AmmoType.purple) {
//         currentAmmunition = AmmoType.flashing;
//         cannonPath = 'fireBallXFlashing2.gif';
//         bulletPath20mm = '20mmRed.png';
//         pathToFortyMMBullet = '40mmRed.png';
//         pathToColorChangingBullet = 'bulletCombo4.gif';
//         currentAmmoList = [];
//         currentAmmoList.add(Ammo(
//           path: _bullets_list[4].path,
//           height: 40.0,
//           width: 40.0,
//         ));
//
//         notifyListeners();
//       } else if (currentAmmunition == AmmoType.flashing) {
//         currentAmmunition = AmmoType.white;
//         bulletPath20mm = '20mmBlack.png';
//         pathToFortyMMBullet = '40mmBlack.png';
//         pathToColorChangingBullet = 'bulletCombo5.gif';
//         currentAmmoList = [];
//         currentAmmoList.add(Ammo(
//           path: _bullets_list[5].path,
//           height: 40.0,
//           width: 40.0,
//         ));
//
//         notifyListeners();
//       } else if (currentAmmunition == AmmoType.white) {
//         currentAmmunition = AmmoType.black;
//         currentAmmoList = [];
//         currentAmmoList.add(Ammo(
//           path: _bullets_list[6].path,
//           height: 40.0,
//           width: 40.0,
//         ));
//         cannonPath = 'whiteFireBall.gif';
//         bulletPath20mm = '20mmWhite.png';
//         pathToFortyMMBullet = '40mmBlackWhite.png';
//         pathToColorChangingBullet = 'bulletCombo6.gif';
//
//         notifyListeners();
//       } else {
//         /// note: not changing unused_delete type or ammo type
//         /// why are those two different things?
//         pathToFortyMMBullet = '40mmCombo.gif';
//         pathToColorChangingBullet = 'bulletCombo7.gif';
//         displayDoublePointsEffect();
//         notifyListeners();
//         cannons.add(Ammo(
//           path: _bullets_list[7].path,
//           height: 40.0,
//           width: 40.0,
//         ));
//       }
//     }
//
//     /// extra life
//     else if (_gemLocationAtIndexZero == 9) {
//       updateZombiePath();
//       displayLifePickupEffect();
//       soundModel.lifePickup(hearSoundEffects);
//       soundModel.playOtherSounds5x('1-21-23Gingle8Bit.mp3', hearSoundEffects);
//       extraLives.add(
//         Container(
//           height: 40.0,
//           width: 40.0,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               fit: BoxFit.cover,
//               image: AssetImage('images/astronaut2.GIF'),
//             ),
//           ),
//         ),
//       );
//       displayDoublePointsEffect();
//       notifyListeners();
//     }
//
//     // 'blood' pickup
//     else if (_gemLocationAtIndexZero == 10) {
//       soundModel.bloodPickup(hearSoundEffects);
//       soundModel.playOtherSounds5x('1-21-23Gingle8Bit.mp3', hearSoundEffects);
//       displayBloodPickupEffect();
//       displayDoublePointsEffect();
//       redGems.add(kBlood);
//       notifyListeners();
//     }
//
//     /// user caught a bomb blow up obstacles instantly
//     else if (_gemLocationAtIndexZero == 1) {
//       displayDoublePointsEffect();
//       explodeBuildingsWithDisplayNotPowerUps();
//       soundModel.playOtherSounds5x('customExplosion.mp3', hearSoundEffects);
//       displayExplosionEffect2();
//     }
//     //  Grenade
//     else if (_gemLocationAtIndexZero == 8) {
//       soundModel.playOtherSounds('sizzlePop.mp3', hearSoundEffects);
//       soundModel.playOtherSeven('sciFiPowerupThree.mp3', hearSoundEffects);
//
//       nukeList.add(
//         SelectedGrenadeWidget(
//           onScreenPickupAndNotAGrenadeButton: false,
//         ),
//       );
//     }
//   }
// }

// void checkForPowerDowns() {
//   int _gemLocationAtIndexZero = buildings[0].powerUpPosition;
//
//   if (playerPosition - 1 == _gemLocationAtIndexZero ||
//       playerPosition == _gemLocationAtIndexZero) {
//     if (_gemLocationAtIndexZero == 4 || _gemLocationAtIndexZero == 7) {
//       soundModel.knifePickup(hearSoundEffects);
//
//       if (redGems.isEmpty && extraLives.isEmpty) {
//         soundModel.playOtherSounds('jumpScare.mp3', hearSoundEffects);
//         displayLifeLossWhenStabbedEffect();
//         print('user got stabbed and game over');
//         crashed = true;
//         pauseGame();
//         notifyListeners();
//       } else if (redGems.isNotEmpty) {
//         displayLifeLossWhenStabbedEffect();
//         redGems.removeAt(redGems.length - 1);
//         print('red gem stab protection - 1 red gem');
//         displayKnifeDefenseEffect();
//         notifyListeners();
//       } else if (extraLives.isNotEmpty) {
//         displayLifeLossWhenStabbedEffect();
//         extraLives.removeAt(extraLives.length - 1);
//         print(
//             'user got stabbed and had no red gems so lost a life but not a game over');
//         notifyListeners();
//       }
//     } else if (_gemLocationAtIndexZero == 5) {
//       toggleDistractingBackgroundImageDuringGamePlay();
//       soundModel.horsePickup(hearSoundEffects);
//     } else if (_gemLocationAtIndexZero == 6) {
//       fireCrystalBallTimeDecrease();
//       soundModel.crystalPickup(hearSoundEffects);
//     }
//   }
// }

// void gunShotZombieCollisionChecker1() {
//   for (var i = 0; i < 11; i++) {
//     if (buildings[i].buildingHeight <= 5) {
//       if (buildings[i].buildingHeight >= playerPosition &&
//           buildings[i].buildingHeight <= 12 &&
//           buildings[i].buildingHeight >= 1) {
//         /// then contact has been made
//         handleComboHitsMessageAndHoldTripleHit();
//
//         /// decrease the building height
//         buildings[i].buildingHeight = buildings[i].buildingHeight - 1;
//         bulletZombieContactGrid.removeAt(i);
//         bulletZombieContactGrid.insert(
//             i,
//             BulletContactCheckerColumns(
//                 potentialContactPosition: playerPosition));
//
//         /// add a animation when the gunshot hits a target
//         notifyListeners();
//         Future.delayed(Duration(milliseconds: 400), () {
//           resetBulletContactCheckerColumns();
//           bulletZombieContactGrid.removeAt(i);
//
//           /// remove the animation effect quickly
//           bulletZombieContactGrid.insert(
//               i, BulletContactCheckerColumns(potentialContactPosition: 21));
//           pointsForHittingPerCannonType();
//           notifyListeners();
//
//           /// 21 adds a blank columns
//         });
//       }
//     }
//   }
// }

// void gunShotZombieCollisionChecker2() {
//   for (var i = 0; i < 11; i++) {
//     if (buildings[i].buildingHeight >= 6) {
//       if (buildings[i].buildingHeight <= playerPosition + 2 &&
//           buildings[i].buildingHeight <= 12 &&
//           buildings[i].buildingHeight >= 1) {
//         /// then contact has been made
//         handleComboHitsMessageAndHoldTripleHit();
//         buildings[i].buildingHeight = buildings[i].buildingHeight + 1;
//         bulletZombieContactGrid.removeAt(i);
//         bulletZombieContactGrid.insert(
//             i,
//             BulletContactCheckerColumns(
//                 potentialContactPosition: playerPosition + 1));
//
//         /// add a animation when the gunshot hits a target
//         /// at the location of contact
//         notifyListeners();
//         Future.delayed(Duration(milliseconds: 400), () {
//           resetBulletContactCheckerColumns();
//           bulletZombieContactGrid.removeAt(i);
//
//           /// remove the animation effect quickly
//           bulletZombieContactGrid.insert(
//               i, BulletContactCheckerColumns(potentialContactPosition: 21));
//           pointsForHittingPerCannonType();
//
//           /// 21 adds a blank columns
//           notifyListeners();
//         });
//       }
//     }
//   }
// }

/// TODO HAND FALL AND COLLISION DETECTORS
// void handFall() {
//   /*
//
//     How many times is the function called?
//     What is the proper usage?
//     Is this called once, when the game is started?
//
//     This function appears to create a new timer
//     every time the hand falls, 200ms,
//     but it is never disposed,
//     and it's a timer.periodic
//
//      */
//   var timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
//     playerCollisionChecker(); // why are we calling game over here?
//     print(playerPosition);
//     if (crashed == false) {
//       if (isPaused == false) {
//         if (playerPosition >= 2) {
//           playerPosition--;
//           isClimbing = false;
//           notifyListeners();
//         }
//       }
//     } else {
//       timer.cancel();
//       print('canceling player fall timer?');
//     }
//   });
//   // notifyListeners();
// }

/// TODO make this work with the new buildings strategy
/// called during jump or fall
// void playerCollisionChecker() {
//   int obstacleHeight = buildings[0].buildingHeight;
//   if (userCannotDieRightNow == false) {
//     // bottom buildings
//     if (obstacleHeight <= 5) {
//       if (playerPosition <= obstacleHeight + 1) {
//         if (extraLives.isNotEmpty == true) {
//           print("height height ${buildings[0].buildingHeight}");
//           soundModel.playOtherSounds('femaleDeath.mp3', hearSoundEffects);
//           userCannotDieRightNow = true;
//           quickCantDieTime();
//           extraLives.removeAt(extraLives.length - 1);
//           displayBloodSplatEffect();
//           notifyListeners();
//         } else if (extraLives.isEmpty == true) {
//           print('should game game over sounds - crashed in bottom');
//           soundModel.gameOver(hearSoundEffects);
//           displayMonsterPickupEffect();
//           crashed = true;
//           showADeadHand = true;
//           notifyListeners();
//         }
//       }
//       // top buildings
//     } else if (obstacleHeight >= 6) {
//       print('obstance hight from top $obstacleHeight');
//       if (playerPosition >= obstacleHeight - 1) {
//         if (extraLives.isNotEmpty == true) {
//           soundModel.playOtherEight('femaleDeath.mp3', hearSoundEffects);
//           displayBloodSplatEffect();
//           userCannotDieRightNow = true;
//           quickCantDieTime();
//           extraLives.removeAt(extraLives.length - 1);
//           notifyListeners();
//         } else if (extraLives.isEmpty == true) {
//           displayMonsterPickupEffect();
//           crashed = true;
//           // isClimbing = true;
//           showADeadHand = true;
//           print('should game game over sounds - crashed in top');
//           soundModel.gameOver(hearSoundEffects);
//           notifyListeners();
//         }
//       }
//     }
//   }
// }

/// easter egg building explosion free life
// void explodeBuildingsWithDisplayNotPowerUps() {
//   for (int i = buildings.length - 1; i >= 0; i--) {
//     var eachBuildingsPowerUpPosition = buildings[i].powerUpPosition;
//
//     if (eachBuildingsPowerUpPosition == 7 ||
//         eachBuildingsPowerUpPosition == 4) {
//       // Remove & Replace with empty space (exploded effect)
//       _columnPositions.removeAt(i);
//       _columnPositions.insert(i, _columnPositions.last + 200);
//     }
//
//     if (eachBuildingsPowerUpPosition <= 0 ||
//         eachBuildingsPowerUpPosition > 10) {
//       // Remove obstacles and replace with fresh buildings
//       _columnPositions.removeAt(i);
//       _columnPositions.insert(i, _columnPositions.last + 200);
//     }
//   }
//
//   notifyListeners(); // Update UI
// }
/// and the original-er
// void explodeBuildingsWithDisplayNotPowerUps() {
//   for (var i = 0; i < 13; i++) {
//     var eachBuildingsPowerUpPosition = buildings[i].powerUpPosition;
//     if (eachBuildingsPowerUpPosition == 7 ||
//         eachBuildingsPowerUpPosition == 4) {
//       buildings.removeAt(i);
//
//       /*
//
//       Easter Egg
//       Explosions
//       Transform knives
//       Into extra lives.
//
//        */
//
//       buildings.insert(
//           i, GamePlayColumnsForGrid(buildingHeight: -5, powerUpPosition: 9));
//     }
//     if (eachBuildingsPowerUpPosition <= 0 ||
//         eachBuildingsPowerUpPosition > 10) {
//       buildings.removeAt(
//           i); // remove any building that does not have a power-up (cannot have) i.e. obstacles
//       buildings.insert(
//           i, GamePlayColumnsForGrid(buildingHeight: 20, powerUpPosition: 0));
//     }
//   }
// }
