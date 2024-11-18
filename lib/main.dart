import 'package:AgriPure/pages/Options/forecast.dart';
import 'package:AgriPure/pages/Options/plants.dart';
import 'package:AgriPure/pages/Options/plots.dart';
import 'package:AgriPure/pages/menu.dart';
import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/Options/calendar.dart';

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
        '/': (context) => MainMenu(),
        // Ruta para el Registro
        '/register': (context) => RegisterPage(),
        '/plants': (context) => const PlantsPage(),
        '/calendar': (context) => const CalendarPage(),
        '/plots': (context) => const PlotsPage(),
        '/forecast': (context) => const ForecastPage(),
      },
    );
  }
}
