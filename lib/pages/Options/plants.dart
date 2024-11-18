import 'package:flutter/material.dart';

class PlantsPage extends StatelessWidget {
  const PlantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plantas'),
        backgroundColor: Colors.black87,
      ),
      body: const Center(
        child: Text(
          'Página de Plantas',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
