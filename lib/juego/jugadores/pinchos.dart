import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/image_composition.dart';
import 'package:tfggzp/juego/jugadores/jugadorMain.dart';
import '../juego.dart';



class pinchos extends SpriteComponent with CollisionCallbacks,HasGameRef<miJuego>{


  pinchos(Image image, {
    Vector2? position,
    Vector2? size,
    Vector2? scale,
    double? angle,
    Anchor? anchor,
    int? priority,

  }) : super.fromImage(
    image,
    srcPosition: Vector2(224,0),
    srcSize: Vector2.all(32),
    position: position,
    size: Vector2.all(32),
    scale: scale,
    angle: angle,
    anchor: anchor,
    priority: 5,
  );


  @override
  Future<void>? onLoad() {
    add(CircleHitbox()..collisionType=CollisionType.passive);
  }



}