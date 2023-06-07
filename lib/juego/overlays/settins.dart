import 'package:flutter/material.dart';
import 'package:tfggzp/juego/extra/audio_game.dart';

import '../juego.dart';

class settings extends StatelessWidget {
  final miJuego gameRef;

  const settings({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 350,
              child: ValueListenableBuilder<bool>(
                valueListenable: AudioGame.sonidoFondo,
                builder: (context, sonidoFondo, child) => SwitchListTile(
                  title: const Text("Musica de fondo",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  value: sonidoFondo,
                  activeColor: Color.fromRGBO(81, 118, 72, 1),
                  onChanged: (value) => AudioGame.sonidoFondo.value = value,
                ),
              )),
          SizedBox(
              width: 350,
              child: ValueListenableBuilder<bool>(
                valueListenable: AudioGame.sonidosPlayers,
                builder: (context, sonidosPlayers, child) => SwitchListTile(
                  title: const Text("Efectos de sonido",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  activeColor: Color.fromRGBO(81, 118, 72, 1),
                  value: sonidosPlayers,
                  onChanged: (value) => AudioGame.sonidosPlayers.value = value,
                ),
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(81, 118, 72, 1),
                  ),
                  onPressed: () {
                    gameRef.overlays.remove("/Settings");
                    gameRef.overlays.add("/MenuPrinci");
                  },
                  child: const Text("Salir"))),
        ],
      )),
      backgroundColor: Color.fromRGBO(205, 205, 205, 1),
    );
  }
}
