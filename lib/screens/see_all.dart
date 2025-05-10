import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../cubit/fetch_data/fetch_data_cubit.dart';
import '../data/models/finance_model.dart';
import '../utils/colors.dart';
import 'add_commitment_screen.dart';

class SeeAll extends StatefulWidget {
  const SeeAll({super.key});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDataCubit, FetchDataState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios)),
            title: Text(AppLocalizations.of(context)!.allActivity),
          ),
          body: Padding(
            padding: EdgeInsets.all(18),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TableCalendar(
                    firstDay: DateTime.utc(2020),
                    lastDay: DateTime.now(),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    currentDay: _selectedDay,
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                      BlocProvider.of<FetchDataCubit>(context).fetchData(dateTime: selectedDay);
                    },
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Visibility(
                    visible: state is FetchDataSuccess,
                    replacement: Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        List<FinanceModel> data = BlocProvider.of<FetchDataCubit>(context).todayFinance.reversed.toList();
                        return Dismissible(
                          key: UniqueKey(),
                          background: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: AlignmentDirectional.centerStart,
                            decoration: BoxDecoration(
                              color: kSecondaryGreen,
                            ),
                            child: Icon(Icons.edit,color: kWhiteColor,),
                          ),
                          secondaryBackground: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: AlignmentDirectional.centerEnd,
                            decoration: BoxDecoration(
                              color: kSecondaryRed,
                            ),
                            child: Icon(Icons.delete,color: kWhiteColor,),
                          ),
                          onDismissed: (direction) {
                            if(direction == DismissDirection.startToEnd){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AddCommitmentScreen(isPlus: data[index].financeValue > 0 ? true : false,financeModel: data[index],),),);
                            }else if (direction == DismissDirection.endToStart){
                              data[index].delete();
                              BlocProvider.of<FetchDataCubit>(context).fetchData();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: data[index].financeValue > 0 ? kSecondaryGreen : kSecondaryRed,
                                ),
                                SizedBox(width: 18,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data[index].details,style: Theme.of(context).textTheme.bodyLarge,),
                                    Text(DateFormat.yMMMEd().format(data[index].date).toString(),style: Theme.of(context).textTheme.bodyLarge),
                                  ],
                                ),
                                Spacer(),
                                Text(data[index].financeValue.toString(),style: Theme.of(context).textTheme.bodyLarge)
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: BlocProvider.of<FetchDataCubit>(context).todayFinance.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 3,);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}