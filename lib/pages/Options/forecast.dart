import 'package:flutter/material.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Sensores'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Sección de clima actual
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Time now:',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.cloud, size: 64, color: Colors.white),
                        const Spacer(),
                        const Text(
                          '0°C',
                          style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Cambiar Row por Wrap para manejar el espacio limitado
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 16.0,
                      runSpacing: 8.0,
                      children: const [
                        _ForecastDetail(label: 'Sensation', value: '0°C'),
                        _ForecastDetail(label: 'Pressure', value: '1015 hPa'),
                        _ForecastDetail(label: 'Humidity', value: '64%'),
                        _ForecastDetail(label: 'Wind', value: '0.62 km/h'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Sección de pronóstico para parcelas
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Plots forecast',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          TabBar(
                            indicatorColor: Colors.green,
                            tabs: const [
                              Tab(text: 'Cauliflower Plot'),
                              Tab(text: 'Apple Plot'),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 200,
                            child: TabBarView(
                              children: [
                                // Cauliflower Plot
                                _PlotForecastDetails(
                                  thermal: '16th',
                                  pressure: '1018 mbar',
                                  humidity: '80%',
                                  visibility: '10km',
                                  wind: '9 km/h',
                                  dewPoint: '12th',
                                ),
                                // Apple Plot
                                _PlotForecastDetails(
                                  thermal: '18th',
                                  pressure: '1020 mbar',
                                  humidity: '72%',
                                  visibility: '12km',
                                  wind: '6 km/h',
                                  dewPoint: '14th',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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

// Widget para mostrar los detalles de los plots en cada tab
class _PlotForecastDetails extends StatelessWidget {
  final String thermal;
  final String pressure;
  final String humidity;
  final String visibility;
  final String wind;
  final String dewPoint;

  const _PlotForecastDetails({
    super.key,
    required this.thermal,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.wind,
    required this.dewPoint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ForecastDetail(label: 'Thermal', value: thermal),
        _ForecastDetail(label: 'Pressure', value: pressure),
        _ForecastDetail(label: 'Humidity', value: humidity),
        _ForecastDetail(label: 'Visibility', value: visibility),
        _ForecastDetail(label: 'Wind', value: wind),
        _ForecastDetail(label: 'Dew point', value: dewPoint),
      ],
    );
  }
}

// Widget reutilizable para los detalles
class _ForecastDetail extends StatelessWidget {
  final String label;
  final String value;

  const _ForecastDetail({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              overflow: TextOverflow.ellipsis, // Previene desbordamiento
            ),
          ),
        ],
      ),
    );
  }
}

