import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class HomeBottoms extends StatelessWidget {
  const HomeBottoms({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: kSecondaryGreen
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add,color: kPrimaryGreen,),
                  SizedBox(width: 5,),
                  Text(AppLocalizations.of(context)!.plus,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: kPrimaryGreen),)
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 25,),
        Expanded(
          child: GestureDetector(
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: kSecondaryRed
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.remove,color: kPrimaryRed,),
                  SizedBox(width: 5,),
                  Text(AppLocalizations.of(context)!.minus,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: kPrimaryRed),)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
