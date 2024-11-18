import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPlotPage extends StatefulWidget {
  const AddPlotPage({super.key});

  @override
  _AddPlotPageState createState() => _AddPlotPageState();
}

class _AddPlotPageState extends State<AddPlotPage> {
  final _nameController = TextEditingController();
  final _sizeController = TextEditingController();
  final _quantityController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();

  Future<void> _addPlot() async {
    final url = Uri.parse('https://agripureapi.onrender.com/plot');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "name": _nameController.text,
        "size": int.parse(_sizeController.text),
        "quantity": int.parse(_quantityController.text),
        "latitude": double.parse(_latitudeController.text),
        "longitude": double.parse(_longitudeController.text),
      }),
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Plot added successfully!')),
      );
      Navigator.pop(context); // Regresa a la página de parcelas
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add plot: ${response.body}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Agregar parcela'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(_nameController, 'NAME of the plant *'),
            const SizedBox(height: 10),
            _buildTextField(_sizeController, 'SIZE of the plot in m² *'),
            const SizedBox(height: 10),
            _buildTextField(_quantityController, 'QUANTITY of plants on the plot *'),
            const SizedBox(height: 10),
            _buildTextField(_latitudeController, 'LATITUDE *'),
            const SizedBox(height: 10),
            _buildTextField(_longitudeController, 'LONGITUDE *'),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _addPlot,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text('Add Plot'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
