import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';
import 'package:tfggzp/juego/extra/audio_game.dart';
import 'package:tfggzp/juego/jugadores/enemigo1.dart';
import 'package:tfggzp/juego/jugadores/enemigo2.dart';
import 'package:tfggzp/juego/jugadores/pinchos.dart';
import 'package:tfggzp/juego/jugadores/plataformas/plataforma.dart';
import '../juego.dart';


class jugadorMain extends SpriteComponent with CollisionCallbacks , HasGameRef<miJuego>, TapCallbacks{

  final Vector2 velocidad= Vector2(0, 0);
  double velocidadHorizontal= 0;
  double moveSpeed= 800;
  double velocidadSalto =500;
  double gravedad = 10;
  final Vector2 sizeBlock= Vector2.all(30);

  late Vector2 maxClamp;
  late Vector2 minClamp;

  bool estaEnElSuelo=false;
  bool estoySaltando = false;


  jugadorMain(Image image, {
    required Rect limitesNivel,
    Vector2? position,
    Vector2? size,
    Vector2? scale,
    double? angle,
    Anchor? anchor,
    int? priority,

  }) : super.fromImage(
    image,
    srcPosition: Vector2.zero(),
    srcSize: Vector2.all(32),
    position: position,
    size: Vector2.all(30),
    scale: scale,
    angle: angle,
    anchor: anchor,
    priority: priority,
  )
  {
    minClamp= limitesNivel.topLeft.toVector2();
    maxClamp= limitesNivel.bottomRight.toVector2() -(size!);
}

  @override
  void onTapUp(TapUpEvent event) {
    estoySaltando=true;
    super.onTapUp(event);
  }

  @override
  Future<void>? onLoad()async {
    await add(CircleHitbox());
  }


  @override
  void update(double dt) {
    // TODO: implement update
    velocidad.y += gravedad;

    if(estoySaltando){
      if(estaEnElSuelo){
          velocidad.y= -velocidadSalto;
          estaEnElSuelo=false;
      }
      estoySaltando=false;
    }

    velocidad.y= velocidad.y.clamp(-velocidadSalto, 150);

    position += velocidad *dt;

    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
   if (other is Plataforma) {

     if(intersectionPoints.length ==2){

       final medio =( intersectionPoints.elementAt(0) + intersectionPoints.elementAt(1))/2;
       final collisionN = absoluteCenter-medio;
       final distacia= (size.x/2)- collisionN.length;
       collisionN.normalized();

       if(Vector2(0, -1).dot(collisionN)>0.9){
         estaEnElSuelo=true;
       }
       
       position+= collisionN.normalized().scaled(distacia);
     }
   }

    super.onCollision(intersectionPoints, other);
  }

@override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    if(other is enemigo1 || other is enemigo2 || other is pinchos){
      AudioGame.startSonidosPlayers("hit.m4a");
      hit();
      if(gameRef.blockLives>0){
        gameRef.blockLives--;
        gameRef.blockLivesExtra--;
      }

    }
    super.onCollisionStart(intersectionPoints, other);
  }


  void hit(){
    add(
        OpacityEffect.fadeOut(EffectController(
          alternate: true,
          duration: 0.2,
          repeatCount: 4,
        ))
    );
  }

}