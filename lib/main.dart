import 'package:flutter/material.dart';
import 'features/countdown/presentation/pages/countdown_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countdown',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.blueGrey[900],
      ),
      home: const CountDownPage(),
    );
  }
}
