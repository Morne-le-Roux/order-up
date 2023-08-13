import 'package:flutter/material.dart';
import 'package:order_up/components/text_input.dart';
import 'package:order_up/constants.dart';

class AddMenuItem extends StatefulWidget {
  const AddMenuItem({super.key});

  @override
  State<AddMenuItem> createState() => _AddMenuItemState();
}

class _AddMenuItemState extends State<AddMenuItem> {
  List<IconData> iconList = [Icons.abc, Icons.access_alarms];
  List<IconBox> iconBoxList = [];

  @override
  void initState() {
    super.initState();

    for (var iconData in iconList) {
      iconBoxList.add(IconBox(
        icon: iconData,
        selected: false,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const TextInput(),
          Row(
            children: iconBoxList,
          ),
          const AddItemButton(),
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
  final IconData icon;
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
            color: widget.selected ? kSecondaryColor : Colors.white,
            border: Border.all(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(8)),
        child: Icon(widget.icon),
      ),
    );
  }
}

class AddItemButton extends StatelessWidget {
  const AddItemButton({
    super.key,
    required iconBoxList,
  });
  final List<IconBox> iconBoxList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
