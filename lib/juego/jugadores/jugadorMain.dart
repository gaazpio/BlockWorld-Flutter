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


class jugadorMain extends SpriteComponent with CollisionCallbacks , KeyboardHandler, HasGameRef<miJuego>, TapCallbacks{

  final Vector2 velocidad= Vector2(0, 0);
  double velocidadHorizontal= 0;
  double moveSpeed= 150;
  double velocidadSalto =460;
  double saltoChetado=800;
  double gravedad = 10;
  final Vector2 sizeBlock= Vector2.all(30);

  int vecesUsadasSuperSalto=0;

  late Vector2 maxClamp;
  late Vector2 minClamp;

  bool estaEnElSuelo=false;
  bool estoySaltando = false;
  bool tipoSalto=false;


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
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    velocidadHorizontal = 0;

    if(keysPressed.contains(LogicalKeyboardKey.keyA) || keysPressed.contains(LogicalKeyboardKey.arrowLeft))  {
      velocidadHorizontal =- 1;
    }
    else if(keysPressed.contains(LogicalKeyboardKey.keyD) || keysPressed.contains(LogicalKeyboardKey.arrowRight)){
      velocidadHorizontal =1;
    }
    if(keysPressed.contains(LogicalKeyboardKey.space)){
      estoySaltando=true;
    }else if(keysPressed.contains(LogicalKeyboardKey.keyP)){
      if(vecesUsadasSuperSalto<2){
        estoySaltando=true;
        tipoSalto=true;
        vecesUsadasSuperSalto++;
      }

    }
    return true;
  }

  @override
  void onTapUp(TapUpEvent event) {
    estoySaltando=true;
    super.onTapUp(event);
  }

  @override
  Future<void>? onLoad() {
    add(CircleHitbox());
    // TODO: implement onLoad
   // return super.onLoad();
  }



/*  void joypadMoved(Direction direction){
    //print("JOYPAD EN MOVIMIENTO:   ---->  "+direction.toString());
    velocidadHorizontal=0;

    if(direction==Direction.left){
      velocidadHorizontal=-1;
    }
    else if(direction==Direction.right){
      velocidadHorizontal=1;
    }


  }*/

  @override
  void update(double dt) {
    // TODO: implement update
    velocidad.x = velocidadHorizontal * moveSpeed;
    velocidad.y += gravedad;

    if(estoySaltando){
      if(estaEnElSuelo){
        velocidad.y= -saltoChetado;
        estaEnElSuelo=false;
      }
      estoySaltando=false;
    }

    saltito();

    position += velocidad *dt;

    position.clamp(minClamp,maxClamp);
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
   if (other is Plataforma) {

     if(intersectionPoints.length ==2){

       final medio =( intersectionPoints.elementAt(0) + intersectionPoints.elementAt(1))/2;
       final collisionN = absoluteCenter-medio;
       final distacia= (size.x/2)- collisionN.length;

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


  void saltito() async{
    if(tipoSalto){
      velocidad.y= velocidad.y.clamp(-saltoChetado, 150);
      await Future.delayed(Duration(seconds: 1));
      tipoSalto=false;

    }else{
      velocidad.y= velocidad.y.clamp(-velocidadSalto, 150);
    }

  }



}