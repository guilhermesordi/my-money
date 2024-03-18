import 'package:flutter/material.dart';
import 'router/app_router.dart';
import 'modules/login/login_screen.dart'; 
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMoney',
      theme: ThemeData(
        primarySwatch: Colors.green, 
        visualDensity: VisualDensity.adaptivePlatformDensity,
        
      ),
      home: LoginScreen(), // Define a tela de login como a inicial
      onGenerateRoute: AppRouter.onGenerateRoute,
      
    );
  }
}
