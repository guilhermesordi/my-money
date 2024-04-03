import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mymoney/src/modules/login/controller/login_controller.dart';
import 'package:mymoney/src/shared/components/app_loading.dart';
import '../../shared/components/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = LoginController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _navigateToRegister() {
    Navigator.of(context).pushNamed('/register');
  }

  bool isLoading = false;

  void _login() async {
    setState(() {
      isLoading = true; // Ativar o indicador de carregamento
    });

    // Simular uma chamada de API
    await Future.delayed(const Duration(seconds: 2));

    // Após a chamada da API ou operação de login
    setState(() {
      isLoading = false;
    });
    // Aqui adicionaremos a lógica de navegação após o login bem sucedido
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.green,
      ),
      body: isLoading
          ? const Center(
              child:
                  AppLoading(), // Exibir o loading enquanto isLoading for true
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Digite seu e-mail',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      hintText: 'Digite sua senha',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  CustomButton(
                      text: 'ENTRAR',
                      onPressed: _login, // Adiciona a lógica de login ao botão
                      color: Colors.greenAccent,
                      action: () {
                        controller.checkData(
                          emailController: _emailController.text,
                          passwordController: _passwordController.text,
                          buildContext: context,
                        );
                      },
                      label: "Login"),
                  const SizedBox(height: 16.0),
                  CustomButton(
                      text: 'Registrar-se',
                      onPressed: _navigateToRegister,
                      color: Colors.greenAccent,
                      action: () {},
                      label: "Registrar" // Cor do botão igual ao botão ENTRAR
                      ),
                ],
              ),
            ),
    );
  }
}
