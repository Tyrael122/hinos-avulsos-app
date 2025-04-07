import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hinos_avulsos_app/screens/home_screen.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hinos Avulsos',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(), // We'll create this next
    );
  }
}