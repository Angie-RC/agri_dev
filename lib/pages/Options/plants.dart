import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'plant_details.dart';

class PlantsScreen extends StatefulWidget {
  @override
  _PlantsScreenState createState() => _PlantsScreenState();
}

class _PlantsScreenState extends State<PlantsScreen> {
  List<dynamic> plants = [];

  @override
  void initState() {
    super.initState();
    fetchPlants();
  }

  Future<void> fetchPlants() async {
    final url = Uri.parse('https://agripureapi.onrender.com/plants');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          plants = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load plants');
      }
    } catch (e) {
      print('Error fetching plants: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AgriPure: Manage your planting'),
        backgroundColor: Colors.green,
      ),
      body: plants.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: plants.length,
        itemBuilder: (context, index) {
          final plant = plants[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(
                plant['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                plant['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PlantDetailsScreen(plant: plant),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: Text('Details'),
              ),
            ),
          );
        },
      ),
    );
  }
}
