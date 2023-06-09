import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:tfggzp/juego/niveles/niveles.dart';


class PlataformaSaltoNormal extends PositionComponent with CollisionCallbacks, TapCallbacks, ParentIsA<Niveles>{


  PlataformaSaltoNormal({
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
    priority: 50,
  );

  @override
  Future<void>? onLoad() {
  }

  @override
  void onTapUp(TapUpEvent event) {
    parent.block.estoySaltando=true;
    super.onTapUp(event);
  }
}