import 'package:flutter/material.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pronóstico'),
        backgroundColor: Colors.black87,
      ),
      body: const Center(
        child: Text(
          'Página del Pronóstico',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
