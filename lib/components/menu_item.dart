import 'package:flutter/material.dart';
import 'package:order_up/constants.dart';
import 'package:get/get.dart';
import 'package:order_up/logic.dart';
import 'counter.dart';
import 'long_press_dialog.dart';

// ignore: must_be_immutable
class MenuItem extends StatefulWidget {
  MenuItem({
    super.key,
    required this.name,
    required this.icon,
    required this.amount,
    required this.index,
  });
  final String icon;
  final String name;
  final int index;

  int amount;
  Color borderColor = Colors.transparent;

  final MenuGetController c = Get.find();

  //Negate 1

  changeBorderColor() {
    if (amount < 20) {
      if (amount < 10) {
        borderColor = Colors.red;
      } else {
        borderColor = Colors.yellow;
      }
    } else {
      borderColor = Colors.transparent;
    }
  }

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool _isAnimating = false;

  void _toggleAnimation() async {
    setState(() {
      _isAnimating = true;
    });

    if (_isAnimating) {
      await Future.delayed(const Duration(milliseconds: 50));
      setState(() {
        _isAnimating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _toggleAnimation();
          widget.amount--;
          widget.changeBorderColor();
          widget.c.saveItemData(
              name: widget.name, icon: widget.icon, amount: widget.amount);
        });
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return LongPressDialog(
              amount: widget.amount,
              index: widget.index,
              menuItemName: widget.name,
            );
          },
        );
        widget.c.update();
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 50),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.borderColor,
              width: 5,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                margin: const EdgeInsets.only(bottom: 20),
                duration: const Duration(milliseconds: 100),
                width: _isAnimating ? 0 : 150.0,
                height: _isAnimating ? 0 : 150.0,
                child: FittedBox(
                  child: Stack(
                    children: [
                      Image(
                        image: AssetImage(widget.icon),
                      ),
                      Visibility(
                          visible: widget.amount < 1 ? true : false,
                          child: const Image(
                              image: AssetImage("assets/icons/finished.png"))),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -20,
                left: -20,
                child: AmountCounter(
                  index: widget.index,
                ),
              ),
              Positioned(
                bottom: 1,
                child: Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: kPrimaryTextStyle,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          )),
    );
  }
}
