class TaxiModelo {
  final double kilometros;
  final String horario; 
  final double costoRecorrido; 
  final double recargoNocturno; 
  final double totalPagar; 

  TaxiModelo({
    required this.kilometros,
    required this.horario,
    required this.costoRecorrido,
    required this.recargoNocturno,
    required this.totalPagar,
  });
}
