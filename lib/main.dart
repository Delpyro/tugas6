import 'package:flutter/material.dart';
import 'package:h1d023063_tugas6/ui/form_data.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 6 Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FormDataScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}