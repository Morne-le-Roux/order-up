import 'package:flutter/material.dart';
import 'package:order_up/components/text_input.dart';
import 'package:order_up/constants.dart';
import 'package:get/get.dart';
import 'package:order_up/logic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class AddMenuItemBottomSheet extends StatelessWidget {
  AddMenuItemBottomSheet({
    super.key,
  });

  final Controller c = Get.find();

  final List<IconBox> iconBoxList = [
    IconBox(
        icon: const FaIcon(FontAwesomeIcons.burger, color: kPrimaryColor),
        selected: false),
    IconBox(
        icon: const FaIcon(FontAwesomeIcons.hotdog, color: kPrimaryColor),
        selected: false),
    IconBox(
        icon: const FaIcon(FontAwesomeIcons.egg, color: kPrimaryColor),
        selected: false),
  ];

  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextInput(
            itemNameController: itemNameController,
          ),
          Row(
            children: iconBoxList,
          ),

          //Amount Text Field
          Container(
            width: 150,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor),
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: TextField(
              onChanged: (value) => itemAmountController.text = value,
              keyboardType: TextInputType.number,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                  hintText: "Starting Amount",
                  icon: Icon(
                    Icons.numbers,
                    color: kPrimaryColor,
                  ),
                  border: InputBorder.none),
            ),
          ),

          //Add Item Button
          AddItemButton(
            onTap: () {
              Navigator.pop(context);
              for (var iconBox in iconBoxList) {
                if (iconBox.selected) {
                  print(itemAmountController.text);
                  c.addItemToMenu(
                    name: itemNameController.text,
                    iconData: iconBox.icon,
                    amount: itemAmountController.text == ""
                        ? 0
                        : int.parse(itemAmountController.text),
                  );
                  break;
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class IconBox extends StatefulWidget {
  IconBox({
    super.key,
    required this.icon,
    required this.selected,
  });
  final FaIcon icon;
  bool selected = false;

  @override
  State<IconBox> createState() => _IconBoxState();
}

class _IconBoxState extends State<IconBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selected = !widget.selected;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: widget.selected
                ? const Color.fromARGB(255, 255, 132, 173)
                : Colors.white,
            border: Border.all(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(8)),
        child: Center(child: widget.icon),
      ),
    );
  }
}

class AddItemButton extends StatefulWidget {
  const AddItemButton({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  State<AddItemButton> createState() => _AddItemButtonState();
}

class _AddItemButtonState extends State<AddItemButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(50)),
        child: const Text(
          "Add Item",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
