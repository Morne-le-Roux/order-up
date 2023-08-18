import 'package:flutter/material.dart';
import 'package:order_up/components/animated_tap_container.dart';
import 'package:order_up/constants.dart';

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

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
            margin: const EdgeInsets.all(8),
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
                        });
                      },
                      child: FittedBox(
                          child: Image(
                        image: AssetImage(widget.icon),
                      )),
                    )),
                Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: kPrimaryTextStyle,
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
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: kSecondaryColor,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(50)),
      child: Center(
          child: Text(
        (amount.toString()),
        style: kPrimaryTextStyle.copyWith(fontSize: 14),
      )),
    );
  }
}
