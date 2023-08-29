import 'package:flutter/material.dart';
import 'package:order_up/constants.dart';
import 'package:order_up/logic.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class LongPressDialog extends StatefulWidget {
  LongPressDialog({
    super.key,
    required this.index,
    required this.menuItemName,
    required this.amount,
  });

  final int index;
  int amount;
  final String menuItemName;

  @override
  State<LongPressDialog> createState() => _LongPressDialogState();
}

class _LongPressDialogState extends State<LongPressDialog> {
  final MenuGetController c = Get.find();

  removeItemData({required int index}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      c.menu.removeAt(index);
      prefs.remove(widget.menuItemName);
    });
  }

  @override
  Widget build(context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            width: 300,
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AmountModifierButton(
                  icon: Icons.arrow_upward,
                  index: widget.index,
                  onTap: () {
                    setState(() {
                      widget.amount++;
                      print(widget.amount);
                    });
                  },
                ),
                Obx(() {
                  return Text(c.menu[widget.index].amount.toString(),
                      style: kPrimaryTextStyle.copyWith(fontSize: 60));
                }),
                AmountModifierButton(
                  icon: Icons.arrow_downward,
                  index: widget.index,
                  onTap: () {
                    setState(() {
                      widget.amount--;
                      print(widget.amount);
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    DeleteItemButton(onTap: () {
                      removeItemData(index: widget.index);
                      Navigator.pop(context);
                    }),
                    const SizedBox(
                      width: 20,
                    ),
                    SaveItemButton(onTap: () {
                      Navigator.pop(context);
                      c.saveItemData(
                          name: c.menu[widget.index].name,
                          icon: c.menu[widget.index].icon,
                          amount: c.menu[widget.index].amount);
                      c.menu[widget.index].amount = widget.amount;
                    })
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DeleteItemButton extends StatefulWidget {
  const DeleteItemButton({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  State<DeleteItemButton> createState() => _DeleteItemButtonState();
}

class _DeleteItemButtonState extends State<DeleteItemButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onTap();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(50)),
        child: const Center(
          child: Text(
            "Delete Item",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class SaveItemButton extends StatefulWidget {
  const SaveItemButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  State<SaveItemButton> createState() => _SaveItemButtonState();
}

class _SaveItemButtonState extends State<SaveItemButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.onTap();
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(50)),
          child: const Center(
            child: Text(
              "Save",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class AmountModifierButton extends StatelessWidget {
  const AmountModifierButton({
    super.key,
    required this.icon,
    required this.index,
    required this.onTap,
  });

  final IconData icon;
  final int index;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
