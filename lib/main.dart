import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/taxi_viewmodel.dart';
import 'vista/pantallas/inicio_pantalla.dart';
import 'vista/pantallas/taxi_pantalla.dart';
import 'vista/pantallas/resultado_pantalla.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaxiViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Colors.yellow,
          surface: const Color(0xFF1E1E1E),
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),

      themeMode: ThemeMode.dark, 
  
      initialRoute: '/',
      routes: {
        '/': (context) => const InicioPantalla(),
        '/principal': (context) => const TaxiPantalla(),
        '/resultado': (context) => const ResultadoPantalla(),
      },
    );
  }
}