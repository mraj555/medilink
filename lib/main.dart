import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: Color(0xFF00BFA5),
          primary: Color(0xFF00BFA5),
          secondary: Color(0xFF667EEA),
          surface: Color(0xFFF8FAFB),
        ),
        scaffoldBackgroundColor: Color(0xFFF8FAFB),
        fontFamily: 'Inter',
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
          color: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xFFF8FAFB),
          foregroundColor: Color(0xFF1E293B),
        ),
      ),
    );
  }
}
