import 'package:flutter/material.dart';
import 'package:flutter_start/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xff232b55),
          ),
        ),
        cardColor: const Color(0xfff4eddb),
        scaffoldBackgroundColor: const Color(0xFFE7626C),
      ),
      home: const HomeScreen(),
    );
  }
}
