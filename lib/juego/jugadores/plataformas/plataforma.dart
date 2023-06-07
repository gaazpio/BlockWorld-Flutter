import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/geometry.dart';
import 'package:tfggzp/juego/juego.dart';
import 'package:tfggzp/juego/niveles/niveles.dart';

class Plataforma extends PositionComponent with CollisionCallbacks, TapCallbacks{

  Plataforma({
    required Vector2? position,
    required Vector2? size,
    Vector2? scale,
    double? angle,
    Anchor? anchor,
    int? priority,

  }):super(
    position: position,
    size: size,
    scale: scale,
    angle: angle,
    anchor: anchor,
    priority: priority,
  );
 
  @override
  Future<void>? onLoad() {
    //debugMode= true;
    add(RectangleHitbox()..collisionType = CollisionType.passive);
  //  return super.onLoad();
  }

  @override
  void onTapUp(TapUpEvent event) {
    //parent.block.estoySaltando=true;
    print("estoy saltando");
    super.onTapUp(event);
  }
}