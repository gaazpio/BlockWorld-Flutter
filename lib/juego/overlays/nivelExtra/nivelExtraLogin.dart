import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tfggzp/juego/juego_iniado.dart';
import 'package:tfggzp/juego/overlays/nivelExtra/nivelExtraGame/nivelExtraIniciado.dart';
import '../../juego.dart';
import 'custom_views/inputTexts.dart';

class nivelExtraLogin extends StatelessWidget {
  final miJuego gameRef;

  const nivelExtraLogin({Key? key, required this.gameRef}) : super(key: key);

  void loginbtn(
      String emailAddress, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      gameRef.add(nivelExtraIniciado());
      gameRef.overlays.remove("/NivelExtra");
      print("funciona el login pichita");
    } on FirebaseAuthException catch (e) {
      print("error");

      if (e.code == 'user-not-found') {
        mensajeAlerta("El correo no tiene ninguna cuenta creada", Colors.red);
        print('No user found for that email.');
      } else if (emailAddress == "" || password == "") {
        mensajeAlerta("Rellene todos los campos porfavor", Colors.red);
      } else {
        mensajeAlerta("El correo o la contraseña no son correctos", Colors.red);
      }
    }
  }

  @override
  Widget build(BuildContextcontext) {
    inputTextsUsuario iUser = inputTextsUsuario(sTitulo: "Correo electrónico");
    inputTextsContra iPass = inputTextsContra(sTitulo: "Contraseña",isPass: true,);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                decoration: BoxDecoration(),
                child: new Text(
                  "Bienvenido al nivel extra !",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                decoration: BoxDecoration(),
                child: new Text(
                  "Ingrese sus datos para jugar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 15), child: iUser),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 12), child: iPass),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 70, 0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(81, 118, 72, 1),
                        ),
                        onPressed: () {
                          print(" ++ " +
                              iUser.getText() +
                              " ++ " +
                              iPass.getText());
                          loginbtn(iUser.getText(), iPass.getText(),
                              BuildContextcontext);
                        },
                        child: const Text("Inicar Sesion")),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(81, 118, 72, 1),
                      ),
                      onPressed: () {
                        gameRef.overlays.remove("/NivelExtra");
                        gameRef.overlays.add("/MenuPrinci");
                      },
                      child: const Text("Salir")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Text(
                        "¿No tienes cuenta?",
                        style: TextStyle(color: Color.fromRGBO(81, 118, 72, 1)),
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: TextButton(
                        onPressed: () {
                          gameRef.overlays.remove("/NivelExtra");
                          gameRef.overlays.add("/NivelExtraRegister");
                        },
                        child: Text(
                          "Registrarse",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(81, 118, 72, 1)),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(205, 205, 205, 1),
    );
  }

  void mensajeAlerta(String mensaje, Color color) {
    Fluttertoast.showToast(
      msg: mensaje,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0,
      backgroundColor: color,
    );
  }
}
