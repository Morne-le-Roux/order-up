import 'package:flutter/material.dart';
import 'package:order_up/components/animated_tap_container.dart';
import 'package:order_up/constants.dart';
import 'package:get/get.dart';
import 'package:order_up/logic.dart';

// ignore: must_be_immutable
class MenuItem extends StatefulWidget {
  MenuItem({
    super.key,
    required this.name,
    required this.icon,
    required this.amount,
  });
  final String icon;
  final String name;
  int amount;
  Color borderColor = Colors.transparent;

  final MenuGetController c = Get.find();

  //Negate 1
  amountNegate() {
    amount--;
  }

  //Add 1
  amountAdd() {
    amount++;
  }

  //Set Amount
  amountSet({amountSet}) {
    amount = amountSet;
  }

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
  @override
  void initState() {
    super.initState();
    widget.c.getItemData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
                  color: widget.borderColor,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(20)),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 10, bottom: 20),
                    child: AnimatedTapContainer(
                      onTap: () {
                        setState(() {
                          widget.amountNegate();
                          widget.changeBorderColor();
                          widget.c.saveItemData(
                              name: widget.name,
                              icon: widget.icon,
                              amount: widget.amount);
                        });
                      },
                      child: FittedBox(
                          child: Stack(
                        children: [
                          Image(
                            image: AssetImage(widget.icon),
                          ),
                          Visibility(
                              visible: widget.amount < 1 ? true : false,
                              child: const Image(
                                  image:
                                      AssetImage("assets/icons/finished.png"))),
                        ],
                      )),
                    )),
                Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: kPrimaryTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )),
        AmountCounter(
          amount: widget.amount,
        ),
      ],
    );
  }
}

class AmountCounter extends StatelessWidget {
  const AmountCounter({
    super.key,
    required this.amount,
  });

  final int amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: kSecondaryColor,
          border: Border.all(
            color: amount > 10 ? Colors.green : Colors.red,
          ),
          borderRadius: BorderRadius.circular(50)),
      child: Center(
          child: Text(
        (amount.toString()),
        style: kPrimaryTextStyle.copyWith(fontSize: 14),
      )),
    );
  }
}
