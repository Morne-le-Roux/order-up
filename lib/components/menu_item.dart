import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:order_up/constants.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({
    super.key,
    required this.name,
    required this.iconData,
  });
  final FaIcon iconData;
  final String name;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kPrimaryColor, width: 2),
        color: kSecondaryColor,
      ),
      child: Column(
        children: [widget.iconData, Text(widget.name)],
      ),
    );
  }
}
