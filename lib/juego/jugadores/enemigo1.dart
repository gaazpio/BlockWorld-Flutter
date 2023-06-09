import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/image_composition.dart';
import 'package:tfggzp/juego/juego.dart';
import 'package:tfggzp/juego/jugadores/jugadorMain.dart';

class enemigo1 extends SpriteComponent with CollisionCallbacks, HasGameRef<miJuego>{

  double xContador = 0;
  double dAnimDireccion = -1;
  double dVelocidadAnim = 1;
  enemigo1(Image image, {
    Vector2? position,
    Vector2? posicionMovi,
    Vector2? size,
    Vector2? scale,
    double? angle,
    Anchor? anchor,
    int? priority,

  }) : super.fromImage(
    image,
    srcPosition: Vector2(32,0),
    srcSize: Vector2.all(32),
    position: position,
    size: Vector2(22,22),
    scale: scale,
    angle: angle,
    anchor: anchor,
    priority: priority,
  ) {
  if(posicionMovi !=null){
    add(
      MoveToEffect(
        posicionMovi!,
        EffectController(
          alternate: true,
          infinite: true,
          speed: 100,
        ),
      ),
    );
  }
  }

  @override
  Future<void>? onLoad() {
    add(CircleHitbox()
      ..collisionType = CollisionType.passive);
  }

}