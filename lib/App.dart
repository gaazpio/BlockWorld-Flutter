import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tfggzp/juego/juego_iniado.dart';
import 'package:tfggzp/juego/overlays/gameOver.dart';
import 'package:tfggzp/juego/overlays/nivelExtra/nivelExtraLogin.dart';
import 'package:tfggzp/juego/overlays/pause_menu.dart';
import 'juego/juego.dart';
import 'juego/overlays/information.dart';
import 'juego/overlays/menu-principal.dart';
import 'juego/overlays/nivelExtra/GameWin.dart';
import 'juego/overlays/nivelExtra/nivelExtraRegister.dart';
import 'juego/overlays/settins.dart';

class App extends StatelessWidget {
  final game = miJuego();
  final game2= juegoIniciado();
 // final niveles = Niveles("nivel");

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: GameWidget<miJuego>(
        game: game,
        overlayBuilderMap: {
          '/GameWin': (_, game) => GameWin(game: game),
          '/GameOver': (_, game) => Gameover(game: game),
          '/MenuPrinci': (_, game) => MenuPrinci(gameRef: game),
          '/Settings': (_, game) => settings(gameRef: game),
          '/Informacion': (_, game) => information(gameRef: game),
          '/NivelExtra': (_, game) => nivelExtraLogin(gameRef: game),
          '/NivelExtraRegister': (_, game) => nivelExtraRegister(gameRef: game),
          '/MenuPause': (_, game) => pause_menu(gameRef: game),
          '/GameOverExtra': (_, game) => GameoverExtra(game: game),
        },
        initialActiveOverlays: ['/MenuPrinci'],
      ),
    );
  }
}
