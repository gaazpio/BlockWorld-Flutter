import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/geometry.dart';
import 'package:tfggzp/juego/juego.dart';
import 'package:tfggzp/juego/juego_iniado.dart';
import 'package:tfggzp/juego/jugadores/jugadorMain.dart';
import 'package:tfggzp/juego/overlays/nivelExtra/nivelExtraGame/nivelExtraIniciado.dart';

import '../../overlays/nivelExtra/nivelExtraGame/nivelesGameExtra.dart';

class PlataformaSalto extends PositionComponent with CollisionCallbacks, TapCallbacks, ParentIsA<NivelesExtraGame>{


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
    add(RectangleHitbox()..collisionType = CollisionType.passive);
    //  return super.onLoad();
  }

  @override
  void onTapUp(TapUpEvent event) {
    parent.block.estoySaltando=true;
    super.onTapUp(event);
  }
}