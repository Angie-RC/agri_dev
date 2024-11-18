import 'package:flutter/material.dart';
import 'menu.dart';
import 'register.dart'; // Asegúrate de tener esta pantalla implementada

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _login() {
    // Lógica para manejar el inicio de sesión
    final email = _emailController.text;
    final password = _passwordController.text;

    // Aquí puedes usar tu servicio de autenticación
    if (email.isNotEmpty && password.isNotEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Inicio de sesión exitoso")),
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainMenu()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor, completa todos los campos")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: 350,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Título de la aplicación
              const SizedBox(height: 20),
              Image.asset(
                'lib/images/logo.png', // Reemplaza con tu logo
                height: 80,
              ),
              const SizedBox(height: 10),
              const Text(
                'AgriPure',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Pestañas de "Acceso" e "Inscribirse"
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.green,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: 'Acceso'),
                  Tab(text: 'Inscribirse'),
                ],
              ),

              // Contenido de las pestañas
              SizedBox(
                height: 300, // Altura ajustada
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Pestaña de Login
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Correo electrónico*',
                            labelStyle: const TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.grey[800],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Contraseña*',
                            labelStyle: const TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.grey[800],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.visibility, color: Colors.white70),
                              onPressed: () {
                                // Lógica para mostrar/ocultar contraseña
                              },
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: const Text(
                            'Entregar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                    // Pestaña de Registro (redirección)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Regístrate para comenzar",
                          style: TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: const Text(
                            'Ir a Inscribirse',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
