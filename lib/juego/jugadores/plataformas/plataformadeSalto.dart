import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/geometry.dart';
import 'package:tfggzp/juego/jugadores/jugadorMain.dart';

class PlataformaSalto extends PositionComponent with CollisionCallbacks, TapCallbacks{

  PlataformaSalto({
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
    priority: 5,
  );

  @override
  Future<void>? onLoad() {
    debugMode= true;
    add(RectangleHitbox()..collisionType = CollisionType.passive);
    //  return super.onLoad();
  }

  @override
  void onTapUp(TapUpEvent event) {
    //print("has pulsado en la pantalla");

    super.onTapUp(event);
  }
}