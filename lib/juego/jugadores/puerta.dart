import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/image_composition.dart';
import 'package:tfggzp/juego/extra/audio_game.dart';
import 'package:tfggzp/juego/jugadores/jugadorMain.dart';

class puerta extends SpriteComponent with CollisionCallbacks{
  Function? puertaAbierta;

  puerta(Image image, {
    this.puertaAbierta,
    Vector2? position,
    Vector2? size,
    Vector2? scale,
    double? angle,
    Anchor? anchor,
    int? priority,

  }) : super.fromImage(
    image,
    srcPosition: Vector2(64,0),
    srcSize: Vector2.all(32),
    position: position,
    size: Vector2(30,31),
    scale: scale,
    angle: angle,
    anchor: anchor,
    priority: priority,
  );
  @override
  Future<void>? onLoad() {
    // TODO: implement onLoad
    add(RectangleHitbox()..collisionType=CollisionType.passive);
    //return super.onLoad();
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);

    if(other is jugadorMain){
      AudioGame.startSonidosPlayers("door.m4a");
      puertaAbierta?.call();
    }
  }
}
