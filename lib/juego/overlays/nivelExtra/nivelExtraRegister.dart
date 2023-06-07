import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../juego.dart';
import 'custom_views/inputTexts.dart';

class nivelExtraRegister extends StatelessWidget {
  final miJuego gameRef;

  const nivelExtraRegister({Key? key, required this.gameRef}) : super(key: key);

  void crearUsuario(
      String emailAddress, String password, BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      mensajeAlerta("Cuenta creada con exito ! ", Colors.black);
      gameRef.overlays.remove("/NivelExtraRegister");
      gameRef.overlays.add("/NivelExtra");
    } on FirebaseAuthException catch (e) {
      print("error");
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        mensajeAlerta("La contraseña es muy debil", Colors.red);
      } else if (e.code == 'email-already-in-use') {
        mensajeAlerta(
            "La cuenta con ese correo electronico ya existe.", Colors.red);
        print('The account already exists for that email.');
      }
      else if (emailAddress=="" || password=="") {
        mensajeAlerta("Rellene todos los campos porfavor", Colors.red);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContextcontext) {
    inputTextsUsuario iUser = inputTextsUsuario(sTitulo: "Correo electrónico");
    inputTextsContra iPass = inputTextsContra(sTitulo: "Contraseña");
    inputTextsContra iPass2 = inputTextsContra(sTitulo: "Misma Contraseña");

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 27, 0, 0),
                decoration: BoxDecoration(),
                child: new Text(
                  "Registrate para disfrutar del nivel extra",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                decoration: BoxDecoration(),
                child: new Text(
                  "y conseguir todos los desafios",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 12), child: iUser),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 12), child: iPass),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 9), child: iPass2),
              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 90, 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(81, 118, 72, 1),
                      ),
                      onPressed: () {
                        print(iUser.getText() +
                            "+++" +
                            iPass.getText() +
                            "+++" +
                            iPass2.getText());
                        if (iPass.getText() == iPass2.getText()) {
                          crearUsuario(iUser.getText(), iPass.getText(),
                              BuildContextcontext);
                        }else{
                          mensajeAlerta(
                              "La contraseñas no coinciden.", Colors.red);

                        }
                      },
                      child: const Text("Registrate")),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(81, 118, 72, 1),
                      ),
                      onPressed: () {
                        gameRef.overlays.remove("/NivelExtraRegister");
                        gameRef.overlays.add("/NivelExtra");
                      },
                      child: const Text("Volver atras")),
                ),
              ],),

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
