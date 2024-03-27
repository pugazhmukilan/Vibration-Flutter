import 'package:flutter/material.dart';
import 'package:vibrator/Vibration.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Vibration_Page(),
      ),
    );
  }
}
