import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/image_composition.dart';
import 'package:tfggzp/juego/extra/audio_game.dart';
import 'package:tfggzp/juego/jugadores/jugadorMain.dart';

import '../juego.dart';

class CoinFinal extends SpriteComponent with CollisionCallbacks,HasGameRef<miJuego>{


  CoinFinal(Image image, {
    Vector2? position,
    Vector2? size,
    Vector2? scale,
    double? angle,
    Anchor? anchor,
    int? priority,

  }) : super.fromImage(
    image,
    srcPosition: Vector2(32*10,0),
    srcSize: Vector2.all(32),
    position: position,
    size: Vector2.all(64),
    scale: scale,
    angle: angle,
    anchor: anchor,
    priority: priority,
  );


  @override
  Future<void>? onLoad() {
    add(CircleHitbox()..collisionType= CollisionType.passive);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    if(other is jugadorMain){
      gameRef.monedasFinales++;
      add(RemoveEffect());
      print(gameRef.monedasFinales.toString());

    }
    super.onCollision(intersectionPoints, other);
  }

}