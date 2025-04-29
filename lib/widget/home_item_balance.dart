import 'package:flutter/material.dart';

import '../utils/colors.dart';

class HomeItemBalance extends StatelessWidget {
  const HomeItemBalance({super.key, required this.color, required this.title, required this.subTitle});

  final Color color;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.only(start: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(18),
                  bottomStart: Radius.circular(18),
                ),
                color: kBlackColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: kWhiteColor),),
                  Text(subTitle,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: kWhiteColor),),
                ],
              ),
            ),
          ),
          Container(
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(18),
                bottomEnd: Radius.circular(18),
              ),
              color: color,
            ),
            child: Column(
              children: [
                Text(''),
                Text(''),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
