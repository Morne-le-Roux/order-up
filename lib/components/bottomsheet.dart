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
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: TextInput(
                itemNameController: itemNameController,
              ),
            ),

            //ICON LIST
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(c.iconBoxList.length, (index) {
                  return Container(
                    margin: const EdgeInsets.all(100),
                    child: IconBox(
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
                    ),
                  );
                }),
              ),
            ),

            //Amount Text Field
            Container(
              margin: const EdgeInsets.only(top: 18, bottom: 18),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    onChanged: (value) => itemAmountController.text = value,
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                        hintText: "Amount",
                        hintStyle: kHintTextStyle,
                        icon: Icon(
                          Icons.numbers,
                          color: Color.fromARGB(210, 170, 170, 170),
                        ),
                        border: InputBorder.none),
                  ),
                ),
              ),
            ),

            //Add Item Button
            AddItemButton(
              onTap: () {
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
                Navigator.pop(context);
              },
            ),
          ],
        ),
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
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10000),
        child: Container(
          margin: const EdgeInsets.all(100),
          decoration: BoxDecoration(
            color: widget.selected
                ? const Color.fromARGB(255, 238, 82, 134)
                : Colors.white,
            // border: Border.all(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(10000),
          ),
          child: Center(
              child: Image(
            image: AssetImage(widget.icon),
          )),
        ),
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
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: 200,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Center(
            child: Text(
              "Add Item",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
