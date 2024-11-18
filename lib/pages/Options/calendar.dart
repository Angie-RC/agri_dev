import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario'),
        backgroundColor: Colors.black87,
      ),
      body: const Center(
        child: Text(
          'Página del Calendario',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
