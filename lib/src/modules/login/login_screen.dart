import 'package:flutter/material.dart';
import 'package:mymoney/src/shared/components/app_loading.dart';
import '../../shared/components/custom_button.dart';
// Certifique-se de importar a página de registro se necessário

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controladores para os campos de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
    ).then((_) => setState(() {
          isLoading = false;
        }));
  }

  void _navigateToRegister() {
    // Use o Navigator para mudar para a tela de registro
    Navigator.of(context).pushNamed('/register'); // Certifique-se de que esta rota está definida no seu gerenciador de rotas
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: AppLoading(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: Colors.green,
        ),
        body: Padding(
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
                onPressed: () {
                  // Aqui adicionaremos a lógica de login
                },
                color: Colors.greenAccent,
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                text: 'Registrar-se',
                onPressed: _navigateToRegister,
                color: Colors.blueAccent, // Uma cor diferente para o botão de registro
              ),
            ],
          ),
        ),
      );
    }
  }
}
