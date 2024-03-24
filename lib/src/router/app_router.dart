import 'package:flutter/material.dart';
import '../modules/login/login_screen.dart';
import '../modules/register/page/register_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        // Rota para a tela de login
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register':
        // Rota para a tela de registro
        return MaterialPageRoute(builder: (_) => RegisterPage()); // Substitua com a instância correta da sua tela de registro
      
      default:
        // Se a rota não for definida, informe o usuário
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))));
    }
  }
}
