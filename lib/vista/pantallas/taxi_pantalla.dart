import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/taxi_viewmodel.dart';
import '../widgets/option_button.dart';
import '../widgets/campo_numero.dart';

class TaxiPantalla extends StatefulWidget {
  const TaxiPantalla({super.key});
  @override
  State<TaxiPantalla> createState() => _TaxiPantallaState();
}

class _TaxiPantallaState extends State<TaxiPantalla> {
  final kmController = TextEditingController();

  @override
  void dispose() {
    kmController.dispose();
    super.dispose();
  }

  void calcular() {
    final vm = context.read<TaxiViewModel>();
    
    if (!vm.validarKilometros(kmController.text)) {
      return; 
    }

    double kilometros = double.parse(kmController.text);
    final resultado = vm.calcular(kilometros);

    Navigator.pushNamed(
      context,
      '/resultado',
      arguments: resultado,
    );
  }

  void limpiarTodo() {
    kmController.clear();
    context.read<TaxiViewModel>().limpiarEstado();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TaxiViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarifa de Taxi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CampoNumero(etiqueta: 'Kilómetros Recorridos', controller: kmController),
            
            if (vm.errorKilometros != null) ...[
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  vm.errorKilometros!,
                  style: const TextStyle(
                    color: Colors.redAccent, 
                    fontSize: 13, 
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
            
            const SizedBox(height: 10),

            OptionButton(
              titulo: 'Viaje de Día',
              valor: 'Día',
              seleccionado: vm.horario,
              onChanged: (valor) => vm.seleccionarHorario(valor!),
            ),

            OptionButton(
              titulo: 'Viaje de Noche (+20% Recargo)',
              valor: 'Noche',
              seleccionado: vm.horario,
              onChanged: (valor) => vm.seleccionarHorario(valor!),
            ),

            const SizedBox(height: 20),
            
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: limpiarTodo,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                    child: const Text('Limpiar'),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: ElevatedButton(
                    onPressed: calcular,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Calcular'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
