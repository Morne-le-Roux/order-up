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
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kPrimaryColor, width: 2),
              color: kSecondaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 10),
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
            )),
        const AmountCounter(),
      ],
    );
  }
}

class AmountCounter extends StatelessWidget {
  const AmountCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: kSecondaryColor,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(50)),
      child: const Center(child: Text("42")),
    );
  }
}
