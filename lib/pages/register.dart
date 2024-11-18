import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();

  bool _acceptTerms = false;

  // Verifica si todos los campos están completos y los términos aceptados
  bool get _isFormValid {
    return _usernameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _countryController.text.isNotEmpty &&
        _cityController.text.isNotEmpty &&
        _acceptTerms;
  }

  void _register() {
    // Simulación de registro exitoso
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Registro exitoso')),
    );
  }

  void _onFormChanged() {
    setState(() {
      // Actualiza el estado para habilitar/deshabilitar el botón
    });
  }

  @override
  void initState() {
    super.initState();
    // Escucha cambios en los campos de texto
    _usernameController.addListener(_onFormChanged);
    _emailController.addListener(_onFormChanged);
    _passwordController.addListener(_onFormChanged);
    _countryController.addListener(_onFormChanged);
    _cityController.addListener(_onFormChanged);
  }

  @override
  void dispose() {
    // Limpia los controladores para evitar fugas de memoria
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: SingleChildScrollView(
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
                // Título y logo
                const SizedBox(height: 20),
                Image.asset(
                  'lib/images/logo.png', // Ruta correcta del logo
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

                // Campos del formulario
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre de usuario*',
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
                const SizedBox(height: 15),
                TextField(
                  controller: _countryController,
                  decoration: InputDecoration(
                    labelText: 'País*',
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
                  controller: _cityController,
                  decoration: InputDecoration(
                    labelText: 'Ciudad*',
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

                // Checkbox para Términos y Condiciones
                const SizedBox(height: 15),
                Row(
                  children: [
                    Checkbox(
                      value: _acceptTerms,
                      onChanged: (value) {
                        setState(() {
                          _acceptTerms = value ?? false;
                        });
                      },
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                    ),
                    const Expanded(
                      child: Text(
                        'Acepto todos los Términos y Condiciones',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ],
                ),

                // Botón de registro
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: _isFormValid ? _register : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 50), disabledForegroundColor: Colors.grey.withOpacity(0.38), disabledBackgroundColor: Colors.grey.withOpacity(0.12), // Color cuando el botón está deshabilitado
                  ),
                  child: const Text(
                    'Entregar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

