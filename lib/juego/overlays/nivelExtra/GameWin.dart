import 'package:flutter/material.dart';
import 'package:tfggzp/juego/juego.dart';
import 'package:tfggzp/juego/juego_iniado.dart';
import 'package:tfggzp/juego/overlays/nivelExtra/nivelExtraGame/nivelExtraIniciado.dart';


class GameWin extends StatelessWidget {
  // Reference to parent game.
  final miJuego game;
  const GameWin({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);

    return Material(
      color: Color.fromRGBO(255, 255, 255, 0.7),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 340,
          width: 650,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(81, 118, 72, 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.fromLTRB(0 , 0, 0, 0),child:
              const Text(
                'Enhorabuena! te has pasado el juego' ,
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 35,
                ),
              ), ),
              Padding(padding: EdgeInsets.fromLTRB(0 , 0, 0, 0),child:
              const Text(
                'Gracias por jugarlo <3' ,
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 35,
                ),
              ), ),
              const SizedBox(height: 30),

        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),child:
              SizedBox(
                width: 200,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    game.overlays.remove('/GameWin');
                    game.resumeEngine();
                    game.removeAll(game.children);
                    game.reiniciarTodo();
                    game.add(juegoIniciado());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blackTextColor,
                  ),
                  child: const Text(
                    'Reiniciar',
                    style: TextStyle(
                      fontSize: 28.0,
                    ),
                  ),
                ),
              ),
        ),

              Padding(padding: EdgeInsets.fromLTRB(0, 12, 0, 0),child:
              SizedBox(
                width: 200,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    game.overlays.remove('/GameWin');
                    game.resumeEngine();
                    game.removeAll(game.children);
                   // game.overlays.add("/MenuPrinci");
                    game.reiniciarTodo();
                    game.add(nivelExtraIniciado());
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:blackTextColor,
                  ),
                  child: const Text(
                    'Nivel Extra',
                    style: TextStyle(
                      fontSize: 28.0,
                    ),
                  ),
                ),
              ),
              ),

              Padding(padding: EdgeInsets.fromLTRB(0, 12, 0, 0),child:
              SizedBox(
                width: 200,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    game.overlays.remove('/GameWin');
                    game.resumeEngine();
                    game.removeAll(game.children);
                    game.overlays.add("/MenuPrinci");
                    game.reiniciarTodo();
                    game.reiniciarTodoGameExtra();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:blackTextColor,
                  ),
                  child: const Text(
                    'Salir',
                    style: TextStyle(
                      fontSize: 28.0,
                    ),
                  ),
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GameWinExtra extends StatelessWidget {
  // Reference to parent game.
  final miJuego game;
  const GameWinExtra({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);

    return Material(
      color: Color.fromRGBO(255, 255, 255, 0.7),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 300,
          width: 650,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(81, 118, 72, 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.fromLTRB(40 , 0, 0, 40),child:
              const Text(
                'Enhorabuena! te has pasado el nivel extra, gracias por jugarlo <3',
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 35,
                ),
              ), ),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),child:
              SizedBox(
                width: 200,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    game.overlays.remove('/GameWinExtra');
                    game.resumeEngine();
                    game.removeAll(game.children);
                    game.reiniciarTodo();
                    game.reiniciarTodoGameExtra();
                    game.add(nivelExtraIniciado());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blackTextColor,
                  ),
                  child: const Text(
                    'Reiniciar',
                    style: TextStyle(
                      fontSize: 28.0,
                    ),
                  ),
                ),
              ),
              ),

              Padding(padding: EdgeInsets.fromLTRB(0, 12, 0, 0),child:
              SizedBox(
                width: 200,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    game.overlays.remove('/GameWinExtra');
                    game.resumeEngine();
                    game.removeAll(game.children);
                    game.overlays.add("/MenuPrinci");
                    game.reiniciarTodo();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:blackTextColor,
                  ),
                  child: const Text(
                    'Salir',
                    style: TextStyle(
                      fontSize: 28.0,
                    ),
                  ),
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}