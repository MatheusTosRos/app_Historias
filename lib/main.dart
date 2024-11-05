// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(BrazilianStoriesApp());
}

class BrazilianStoriesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Histórias Brasileiras',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Cores principais do aplicativo
        primaryColor: Colors.black,
        primarySwatch: MaterialColor(0xFF000000, {
          50: Color(0xFFE0E0E0),
          100: Color(0xFFB3B3B3),
          200: Color(0xFF808080),
          300: Color(0xFF4D4D4D),
          400: Color(0xFF262626),
          500: Color(0xFF000000),
          600: Color(0xFF000000),
          700: Color(0xFF000000),
          800: Color(0xFF000000),
          900: Color(0xFF000000),
        }),
        // Cores secundárias
        colorScheme: ColorScheme.light(
          primary: Colors.black,
          secondary: Color(0xFF1B5E20), // Verde escuro
          tertiary: Color(0xFF0D47A1), // Azul escuro
        ),
        // Estilo dos cards
        cardTheme: CardTheme(
          elevation: 4,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        // Estilo dos textos
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: Colors.black87,
          ),
        ),
        // Estilo dos inputs
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          labelStyle: TextStyle(color: Colors.black87),
        ),
        // Estilo dos botões
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        // Estilo dos ícones
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 24,
        ),
      ),
      home: HomeScreen(),
    );
  }
}