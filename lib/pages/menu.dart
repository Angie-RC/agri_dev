import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgriPure'),
        backgroundColor: Colors.black87,
      ),
      drawer: Drawer(
        child: SafeArea( // Envolvemos el contenido del Drawer con SafeArea
          child: Container(
            color: Colors.black87,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Encabezado del Drawer
                Container(
                  color: Colors.grey[900],
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/images/logo.png', // Asegúrate de que la ruta sea correcta
                        height: 80,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'AgriPuro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Opciones del menú
                ListTile(
                  leading: const Icon(Icons.local_florist, color: Colors.white),
                  title: const Text('Plantas', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pushNamed(context, '/plants');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.calendar_today, color: Colors.white),
                  title: const Text('Calendario', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pushNamed(context, '/calendar');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.map, color: Colors.white),
                  title: const Text('Parcelas', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pushNamed(context, '/plots');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.cloud, color: Colors.white),
                  title: const Text('Pronóstico', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pushNamed(context, '/forecast');
                  },
                ),

                const Spacer(),

                // Pie del Drawer
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: const [
                      Icon(Icons.account_circle, color: Colors.white),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Bienvenido\nUsuario',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[900],
        child: const Center(
          child: Text(
            'Bienvenido a AgriPure',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
