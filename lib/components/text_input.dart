import 'package:flutter/material.dart';
import 'package:order_up/constants.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.itemNameController,
  });

  final TextEditingController itemNameController;

  @override
  Widget build(BuildContext context) {
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
        controller: itemNameController,
        onChanged: (value) {
          itemNameController.text = value;
          itemNameController.selection = TextSelection(
              baseOffset: value.length, extentOffset: value.length);
        },
        cursorColor: kPrimaryColor,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Item Name",
          hintStyle: kHintTextStyle,
          icon: Icon(
            Icons.fastfood,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
