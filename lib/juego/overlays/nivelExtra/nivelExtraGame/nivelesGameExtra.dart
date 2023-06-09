import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:tfggzp/juego/juego_iniado.dart';
import 'package:tfggzp/juego/jugadores/pinchos.dart';
import 'package:tfggzp/juego/overlays/nivelExtra/nivelExtraGame/nivelExtraIniciado.dart';
import 'package:tiled/tiled.dart';
import 'package:flame/image_composition.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:tfggzp/juego/jugadores/plataformas/plataforma.dart';
import '../../../juego.dart';
import '../../../jugadores/coinFinal.dart';
import '../../../jugadores/jugadorMain.dart';
import '../../../jugadores/plataformas/plataformadeSalto.dart';

class NivelesExtraGame extends Component
    with HasGameRef<miJuego>, ParentIsA<nivelExtraIniciado> {
  final String nivel;
  late jugadorMain block;
  late Rect limitesNivel;
  bool iniciarGame = false;
  late TiledComponent level;

  NivelesExtraGame(this.nivel) : super();

  @override
  Future<void>? onLoad() async {
    level = await TiledComponent.load(nivel, Vector2(32, 32));
    await add(level);
    limitesNivel = Rect.fromLTWH(
        0,
        0,
        (level.tileMap.map.width * level.tileMap.map.tileWidth).toDouble(),
        (level.tileMap.map.height * level.tileMap.map.tileHeight).toDouble());

    iniciarObjetos(level.tileMap);
    _setupCamera(level);

    return super.onLoad();
  }

  void iniciarObjetos(RenderableTiledMap nivel) {
    final plataformaBordes = nivel.getLayer<ObjectGroup>('Plataforma');
    for (final plataformaB in plataformaBordes!.objects) {
      final plataforma = Plataforma(
          position: Vector2(plataformaB.x, plataformaB.y),
          size: Vector2(plataformaB.width, plataformaB.height));
      add(plataforma);
    }

    final plataformaParaSaltar =
        nivel.getLayer<ObjectGroup>('PlataformaDeSalto');
    for (final plataformaSalto in plataformaParaSaltar!.objects) {
      final plataformaS = PlataformaSalto(
        position: Vector2(plataformaSalto.x, plataformaSalto.y),
        size: Vector2(plataformaSalto.width, plataformaSalto.height),
      );
      add(plataformaS);
    }

    final objetos = nivel.getLayer<ObjectGroup>('Objetos');
    for (final objetosMarcados in objetos!.objects) {
      final posicion = Vector2(
          objetosMarcados.x, objetosMarcados.y - objetosMarcados.height);
      final anchura = Vector2(objetosMarcados.width, objetosMarcados.height);
      switch (objetosMarcados.type) {
        case 'player':
          block = jugadorMain(
            gameRef.imagenPersonajes,
            position: posicion,
            size: anchura,
            limitesNivel: limitesNivel,
          );
          add(block);
          break;

        case 'pinchos':
          final pinchitos = pinchos(
            gameRef.imagenPersonajes,
            position: posicion,
            size: anchura,
          );
          add(pinchitos);
          break;

        case 'monedaWin':
          final moneda = CoinFinal(
            gameRef.imagenPersonajes,
            position: posicion,
            size: anchura,
          );
          add(moneda);
          break;
      }
    }
  }

  void _setupCamera(TiledComponent level) {
    parent.camera.follow(block);
    parent.camera.setBounds(
      Rectangle.fromLTRB(
        gameRef.fixedResolution.x / 2,
        gameRef.fixedResolution.y / 2,
        level.width - game.fixedResolution.x / 2,
        level.height - game.fixedResolution.y / 2,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    block.position.add(parent.joystick.relativeDelta.xy * 130 * dt);
  }
}
