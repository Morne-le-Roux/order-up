import 'package:flutter/material.dart';
import 'package:order_up/constants.dart';
import 'package:order_up/logic.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AmountCounter extends StatefulWidget {
  const AmountCounter({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<AmountCounter> createState() => _AmountCounterState();
}

class _AmountCounterState extends State<AmountCounter> {
  MenuGetController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(50)),
      child: Center(
          child: Obx(() => Text(
                c.menu[widget.index].amount.toString(),
                style: kPrimaryTextStyle.copyWith(fontSize: 14),
              ))),
    );
  }
}
