import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
              padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: SizedBox(
                width: 700,
                height: 80,
                child: const Text(
                    "Es un juego 2D, creado como proyecto final del GS de DAM , espero que disfrutes de los 2 modos de juegos creados , aqui te dejo mis redes por si quieres saber algo mas de informacion, muchas gracias <3",
                    style: TextStyle(fontSize: 20)),
              ),
            ), Column(
              children: [Row(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(300, 10, 0, 30),
                      child: TextButton(
                        onPressed: () {
                          _launchURLLink();
                          print("pulsao");
                        },
                        child: Text(
                          "Linkedin",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18,
                              color: Color.fromRGBO(81, 118, 200, 1)),
                        ),
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(55, 10, 0, 30),
                      child: TextButton(
                        onPressed: () {
                          _launchURLGIT();
                          print("pulsao");
                        },
                        child: Text(
                          "GitHub",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18,
                              color: Color.fromRGBO(81, 118, 200, 1)),
                        ),
                      )
                  ),
                ],
              ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SizedBox(
                    height: 40,
                    child: const Text("Controles", style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 2.5, 0, 0),
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
                  ),),
              ],
            ),

            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
  _launchURLLink() async {
    final Uri url = Uri.parse('https://www.linkedin.com/in/davidgazpio/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch _url');
    }
  }

  _launchURLGIT() async {
    final Uri url = Uri.parse('https://github.com/gaazpio');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch _url');
    }
  }

}

