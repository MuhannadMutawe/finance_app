import 'package:finance/utils/colors.dart';
import 'package:flutter/material.dart';

class NumberBottom extends StatelessWidget {
  const NumberBottom({super.key, required this.number, required this.onTap});

  final String number;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: kBlackColor,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Center(child: Text(number, style:Theme.of(context).textTheme.headlineMedium!.copyWith(color: kWhiteColor))),
        ),
      ),
    );
  }
}
