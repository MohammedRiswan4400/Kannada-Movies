import 'package:flutter/material.dart';
import 'package:kannada_movies/screens/screen_splash/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Geeksynergy",
      home: ScreenSplash(),
    );
  }
}
