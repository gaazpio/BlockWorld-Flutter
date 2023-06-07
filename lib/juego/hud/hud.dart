import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:tfggzp/juego/extra/audio_game.dart';

import '../juego.dart';

class Hud extends PositionComponent with HasGameRef<miJuego> {
  Hud({super.children, super.priority}) {
    // positionType = PositionType.viewport;
  }

  late TextComponent points;
  late TextComponent blockLives;

  @override
  Future<void>? onLoad() async {
    points = TextComponent(
      text: '${gameRef.monedasCogidas}',
      position: Vector2(61, 8),
      anchor: Anchor.topLeft,
      scale: Vector2.all(1.5),
    );
    add(points);

    final coinsHead = SpriteComponent.fromImage(
      gameRef.imagenPersonajes,
      srcPosition: Vector2(32 * 3, 0),
      anchor: Anchor.topLeft,
      srcSize: Vector2.all(32),
      position: Vector2(15, 9),
      scale: Vector2.all(1.2),
    );
    await add(coinsHead);

    final pauseButton = SpriteButtonComponent(
      onPressed: () {
        gameRef.overlays.add("/MenuPause");
        gameRef.pauseEngine();
        AudioGame.pausarSonidoFondo();
      },
      button: Sprite(
        gameRef.imagenPersonajes,
        srcSize: Vector2.all(32),
        srcPosition: Vector2(32 * 9, 0),
      ),
      size: Vector2.all(32),
      anchor: Anchor.topCenter,
      position: Vector2(game.size.x / 2, 15),
      scale: Vector2.all(1.5),
    );
    await add(pauseButton);

    blockLives = TextComponent(
      text: '${gameRef.blockLives}',
      anchor: Anchor.topRight,
      position: Vector2(gameRef.size.x - 80, 10),
      scale: Vector2.all(1.5),
    );
    await add(blockLives);

    final blockHead = SpriteComponent.fromImage(
      gameRef.imagenPersonajes,
      srcPosition: Vector2(0, 0),
      anchor: Anchor.topRight,
      srcSize: Vector2.all(32),
      position: Vector2(blockLives.position.x - blockLives.size.x - 20, 10),
      scale: Vector2.all(1.2),
    );
    await add(blockHead);

    // return super.onLoad();
  }

  @override
  void update(double dt) {
    points.text = '${gameRef.monedasCogidas}';
    blockLives.text = '${gameRef.blockLives}';

    super.update(dt);
  }
}
