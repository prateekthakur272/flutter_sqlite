import 'package:flutter/cupertino.dart';
import 'package:flutter_sqlite/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter SQLite',
      home: Home(),
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeGreen,
      ),
    );
  }
}

void main(List<String> args) {
  runApp(const App());
}
