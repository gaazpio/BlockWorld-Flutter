import 'package:flutter/material.dart';


class inputTextsUsuario extends StatelessWidget{

  final String sTitulo;
  final TextEditingController myController = TextEditingController(text: "");
  final String valorIni =" ";
  final bool isPass;

  inputTextsUsuario ({Key? key, required this.sTitulo, this.isPass=false}) : super(key:key);

  String getText() {
    return myController.text;
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(81, 118, 72, 1),
          width: 3,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(2),
        ),
      ),
      child: TextField(
        controller: myController,
        decoration: InputDecoration(
          border: InputBorder.none,
            contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 7),
            fillColor: Colors.black,
            hintText: sTitulo,
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );


  }

}

class inputTextsContra extends StatelessWidget{

  final String sTitulo;
  final TextEditingController myController = TextEditingController(text: "");
  final String valorIni =" ";
  final bool isPass;

  inputTextsContra ({Key? key, required this.sTitulo, this.isPass=false}) : super(key:key);

  String getText() {
    return myController.text;
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(81, 118, 72, 1),
          width: 3,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(2),
        ),
      ),
      child: TextField(
        controller: myController,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 7),
            fillColor: Colors.black,
            hintText: sTitulo,
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );


  }

}