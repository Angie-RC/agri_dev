import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:AgriPure/widgets/add_plot.dart';

class PlotsPage extends StatefulWidget {
  const PlotsPage({super.key});

  @override
  _PlotsPageState createState() => _PlotsPageState();
}

class _PlotsPageState extends State<PlotsPage> {
  List<dynamic> plots = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPlots();
  }

  Future<void> fetchPlots() async {
    final url = Uri.parse('https://agripureapi.onrender.com/plot');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        plots = json.decode(response.body);
        isLoading = false;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch plots: ${response.body}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('My Plots'),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddPlotPage()),
                ).then((_) => fetchPlots()); // Actualiza la lista después de agregar un plot
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                '+ Add plot',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            isLoading
                ? const Center(
              child: CircularProgressIndicator(color: Colors.green),
            )
                : plots.isEmpty
                ? const Center(
              child: Text(
                'No plots available',
                style: TextStyle(color: Colors.white),
              ),
            )
                : Expanded(
              child: ListView.builder(
                itemCount: plots.length,
                itemBuilder: (context, index) {
                  final plot = plots[index];
                  return Card(
                    color: Colors.grey[900],
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(
                        plot['name'],
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Size: ${plot['size']} m²\nQuantity: ${plot['quantity']}',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          deletePlot(plot['id']);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deletePlot(String id) async {
    final url = Uri.parse('https://agripureapi.onrender.com/plot/$id');
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Plot deleted successfully!')),
      );
      fetchPlots(); // Actualiza la lista después de eliminar
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete plot: ${response.body}')),
      );
    }
  }
}
