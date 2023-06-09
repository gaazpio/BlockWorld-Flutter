import 'package:flutter/material.dart';
import 'package:tfggzp/juego/juego.dart';
import 'package:tfggzp/juego/juego_iniado.dart';
import 'package:tfggzp/juego/overlays/nivelExtra/nivelExtraGame/nivelExtraIniciado.dart';


class Gameover extends StatelessWidget {
  // Reference to parent game.
  final miJuego game;
  const Gameover({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);

    return Material(
      color: Color.fromRGBO(255, 255, 255, 0.7),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 240,
          width: 300,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(81, 118, 72, 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
            'Eliminado' ,
            style: TextStyle(
              color: whiteTextColor,
              fontSize: 40,
            ),
                ),
              const SizedBox(height: 40),
              SizedBox(
                width: 200,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    game.overlays.remove('/GameOver');
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

              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),child:
              SizedBox(
                width: 200,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    game.overlays.remove('/GameOver');
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

class GameoverExtra extends StatelessWidget {
  // Reference to parent game.
  final miJuego game;
  const GameoverExtra({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);

    return Material(
      color: Color.fromRGBO(255, 255, 255, 0.7),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 240,
          width: 300,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(141, 33, 33, 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),child:
              const Text(
                'Eliminado' ,
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 40,
                ),
              ), ),
              const SizedBox(height: 40),
              SizedBox(
                width: 200,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    game.overlays.remove('/GameOverExtra');
                    game.resumeEngine();
                    game.removeAll(game.children);
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

              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),child:
              SizedBox(
                width: 200,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    game.overlays.remove('/GameOverExtra');
                    game.resumeEngine();
                    game.removeAll(game.children);
                    game.reiniciarTodoGameExtra();
                    game.overlays.add("/MenuPrinci");

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