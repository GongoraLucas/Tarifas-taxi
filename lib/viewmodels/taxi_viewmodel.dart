import 'package:flutter/material.dart';
import '../modelos/taxi_modelo.dart';

class TaxiViewModel extends ChangeNotifier {
  String horario = 'Día';
  String? errorKilometros; 

  void seleccionarHorario(String nuevoHorario) {
    horario = nuevoHorario;
    notifyListeners();
  }

  void limpiarEstado() {
    horario = 'Día';
    errorKilometros = null;
    notifyListeners(); 
  }

  bool validarKilometros(String texto) {
    if (texto.trim().isEmpty) {
      errorKilometros = 'Los kilómetros no pueden estar vacíos';
      notifyListeners();
      return false;
    }
    
    final kms = double.tryParse(texto);
    if (kms == null || kms <= 0) {
      errorKilometros = 'Ingrese un valor válido mayor a 0';
      notifyListeners();
      return false;
    }

    errorKilometros = null; 
    notifyListeners();
    return true;
  }

  TaxiModelo calcular(double kilometrosRecorridos) {
    const double tarifaBase = 1.50;
    const double costoPorKm = 0.60;

    double costoRecorrido = kilometrosRecorridos * costoPorKm;
    
    double recargoNocturno = 0.0;
    if (horario == 'Noche') {
      recargoNocturno = costoRecorrido * 0.20;
    }

    double totalPagar = tarifaBase + costoRecorrido + recargoNocturno;

    return TaxiModelo(
      kilometros: kilometrosRecorridos,
      horario: horario,
      costoRecorrido: costoRecorrido,
      recargoNocturno: recargoNocturno,
      totalPagar: totalPagar,
    );
  }
}
