import 'package:finance/utils/colors.dart';
import 'package:finance/widget/on_boarding_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:hive_flutter/adapters.dart';

import '../utils/showBottomSheet.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => showLanguageBottomSheet(context),
          icon: Icon(Icons.language),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 8),
            child: Visibility(
              visible: _index < 3,
              child: TextButton(
                onPressed: () => setState(() {
                  _pageController.animateToPage(2,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                  _index = 3;
                }),
                child: Text(AppLocalizations.of(context)!.skip),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    _index = value + 1;
                  });
                },
                children: [
                  ItemView(
                    title: AppLocalizations.of(context)!.title1,
                    subTitle: AppLocalizations.of(context)!.subTitle1,
                    imagePath: 'assets/images/finance1.png',
                  ),
                  ItemView(
                    title: AppLocalizations.of(context)!.title2,
                    subTitle: AppLocalizations.of(context)!.subTitle2,
                    imagePath: 'assets/images/finance2.png',
                  ),
                  ItemView(
                    title: AppLocalizations.of(context)!.title3,
                    subTitle: AppLocalizations.of(context)!.subTitle3,
                    imagePath: 'assets/images/finance3.png',
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 80, top: 40),
              child: Column(
                children: [
                  Text('$_index/3',
                      style: Theme.of(context).textTheme.bodyLarge),
                  SizedBox(
                    height: 12,
                  ),
                  Visibility(
                    visible: _index < 3,
                    replacement: ValueListenableBuilder(
                      valueListenable:
                          Hive.box('showOnBoardingBox').listenable(),
                      builder: (context, value, child) {
                        return ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/home_screen');
                            value.put('isShowOnBoarding', true);
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 55),
                              backgroundColor: kPrimaryBlue),
                          child: Text(
                            AppLocalizations.of(context)!.start,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: kWhiteColor),
                          ),
                        );
                      },
                    ),
                    child: ElevatedButton(
                      onPressed: () => setState(
                        () {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 55),
                          backgroundColor: kPrimaryBlue),
                      child: Text(
                        AppLocalizations.of(context)!.next,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: kWhiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
