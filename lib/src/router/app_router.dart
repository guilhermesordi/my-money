import 'package:flutter/material.dart';
import '../modules/login/login_screen.dart';
import '../modules/register/page/register_page.dart';
import '../modules/register/controller/register_controller.dart';
import '../modules/register/repositories/register_repository.dart';
import '../modules/register/service/register_service.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register':

        final registerController = RegisterController(RegisterRepository(RegisterService()));
        return MaterialPageRoute(builder: (_) => RegisterPage(registerController));
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))));
    }
  }
}
