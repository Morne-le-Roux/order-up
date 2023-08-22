import 'package:flutter/material.dart';
import 'package:order_up/components/text_input.dart';
import 'package:order_up/constants.dart';
import 'package:get/get.dart';
import 'package:order_up/logic.dart';

// ignore: must_be_immutable
class AddMenuItemBottomSheet extends StatefulWidget {
  const AddMenuItemBottomSheet({
    super.key,
  });

  @override
  State<AddMenuItemBottomSheet> createState() => _AddMenuItemBottomSheetState();
}

class _AddMenuItemBottomSheetState extends State<AddMenuItemBottomSheet> {
  final MenuGetController c = Get.find();

  TextEditingController itemNameController = TextEditingController();

  TextEditingController itemAmountController = TextEditingController();

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: TextInput(
              itemNameController: itemNameController,
            ),
          ),

          //ICON LIST
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(c.iconBoxList.length, (index) {
              return IconBox(
                icon: c.iconBoxList[index].icon,
                selected: _selectedIndex == index,
                onTap: () {
                  setState(() {
                    if (_selectedIndex == index) {
                      _selectedIndex = -1; // Deselect if tapped again
                    } else {
                      _selectedIndex = index;
                    }
                  });
                },
              );
            }),
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
                  hintText: "Amount",
                  hintStyle: kHintTextStyle,
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
              c.addItemToMenu(
                  name: itemNameController.text,
                  iconData: c.iconBoxList[_selectedIndex].icon,
                  amount: itemAmountController.text == ""
                      ? 0
                      : int.parse(itemAmountController.text));
              c.saveItemData(
                  name: itemNameController.text,
                  icon: c.iconBoxList[_selectedIndex].icon,
                  amount: itemAmountController.text == ""
                      ? 0
                      : itemAmountController.text);
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
    this.onTap,
  });
  final String icon;
  bool selected = false;
  void Function()? onTap;

  // final MenuGetController c = Get.find();

  @override
  State<IconBox> createState() => _IconBoxState();
}

class _IconBoxState extends State<IconBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
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
        child: Center(
            child: Image(
          image: AssetImage(widget.icon),
        )),
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
