import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/input.dart';
import 'package:tfggzp/juego/jugadores/jugadorMain.dart';
import 'extra/audio_game.dart';


class miJuego extends FlameGame with HasCollisionDetection, HasKeyboardHandlerComponents {
  int blockLives = 3;
  int monedasCogidas = 0;
   late final jugadorMain block;

  // Niveles? nivelActual;
  late Image imagenPersonajes;
  final fixedResolution = Vector2(630, 320);

  @override
  Future<void>? onLoad() async {
    await Flame.device.fullScreen();
    await Flame.device.setLandscape();
    await AudioGame.init();
    imagenPersonajes = await images.load("Spritesheet.png");

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (blockLives == 0) {
      overlays.add("/GameOver");
      pauseEngine();
      AudioGame.pararSonidoFondo();
    }
    super.update(dt);
  }

  void reiniciarTodo() {
    blockLives = 3;
    monedasCogidas = 0;
  }

}
