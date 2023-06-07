import 'package:flutter/material.dart';

import '../juego.dart';

class information extends StatelessWidget {
  final miJuego gameRef;

  const information({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: SizedBox(
                width: 700,
                height: 80,
                child: const Text(
                    "Es un juego 2D, para ganar tienes que superar todos los obstaculos y abrir la puerta correcta , una vez logrado tendras que conseguir la estrella final",
                    style: TextStyle(fontSize: 20)),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SizedBox(
                height: 40,
                child: const Text("Controles", style: TextStyle(fontSize: 20)),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SizedBox(
                height: 40,
                child: const Text("Jostyck - Para moverte",
                    style: TextStyle(fontSize: 20)),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SizedBox(
                height: 40,
                child: const Text("Pulsar en la pantalla - Para saltar",
                    style: TextStyle(fontSize: 20)),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(81, 118, 72, 1),
                    ),
                    onPressed: () {
                      gameRef.overlays.remove("/Informacion");
                      gameRef.overlays.add("/MenuPrinci");
                    },
                    child: const Text("Salir"))),
          ],
        ),
      ),
    );
  }
}
