import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flappy_taco/providers/game_status_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

import '../providers/game_status_provider.dart';

class SoundModel {
  // bool hearSoundEffects = false;

  // bool get hearSoundEffects => _hearSoundEffects;

  // void turnOnSoundEffects() {
  //   _hearSoundEffects = true;
  //   print('user requested sound on');
  //   print('hearSoundEffects = $_hearSoundEffects');
  // }
  //
  // void turnOffSoundEffects() {
  //   _hearSoundEffects = false;
  //   print('user requested sound off');
  //   print('hearSoundEffects = $_hearSoundEffects');
  // }

  void playReloadMaleVoice(bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final reloadVoicePlayer = AudioPlayer();
      await reloadVoicePlayer.setAsset('assets/reloadMaleVoice.mp3');
      await reloadVoicePlayer.play();
      await reloadVoicePlayer.stop();
      await reloadVoicePlayer.dispose();
    }
  }

  final spookyMusicPlayer = AudioPlayer();

  void killSpookyMusic() async {
    await spookyMusicPlayer.play();
    await spookyMusicPlayer.stop();

    // await spookyMusicPlayer.dispose();
  }

  void playSpookyMusic(bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      await spookyMusicPlayer.setLoopMode(LoopMode.one);
      await spookyMusicPlayer.setVolume(2.0);

      await spookyMusicPlayer.setAsset(
          // 'assets/spookyMusic.mp3',
          // 'assets/wednesdaySoundingTrack.mp3'
          'assets/harryPotterSoundingTrack.mp3'
          // 'assets/flapFlapFlapBenReich.wav',
          );
      await spookyMusicPlayer.play();
      await spookyMusicPlayer.stop();

      await spookyMusicPlayer.dispose();
    }
  }

  final loopSizzleSoundPlayer = AudioPlayer();

  void killLoopSizzleSound() async {
    loopSizzleSoundPlayer.play();

    loopSizzleSoundPlayer.stop();
  }

  void playLoopSizzleSound(bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      await loopSizzleSoundPlayer.setLoopMode(LoopMode.one);
      await loopSizzleSoundPlayer.setAsset(
        'assets/sizzleFire.mp3',
      );
      await loopSizzleSoundPlayer.play();
      await loopSizzleSoundPlayer.stop();

      await loopSizzleSoundPlayer.dispose();
    }
  }

  // void playCreapyWingsSound(bool hearSoundEffects) async {
  //   if (hearSoundEffects == true) {
  //     final musicPlayer = AudioPlayer();
  //     await musicPlayer.setLoopMode(LoopMode.one);
  //     await musicPlayer.setAsset('assets/wingsNewOne.mp3');
  //     await musicPlayer.play();
  //     await musicPlayer.stop();
  //     // Clear the asset cache directory
  //     // await AudioPlayer.clearAssetCache();
  //     // Stop an
  //     // d free resources
  //     await musicPlayer.dispose();
  //   }
  // }

  final loopElectricChairPlayer = AudioPlayer();

  void killLoopElectricChair() async {
    loopElectricChairPlayer.play();
    loopElectricChairPlayer.stop();
  }

  void playLoopElectricChair(bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      await loopElectricChairPlayer.setLoopMode(LoopMode.one);
      await loopElectricChairPlayer.setVolume(.2);

      await loopElectricChairPlayer.setAsset(
        'assets/electricChair.mp3',
        // 'assets/flapFlapFlapBenReich.wav',
      );
      await loopElectricChairPlayer.play();
      await loopElectricChairPlayer.stop();

      await loopElectricChairPlayer.dispose();
    }
  }

  final loopFireworksSoundsPlayer = AudioPlayer();

  void killLoopFireworksSoundsPlayer() async {
    loopFireworksSoundsPlayer.play();
    loopFireworksSoundsPlayer.stop();
  }

  void playLoopFireworksSounds(bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      await loopFireworksSoundsPlayer.setLoopMode(LoopMode.one);
      await loopFireworksSoundsPlayer.setAsset('assets/fireworks.mp3');
      await loopFireworksSoundsPlayer.play();
      await loopFireworksSoundsPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await loopFireworksSoundsPlayer.dispose();
    }
  }
  //
  // void playScreechSound(bool hearSoundEffects) async {
  //   if (hearSoundEffects == true) {
  //     final musicPlayer = AudioPlayer();
  //     await musicPlayer.setLoopMode(LoopMode.one);
  //     await musicPlayer.setAsset('assets/sciFiEngine.mp3');
  //     await musicPlayer.play();
  //     await musicPlayer.stop();
  //     // Clear the asset cache directory
  //     // await AudioPlayer.clearAssetCache();
  //     // Stop an
  //     // d free resources
  //     await musicPlayer.dispose();
  //   }
  // }

  void playLoopWhistle(bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final musicPlayer = AudioPlayer();
      await musicPlayer.setLoopMode(LoopMode.one);
      await musicPlayer.setAsset('assets/whistle.mp3');
      await musicPlayer.play();
      await musicPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await musicPlayer.dispose();
    }
  }

  // void playLoopFootSteps(bool hearSoundEffects) async {
  //   if (hearSoundEffects == true) {
  //     final musicPlayer = AudioPlayer();
  //     await musicPlayer.setVolume(3.0);
  //     await musicPlayer.setLoopMode(LoopMode.one);
  //     await musicPlayer.setAsset('assets/footStepsTwo.mp3');
  //     await musicPlayer.play();
  //     await musicPlayer.stop();
  //     // Clear the asset cache directory
  //     // await AudioPlayer.clearAssetCache();
  //     // Stop an
  //     // d free resources
  //     await musicPlayer.dispose();
  //   }
  // }

  // void playLoopedSounds(String soundPath) async {
  //   final musicPlayer = AudioPlayer();
  //   await musicPlayer.setVolume(5.0);
  //   await musicPlayer.setLoopMode(LoopMode.one);
  //   await musicPlayer.setAsset('footStepsTwo.mp3');
  //   await musicPlayer.play();
  //   await musicPlayer.stop();
  //   // Clear the asset cache directory
  //   // await AudioPlayer.clearAssetCache();
  //   // Stop an
  //   // d free resources
  //   await musicPlayer.dispose();
  //
  //
  // }

  void playComedySounds(String soundPath, bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final audioPlayer = AudioPlayer();
      await audioPlayer.setVolume(3.0);

      await audioPlayer.setAsset('assets/$soundPath');
      await audioPlayer.play();
      await audioPlayer.stop();

      await audioPlayer.dispose();
    }
  }

  void playOtherSounds(String soundPath, bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final audioPlayer = AudioPlayer();
      await audioPlayer.setAsset('assets/$soundPath');
      await audioPlayer.play();
      await audioPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await audioPlayer.dispose();
    }
  }

  void playOtherThree(String soundPath, bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final audioPlayer = AudioPlayer();
      await audioPlayer.setAsset('assets/$soundPath');
      await audioPlayer.play();
      await audioPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await audioPlayer.dispose();
    }
  }

  void playOtherFour(String soundPath, bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final audioPlayer = AudioPlayer();
      await audioPlayer.setAsset('assets/$soundPath');
      await audioPlayer.play();
      await audioPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await audioPlayer.dispose();
    }
  }

  /// new sound playing functions

  void playOtherFive(String soundPath, bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final audioPlayer = AudioPlayer();
      await audioPlayer.setAsset('assets/$soundPath');
      await audioPlayer.play();
      await audioPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await audioPlayer.dispose();
    }
  }

  void playOtherSix(String soundPath, bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final audioPlayer = AudioPlayer();
      await audioPlayer.setAsset('assets/$soundPath');
      await audioPlayer.play();
      await audioPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await audioPlayer.dispose();
    }
  }

  void playOtherSeven(String soundPath, bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final audioPlayer = AudioPlayer();
      await audioPlayer.setAsset('assets/$soundPath');
      await audioPlayer.play();
      await audioPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await audioPlayer.dispose();
    }
  }

  void playOtherEight(String soundPath, bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final audioPlayer = AudioPlayer();
      await audioPlayer.setAsset('assets/$soundPath');
      await audioPlayer.play();
      await audioPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await audioPlayer.dispose();
    }
  }

  void playOtherNine(String soundPath, bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final audioPlayer = AudioPlayer();
      await audioPlayer.setAsset('assets/$soundPath');
      await audioPlayer.play();
      await audioPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await audioPlayer.dispose();
    }
  }

  void playOtherTen(String soundPath, bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final audioPlayer = AudioPlayer();
      await audioPlayer.setAsset('assets/$soundPath');
      await audioPlayer.play();
      await audioPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await audioPlayer.dispose();
    }
  }

  /// that's where the new sound players end

  void playOtherSoundsTwo(String soundPath, bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final audioPlayer = AudioPlayer();
      await audioPlayer.setAsset('assets/$soundPath');
      await audioPlayer.play();
      await audioPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await audioPlayer.dispose();
    }
  }

  void playOtherSounds5x(String soundPath, bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final audioPlayer = AudioPlayer();
      await audioPlayer.setVolume(5.0);
      await audioPlayer.setAsset('assets/$soundPath');
      await audioPlayer.play();
      await audioPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await audioPlayer.dispose();
    }
  }

  void playWarningAlarm(bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final audioPlayer = AudioPlayer();
      await audioPlayer.setVolume(2.0);
      // await audioPlayer.setLoopMode(LoopMode.one);

      await audioPlayer.setAsset(
        // 'assets/cannonUpgrade.mp3',
        'assets/flapFlapFlapFlappyHand.mp3',
        // 'assets/1-21-23Warning.mp3',
      );
      await audioPlayer.play();
      await audioPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await audioPlayer.dispose();
    }
  }

  void playFlapFlapFlap(bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final audioPlayer = AudioPlayer();
      await audioPlayer.setVolume(2.0);
      // await audioPlayer.setLoopMode(LoopMode.one);

      await audioPlayer.setAsset(
        // 'assets/cannonUpgrade.mp3',
        // 'assets/flapFlapFlapFlappyHand.mp3',
        'assets/1-21-23Warning.mp3',
      );
      await audioPlayer.play();
      await audioPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await audioPlayer.dispose();
    }
  }

  void playFallingSound(String soundPath, bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final fallingSoundPlayer = AudioPlayer();
      await fallingSoundPlayer.setAsset('assets/$soundPath');
      await fallingSoundPlayer.play();
      await fallingSoundPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await fallingSoundPlayer.dispose();
    }
  }

  // void disposeMusicSoundPawait player.stop();
  // Stop an
  // d free resourceslayer() async {
  //   musicPlayer.dispose();
  // }

  /// reload sound

  void playReloadSound(bool hearSoundEffects) async {
    print('code prior to if statement');
    print('sound effects = $hearSoundEffects');

    if (hearSoundEffects == true) {
      print('requesting reload sound to play');

      final reloadPlayer = AudioPlayer();

      await reloadPlayer.setAsset('assets/laserReload.mp3');
      await reloadPlayer.play();
      await reloadPlayer.stop();

      await reloadPlayer.dispose();
    }
  }
  //
  // void disposeReloadSoundPawait player.stop();
  // Stop an
  // d free resourceslayer() async {
  //   reloadPlayer.dispose();
  // }

  // laser shot player

  void playLaserSound(bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final laserShotPlayer = AudioPlayer();
      await laserShotPlayer.setAsset('assets/laserUpgrade.mp3');
      await laserShotPlayer.play();
      await laserShotPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await laserShotPlayer.dispose();
    }
  }

  // void disposeLaserSoundPlayeawait player.stop();
  // Stop an
  // d free resourcesr() async {
  //   laserShotPlayer.dispose();
  // }

  void playTapSound(bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final tapSoundPlayer = AudioPlayer();

      await tapSoundPlayer.setVolume(5.0);

      await tapSoundPlayer.setAsset('assets/tap.mp3');
      await tapSoundPlayer.play();
      await tapSoundPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await tapSoundPlayer.dispose();
    }
  }

  // void disposeTapSoundPlayerawait player.stop();
  // Stop an
  // d free resources() async {
  //   tapSoundPlayer.dispose();
  // }

  void playCreatureSound(bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final creatureSoundPlayer = AudioPlayer();

      await creatureSoundPlayer.setAsset('assets/creature.mp3');
      await creatureSoundPlayer.play();
      await creatureSoundPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await creatureSoundPlayer.dispose();
    }
  }

  // void disposeCreatureSoundPlayerawait player.stop();
  // Stop an
  // d free resources() async {
  //   creatureSoundPlayer.dispose();
  // }

  void playCannonUpgradeSound(bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final cannonUpgradeSoundPlayer = AudioPlayer();

      await cannonUpgradeSoundPlayer.setAsset('assets/cannonUpgrade.mp3');
      await cannonUpgradeSoundPlayer.play();
      await cannonUpgradeSoundPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await cannonUpgradeSoundPlayer.dispose();
    }
  }

  // void disposeCannonUpgradeSoundPlayerawait player.stop();
  // Stop an
  // d free resources() async {
  //   cannonUpgradeSoundPlayer.dispose();
  // }

  void playDoubleKillSound(bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final doubleKillSoundPlayer = AudioPlayer();

      await doubleKillSoundPlayer.setAsset('assets/doubleKill.mp3');
      await doubleKillSoundPlayer.play();
      await doubleKillSoundPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await doubleKillSoundPlayer.dispose();
    }
  }
  //
  // void disposeDoubleKillSoundPlayerawait player.stop();
  // Stop an
  // d free resources() async {
  //   doubleKillSoundPlayer.dispose();
  // }

  void playTripleKillSound(bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final tripleKillSoundPlayer = AudioPlayer();

      await tripleKillSoundPlayer.setAsset('assets/tipleKill.mp3');
      await tripleKillSoundPlayer.play();
      await tripleKillSoundPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await tripleKillSoundPlayer.dispose();
    }
  }

  // void disposeTripleKillSoundPlayerawait player.stop();
  // Stop an
  // d free resources() async {
  //   tripleKillSoundPlayer.dispose();
  // }

  void playRampageSound(bool hearSoundEffects) async {
    if (hearSoundEffects == true) {
      final rampageSoundPlayer = AudioPlayer();

      await rampageSoundPlayer.setAsset('assets/rampage.mp3');
      await rampageSoundPlayer.play();
      await rampageSoundPlayer.stop();
      // Clear the asset cache directory
      // await AudioPlayer.clearAssetCache();
      // Stop an
      // d free resources
      await rampageSoundPlayer.dispose();
    }
  }

  // void disposeRampageSoundPlayerawait player.stop();
// Stop an
// d free resources() async {
  //   rampageSoundPlayer.dispose();
  // }
}
