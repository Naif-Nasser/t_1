import 'package:flutter/material.dart';

import 'pages/splash_page.dart';

void main() {
  runApp(const PerfumeApp());
}

class PerfumeApp extends StatelessWidget {
  const PerfumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFCF1DB),
        primaryColor: const Color(0xFF690108),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF690108),
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF690108)),
      ),

      home: const SplashPage(),
    );
  }
}
