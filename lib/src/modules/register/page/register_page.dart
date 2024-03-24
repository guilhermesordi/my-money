import 'package:flutter/material.dart';
import 'register_controller.dart';


class RegisterPage extends StatelessWidget {
  final RegisterController controller;
  

  RegisterPage(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Column(
        children: <Widget>[
          // Adicione os campos de texto para e-mail, senha
          // Adicione um botão que chamará 'controller.register' quando pressionado.
        ],
      ),
    );
  }
}
