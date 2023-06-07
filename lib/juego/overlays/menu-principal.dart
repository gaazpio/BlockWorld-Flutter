import 'package:flutter/material.dart';
import 'package:tfggzp/juego/juego.dart';
import 'package:tfggzp/juego/juego_iniado.dart';
import 'package:tfggzp/juego/niveles/niveles.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPrinci extends StatelessWidget {
  final miJuego gameRef;

  const MenuPrinci({Key? key, required this.gameRef})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: 1920,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/fondo_juego.png"),fit: BoxFit.cover)
        ),
          child:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                  child: Text(
                    'Block World',
                    style: GoogleFonts.pressStart2p(

                      fontSize: 55,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(205, 205, 205, 1),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                      child: SizedBox(
                        width: 90,
                        height: 70,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            gameRef.overlays.remove("/MenuPrinci");
                            gameRef.overlays.add("/Settings");
                          },
                          label: const Text(
                            "",
                            style: TextStyle(fontSize: 19),
                          ),
                          style: ElevatedButton.styleFrom(padding: EdgeInsets.fromLTRB(6, 0, 0,0) ,
                            backgroundColor: Color.fromRGBO(59, 38, 22, 1),
                          ), icon:Icon(Icons.settings,size: 56,color: Color.fromRGBO(205, 205, 205, 1)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(130, 40, 130, 0),
                      child: SizedBox(
                        width: 110,
                        height: 100,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            gameRef.overlays.remove("/MenuPrinci");
                            gameRef.add(juegoIniciado());

                            //gameRef.overlays.add("/JuegoPrincipal");
                            //Navigator.of(context).popAndPushNamed("/JuegoPrincipal");
                          },
                          label: const Text(
                            "",
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(padding: EdgeInsets.fromLTRB(6, 0, 0,0) ,
                            backgroundColor: Color.fromRGBO(59, 38, 22, 1),
                          ), icon:Icon(Icons.play_arrow,size: 96,color: Color.fromRGBO(205, 205, 205, 1)),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                      child: SizedBox(
                        width: 90,
                        height: 70,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            gameRef.overlays.remove("/MenuPrinci");
                            gameRef.overlays.add("/Informacion");
                          },
                          label: const Text(
                            "",
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(padding: EdgeInsets.fromLTRB(6, 0, 0,0) ,
                            backgroundColor: Color.fromRGBO(59, 38, 22, 1),
                          ), icon:Icon(Icons.info,size: 59,color: Color.fromRGBO(205, 205, 205, 1)),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: SizedBox(
                        width: 120,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            gameRef.overlays.remove("/MenuPrinci");
                            gameRef.overlays.add("/NivelExtra");
                          },
                          child: const Text(
                            "Nivel Extra",
                            style: TextStyle(fontSize: 18,color:  Color.fromRGBO(205, 205, 205, 1)),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(59, 38, 22, 1),),
                        ),
                      ),
                    ),
                ],)

              ],
            ),
          ),
          ),
    );
  }
}
