import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';

class AudioGame {
  static final sonidosPlayers = ValueNotifier(true);
  static final sonidoFondo = ValueNotifier(true);

  bool musicaParada=false;

  static Future<void> init() async {
    FlameAudio.bgm.initialize();
    await FlameAudio.audioCache.loadAll([
      "bgm.m4a",
      "hit.m4a",
      "door.m4a",
      "salto.m4a",
      "coin.m4a",
    ]);
  }

  static void startSonidosPlayers(String music) {
    if (sonidosPlayers.value) {
      FlameAudio.play(music);
    }
  }

  static void startBGM(String music) {
    if (sonidoFondo.value) {
      FlameAudio.bgm.play(music);
    }
  }

  static void pausarSonidoFondo() {
    FlameAudio.bgm.pause();
  }

  static void reanudarSonidoFondo() {
    if (sonidoFondo.value) {
      FlameAudio.bgm.resume();

    }
  }

  static void pararSonidoFondo() {
    FlameAudio.bgm.stop();
  }
}
