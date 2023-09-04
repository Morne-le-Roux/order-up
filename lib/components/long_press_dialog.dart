import 'package:flutter/material.dart';
import 'package:order_up/constants.dart';
import 'package:order_up/logic.dart';
import 'package:get/get.dart';

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
                  onTap: () {
                    setState(() {
                      c.menu[widget.index].amount++;
                    });
                  },
                ),
                Obx(() {
                  return Text(c.menu[widget.index].amount.toString(),
                      style: kPrimaryTextStyle.copyWith(fontSize: 60));
                }),
                AmountModifierButton(
                  icon: Icons.arrow_downward,
                  onTap: () {
                    setState(() {
                      c.menu[widget.index].amount--;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    DeleteItemButton(onTap: () {
                      c.removeItemFromMenu(
                          index: widget.index, name: widget.menuItemName);

                      Navigator.pop(context);
                    }),
                    const SizedBox(
                      width: 20,
                    ),
                    SaveItemButton(onTap: () {
                      c.saveItemData(
                          name: c.menu[widget.index].name,
                          icon: c.menu[widget.index].icon,
                          amount: c.menu[widget.index].amount);
                      Navigator.pop(context);
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
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: const Center(
            child: Text(
              "Delete Item",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
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
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(50),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
              child: Text(
                "Save",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
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
    required this.onTap,
  });

  final IconData icon;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            icon,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
    );
  }
}
