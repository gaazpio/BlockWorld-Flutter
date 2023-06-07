import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/image_composition.dart';
import 'package:tfggzp/juego/juego.dart';

import 'jugadorMain.dart';

class enemigo2 extends SpriteComponent with HasGameRef<miJuego>, CollisionCallbacks {

  enemigo2(Image image, {
    Vector2? position,
    Vector2? posicionMovi,
    Vector2? size,
    Vector2? scale,
    double? angle,
    Anchor? anchor,
    int? priority,

  }) : super.fromImage(
    image,
    srcPosition:Vector2(128,0),
    srcSize: Vector2.all(32),
    position: position,
    size: Vector2(25,25),
    scale: scale,
    angle: angle,
    anchor: anchor,
    priority: priority,
  ){
    if(posicionMovi !=null){
      add(
        MoveToEffect(
          posicionMovi!,
          EffectController(
            alternate: true,
            infinite: true,
            speed: 150,
          ),
        ),
      );
    }
  }

  @override
  Future<void>? onLoad() {
    add(CircleHitbox()
      ..collisionType = CollisionType.passive);
   // return super.onLoad();
  }

}