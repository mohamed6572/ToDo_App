import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'Todo_Widget.dart';

class TodoListApp extends StatefulWidget {
  @override
  State<TodoListApp> createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        children: [
          TableCalendar(
            selectedDayPredicate: (day) {
              return isSameDay(day, selectedDay);
            },
            onDaySelected: (sDay, fDay) {
              setState(() {
                selectedDay = sDay;
                focusedDay = fDay; // update `_focusedDay` here as well
              });
            },
            calendarFormat: CalendarFormat.week,
            firstDay: DateTime.now().subtract(Duration(days: 365)),
            lastDay: DateTime.now().add(Duration(days: 365)),
            focusedDay: focusedDay,
            calendarStyle: CalendarStyle(
              selectedTextStyle: TextStyle(color: Colors.white),
              selectedDecoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8)),
              todayTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(8)),
              defaultDecoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              defaultTextStyle: TextStyle(color: Colors.black),
            ),
            weekendDays: [],
            daysOfWeekStyle: DaysOfWeekStyle(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              weekdayStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (BuildContext, index) {
              return Todo_Widget();
            },
            itemCount: 20,
          ))
        ],
      ),
    );
  }
}
