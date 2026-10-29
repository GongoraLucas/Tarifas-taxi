import 'package:flutter/material.dart';
import '../../modelos/taxi_modelo.dart';
import '../widgets/dato.dart';

class ResultadoPantalla extends StatelessWidget {
  const ResultadoPantalla({super.key});

  @override
  Widget build(BuildContext context) {

    final taxi = ModalRoute.of(context)!.settings.arguments as TaxiModelo;

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado de Carrera')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  Dato(
                    titulo: 'Kilómetros Recorridos', 
                    valor: '${taxi.kilometros.toStringAsFixed(2)} km',
                  ),
                  Dato(
                    titulo: 'Horario del Viaje', 
                    valor: taxi.horario,
                  ),
                  Dato(
                    titulo: 'Costo del Recorrido', 
                    valor: '\$${taxi.costoRecorrido.toStringAsFixed(2)}',
                  ),
                  Dato(
                    titulo: 'Recargo Nocturno', 
                    valor: '\$${taxi.recargoNocturno.toStringAsFixed(2)}',
                  ),
                  Dato(
                    titulo: 'Tarifa base', 
                    valor: '\$1.50',
                  ),
                  Dato(
                    titulo: 'Total a Pagar', 
                    valor: '\$${taxi.totalPagar.toStringAsFixed(2)}',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Regresar'),
            ),
          ],
        ),
      ),
    );
  }
}
