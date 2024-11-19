import 'package:flutter/material.dart';

class PlantDetailsScreen extends StatelessWidget {
  final dynamic plant;

  const PlantDetailsScreen({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${plant['name']} Details'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  plant['image'],
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Scientific Name: ${plant['scientifistname']}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Variety: ${plant['variety']}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              buildExpansionTile('Land Type', plant['infolandType']),
              buildExpansionTile(
                  'Planting Distance Between Plants', plant['infoDistanceBetween']),
              buildExpansionTile('Ideal Depth for Planting', plant['infoIdealDepth']),
              buildExpansionTile(
                  'Weather Conditions', plant['infoWeatherConditions']),
              buildExpansionTile(
                  'Fertilization and Fumigation', plant['infoFertFumig']),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica para agregar planta
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('Add Plant'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildExpansionTile(String title, String content) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            content,
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
