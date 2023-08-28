import 'package:flutter/material.dart';
import 'package:order_up/constants.dart';

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
          color: kSecondaryColor, borderRadius: BorderRadius.circular(50)),
      child: Center(
          child: Text(
        (amount.toString()),
        style: kPrimaryTextStyle.copyWith(fontSize: 14),
      )),
    );
  }
}
