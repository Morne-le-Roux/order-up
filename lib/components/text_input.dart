import 'package:flutter/material.dart';
import 'package:order_up/constants.dart';

class TextInput extends StatelessWidget {
  const TextInput({super.key});

  @override
  Widget build(BuildContext context) {
    String itemString = "";
    return Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: kPrimaryColor,
        ),
      ),
      child: TextField(
        onChanged: (value) {
          itemString = value;
        },
        cursorColor: kPrimaryColor,
        decoration: const InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.fastfood,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
