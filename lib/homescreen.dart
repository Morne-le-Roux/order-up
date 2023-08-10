import 'package:flutter/material.dart';
import 'package:order_up/components/menu_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> menu = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
          backgroundColor: Colors.pink,
          onPressed: () {
            menu.add(const MenuItem());
            setState(() {});
          },
          child: const Icon(Icons.add)),
      body: SafeArea(
          child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        children: [...menu],
      )),
    );
  }
}
