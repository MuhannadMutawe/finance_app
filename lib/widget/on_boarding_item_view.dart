import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key, required this.title, required this.subTitle, required this.imagePath});

  final String title;
  final String subTitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(title,textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: kPrimaryBlue),),
        Image.asset(imagePath),
        Text(subTitle,textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyLarge)
      ],
    );
  }
}
