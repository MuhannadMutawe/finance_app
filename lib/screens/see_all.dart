import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:table_calendar/table_calendar.dart';
import '../utils/colors.dart';

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
                },
              ),
              SizedBox(
                height: 12,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor:
                              index % 2 == 0 ? kPrimaryGreen : kPrimaryRed,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Column(
                          children: [
                            Text(
                              'sf fas ',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text('sf fas ',
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                        Spacer(),
                        Text('0.0',
                            style: Theme.of(context).textTheme.bodyLarge)
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}