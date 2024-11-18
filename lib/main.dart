import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/register.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Página inicial
      initialRoute: '/',
      routes: {
        // Ruta para el Login
        '/': (context) => RegisterPage(),
        // Ruta para el Registro
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
