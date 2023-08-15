import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:order_up/constants.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({
    super.key,
    required this.name,
    required this.icon,
  });
  final FaIcon icon;
  final String name;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kPrimaryColor, width: 2),
          color: kSecondaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                child: FittedBox(child: widget.icon)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.name,
                textAlign: TextAlign.center,
                style: const TextStyle(color: kPrimaryColor),
              ),
            ),
          ],
        ));
  }
}
