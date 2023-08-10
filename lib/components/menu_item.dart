import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({super.key});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
    );
  }
}
