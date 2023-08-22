import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primaryColor: Colors.pink),
      home: const HomeScreen(),
    );
  }
}



//TODO: Add some sounds as confirmation.

//TODO: Iconboxes spilling over. Please fix.