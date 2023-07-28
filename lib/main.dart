import 'package:flutter/material.dart';
import 'package:flutter_sqlite/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SQLite',
      home: const Home(),
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
    );
  }
}

void main(List<String> args) {
  runApp(const App());
}
