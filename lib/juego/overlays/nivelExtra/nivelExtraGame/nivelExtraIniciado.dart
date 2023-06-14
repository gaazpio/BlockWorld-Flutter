import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:tfggzp/juego/juego.dart';
import '../../../extra/audio_game.dart';
import '../../../hud/hud.dart';
import 'nivelesGameExtra.dart';

class nivelExtraIniciado extends World with HasGameRef<miJuego> {

  NivelesExtraGame? nivelActual;
  final hud = HudGameExtra(priority: 1);
  late CameraComponent camera;

  final knobPaint = BasicPalette.black.withAlpha(200).paint();
  final backgroundPaint = BasicPalette.black.withAlpha(100).paint();
  late final JoystickComponent joystick;

  @override
  Future<void> onLoad() async {
    // TODO: implement onLoad
    AudioGame.startBGM("muiscaNivelExtra.m4a");

    cargarNivel('nivelExtra.tmx');

    camera = CameraComponent.withFixedResolution(
      world: this,
      width: gameRef.fixedResolution.x,
      height: gameRef.fixedResolution.y,
      hudComponents: [hud],
    );
    camera.viewfinder.position = gameRef.fixedResolution / 2;
    gameRef.add(camera);


    joystick = JoystickComponent(
      knob: CircleComponent(radius: 35, paint: knobPaint),
      background: CircleComponent(radius: 45, paint: backgroundPaint),
      margin: const EdgeInsets.only(right: 50, bottom: 30),
    );
    gameRef.add(joystick);


  }

  void cargarNivel(String nivel) {
    nivelActual?.removeFromParent();
    nivelActual = NivelesExtraGame(nivel);
    add(nivelActual!);
  }
  @override
  void update(double dt) {

   if (gameRef.blockLivesExtra == 0) {
      gameRef.overlays.add("/GameOverExtra");
      gameRef.pauseEngine();
      AudioGame.pararSonidoFondo();
    }
    super.update(dt);
  }

}


