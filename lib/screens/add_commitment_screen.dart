import 'package:finance/cubit/add_data/add_data_cubit.dart';
import 'package:finance/data/models/finance_model.dart';
import 'package:finance/utils/colors.dart';
import 'package:finance/widget/number_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../cubit/fetch_data/fetch_data_cubit.dart';

class AddCommitmentScreen extends StatefulWidget {
  const AddCommitmentScreen({super.key, required this.isPlus,this.financeModel});
  final bool isPlus;
  final FinanceModel? financeModel;

  @override
  State<AddCommitmentScreen> createState() => _AddCommitmentScreenState();
}

class _AddCommitmentScreenState extends State<AddCommitmentScreen> {
  String _numbers = '';
  late TextEditingController _details;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _details = TextEditingController();
    if(widget.financeModel != null){
      setState(() {
        _details.text = widget.financeModel!.details;
        _numbers = widget.financeModel!.financeValue < 0 ? (widget.financeModel!.financeValue * -1).toString() : widget.financeModel!.financeValue.toString();
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _details.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddDataCubit(),
      child: BlocBuilder<AddDataCubit,AddDataState>(
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.isPlus ? AppLocalizations.of(context)!.plus : AppLocalizations.of(context)!.minus),
              leading: IconButton(
                onPressed: () {
                  BlocProvider.of<FetchDataCubit>(context)
                      .fetchData();
                  Navigator.pop(context);
                },
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
                              controller: _details,
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
                                color: widget.isPlus ? kSecondaryGreen : kSecondaryRed,
                                borderRadius: BorderRadius.circular(14)),
                            child: Center(
                              child: Text(
                                _numbers == '' ? widget.isPlus ? '+ 0.0' : '- 0.0' : widget.isPlus ? '+ $_numbers' : '- $_numbers',
                                textDirection: TextDirection.ltr,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: widget.isPlus ? kPrimaryGreen : kPrimaryRed ),
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
                            onPressed: () {
                              if(widget.financeModel != null){
                                widget.financeModel!.details = _details.text;
                                widget.financeModel!.financeValue = widget.isPlus ? double.parse(_numbers) : double.parse(_numbers) < 0 ? double.parse(_numbers) : double.parse(_numbers) * -1;
                                widget.financeModel!.save();
                              }else{
                                if(_numbers != '') {
                                  BlocProvider.of<AddDataCubit>(context).addData(
                                      FinanceModel(details: _details.text,
                                          financeValue: widget.isPlus ? double
                                              .parse(_numbers) : double.parse(
                                              _numbers) * -1,
                                          date: DateTime.now()));
                                }
                              }
                              BlocProvider.of<FetchDataCubit>(context)
                                  .fetchData();
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kSecondaryBlue,
                                padding: EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                )
                            ),
                            child: Text(
                              widget.financeModel != null ? AppLocalizations.of(context)!.update :AppLocalizations.of(context)!.save,
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
                            onPressed: () {
                              Navigator.pop(context);
                            },
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
        },
      ),
    );
  }
}
