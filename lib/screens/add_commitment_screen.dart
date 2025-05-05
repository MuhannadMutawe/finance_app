import 'package:finance/utils/colors.dart';
import 'package:finance/widget/number_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class AddCommitmentScreen extends StatefulWidget {
  const AddCommitmentScreen({super.key});

  @override
  State<AddCommitmentScreen> createState() => _AddCommitmentScreenState();
}

class _AddCommitmentScreenState extends State<AddCommitmentScreen> {
  String _numbers = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.plus),
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: kPrimaryPurple,
                          borderRadius: BorderRadius.circular(14)),
                      child: TextField(
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: kSecondaryPurple),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          border: InputBorder.none,
                          hintText: AppLocalizations.of(context)!.details,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: kSecondaryPurple),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: kSecondaryGreen,
                          borderRadius: BorderRadius.circular(14)),
                      child: Center(
                        child: Text(
                          _numbers == '' ? '+ 0.0' : _numbers,
                          textDirection: TextDirection.ltr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: kPrimaryGreen),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: [
                    Row(
                      textDirection: TextDirection.ltr,
                      children: [
                        NumberBottom(
                          number: '1',
                          onTap: () {
                            setState(() {
                              _numbers = '${_numbers}1';
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        NumberBottom(
                          number: '2',
                          onTap: () {
                            setState(() {
                              _numbers = '${_numbers}2';
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        NumberBottom(
                          number: '3',
                          onTap: () {
                            setState(() {
                              _numbers = '${_numbers}3';
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      textDirection: TextDirection.ltr,
                      children: [
                        NumberBottom(
                          number: '4',
                          onTap: () {
                            setState(() {
                              _numbers = '${_numbers}4';
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        NumberBottom(
                          number: '5',
                          onTap: () {
                            setState(() {
                              _numbers = '${_numbers}5';
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        NumberBottom(
                          number: '6',
                          onTap: () {
                            setState(() {
                              _numbers = '${_numbers}6';
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      textDirection: TextDirection.ltr,
                      children: [
                        NumberBottom(
                          number: '7',
                          onTap: () {
                            setState(() {
                              _numbers = '${_numbers}7';
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        NumberBottom(
                          number: '8',
                          onTap: () {
                            setState(() {
                              _numbers = '${_numbers}8';
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        NumberBottom(
                          number: '9',
                          onTap: () {
                            setState(() {
                              _numbers = '${_numbers}9';
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      textDirection: TextDirection.ltr,
                      children: [
                        NumberBottom(
                          number: '.',
                          onTap: () {
                            setState(() {
                              if (!_numbers.contains('.')) {
                                _numbers = '$_numbers.';
                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        NumberBottom(
                          number: '0',
                          onTap: () {
                            setState(() {
                              _numbers = '${_numbers}0';
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        NumberBottom(
                          number: '<',
                          onTap: () {
                            setState(() {
                              if (_numbers.isNotEmpty) {
                                _numbers =
                                    _numbers.substring(0, _numbers.length - 1);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kSecondaryBlue,
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        )
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.done,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: kPrimaryBlue),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kSecondaryRed,
                          padding: EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.cancel,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: kPrimaryRed),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
