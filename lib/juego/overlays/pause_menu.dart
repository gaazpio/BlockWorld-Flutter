import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:tfggzp/juego/extra/audio_game.dart';

import '../juego.dart';

class pause_menu extends StatelessWidget {
  final miJuego gameRef;

  const pause_menu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 350,
            height: 75,
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(59, 38, 22, 1),
                    ),
                    onPressed: () {
                      gameRef.overlays.remove("/MenuPause");
                      gameRef.resumeEngine();
                        AudioGame.reanudarSonidoFondo();


                    },
                    child: const Text("Reanudar",style: TextStyle(fontSize: 20),))),
          ),

          SizedBox(
            width: 350,
            height: 75,
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(59, 38, 22, 1),
                    ),
                    onPressed: () {
                      gameRef.overlays.remove("/MenuPause");
                      gameRef.resumeEngine();
                      gameRef.removeAll(gameRef.children);
                      gameRef.reiniciarTodo();
                      AudioGame.pararSonidoFondo();
                      gameRef.overlays.add("/MenuPrinci");
                    },
                    child: const Text("Salir",style: TextStyle(fontSize: 20),))),
          ),
        ],
      )),backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
    );
  }
}
