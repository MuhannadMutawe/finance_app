import 'package:finance/screens/see_all.dart';
import 'package:finance/utils/colors.dart';
import 'package:finance/widget/Home_bottoms.dart';
import 'package:finance/widget/home_item_balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appBarTitle),
        titleSpacing: 24,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeItemBalance(
                title: AppLocalizations.of(context)!.sliderLabel1,
                subTitle: '1235',
                color: kSecondaryBlue,
              ),
              SizedBox(
                height: 18,
              ),
              HomeItemBalance(
                title: AppLocalizations.of(context)!.sliderLabel2,
                subTitle: '458',
                color: kSecondaryPurple,
              ),
              SizedBox(
                height: 18,
              ),
              HomeBottoms(),
              SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.activity,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SeeAll(),)),
                    child: Text(
                      AppLocalizations.of(context)!.seeAll,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 14,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: index % 2 == 0 ? kPrimaryGreen : kPrimaryRed,
                        ),
                        SizedBox(width: 18,),
                        Column(
                          children: [
                            Text('sf fas ',style: Theme.of(context).textTheme.bodyLarge,),
                            Text('sf fas ',style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                        Spacer(),
                        Text('0.0',style: Theme.of(context).textTheme.bodyLarge)
                      ],
                    ),
                  );
                },
                itemCount: 7,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 3,);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
