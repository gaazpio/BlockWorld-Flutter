
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tfggzp/juego/juego.dart';

class juegoPrincipal extends StatelessWidget{
 // late final miJuego() gameRef;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            GameWidget(
            game: miJuego(),
            ),
          ],
        ),
      ),
    );
  }
}
