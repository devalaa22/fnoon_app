// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fnoon_app_new/Share/table_booking.dart';
import 'package:fnoon_app_new/models/event_calander.dart';
import 'Add_event_Dialog.dart';
import 'display_firebase.dart';

class Calender extends StatefulWidget {
  @override
  State<Calender> createState() => _CalenderState();
   const Calender({super.key});
}

class _CalenderState extends State<Calender> {
  Map<DateTime, List<Event>> selectedEvents = {};
  List<Event> _event = [];
  CalendarFormat format = CalendarFormat.month;
  DateTime SelectedDay = DateTime.now();
  DateTime foucsDay = DateTime.now();
  final user = FirebaseAuth.instance.currentUser;

  int datatimeofmenu = DateTime.now().year;
  List<int> hh = [];
  TextEditingController _eventController = TextEditingController();
  TextEditingController _colorController = TextEditingController();

  late String valuechoose;
  late String valuemoutchoose;
  String mont = DateTime.now().month.toString();
  int year = DateTime.now().year;
  int valuechooseintyear = DateTime.now().year;
  int valuechooseintmount = DateTime.now().month;

  final itemsmountt = [
    {"name": "يناير", "value": "1"},
    {"name": "فبراير", "value": "2"},
    {"name": "مارس", "value": "3"},
    {"name": "إبريل", "value": "4"},
    {"name": "مايو", "value": "5"},
    {"name": "يونيو", "value": "6"},
    {"name": "يوليو", "value": "7"},
    {"name": "اغسطس", "value": "8"},
    {"name": "سبتمبر", "value": "9"},
    {"name": "اكتوبر", "value": "10"},
    {"name": "نوفمبر", "value": "11"},
    {"name": "ديسمبر", "value": "12"},
  ];

  @override
  void initState() {
    super.initState();
    hh = [datatimeofmenu, datatimeofmenu + 1, datatimeofmenu + 2];
    _getEventforomDay(foucsDay);
  }

  List<Event> _getEventforomDay(DateTime date) {
    return selectedEvents[date] ?? <Event>[];
  }

  @override
  void dispose() {
    _eventController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assest/image/FnoonBackground.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Text(
                      "جدول الحجوزات",
                      style: TextStyle(fontSize: width / 15, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: width / 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // اختيار السنة
                      Container(
                        margin: EdgeInsets.only(right: width / 30),
                        height: height / 12,
                        width: width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: DropdownButton<int>(
                            value: year,
                            onChanged: (newvalue) {
                              setState(() {
                                year = newvalue ?? DateTime.now().year;
                                valuechooseintyear = year;
                              });
                            },
                            icon: Icon(Icons.arrow_drop_down, size: 33, color: Colors.orange),
                            items: hh.map((valueitem) {
                              return DropdownMenuItem(
                                value: valueitem,
                                child: Text('$valueitem'),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      // اختيار الشهر
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        height: height / 12,
                        width: width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: DropdownButton<String>(
                            value: mont,
                            onChanged: (String? newvalue) {
                              if (newvalue != null) {
                                setState(() {
                                  mont = newvalue;
                                  valuechooseintmount = int.parse(newvalue);
                                });
                              }
                            },
                            icon: Icon(Icons.arrow_drop_down, size: 33, color: Colors.orange),
                            items: itemsmountt.map((valueitem) {
                              return DropdownMenuItem(
                                value: valueitem["value"],
                                child: Text(valueitem["name"].toString()),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TableCalendar<Event>(
                      locale: Localizations.localeOf(context).languageCode,
                      firstDay: DateTime.utc(valuechooseintyear, valuechooseintmount, 1),
                      lastDay: DateTime.utc(valuechooseintyear + 2, 12, 31),
                      focusedDay: SelectedDay,
                      calendarFormat: format,
                      startingDayOfWeek: StartingDayOfWeek.saturday,
                      daysOfWeekVisible: true,
                      selectedDayPredicate: (DateTime date) => isSameDay(SelectedDay, date),
                      eventLoader: _getEventforomDay,
                      onFormatChanged: (CalendarFormat format) {
                        setState(() {
                          format = format;
                        });
                      },
                      onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                        setState(() {
                          SelectedDay = selectedDay;
                          foucsDay = focusedDay;
                        });
                        if (user?.email == null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TableBooking(selectedDay: selectedDay)));
                        }
                      },
                      onDayLongPressed: (selectedDay, focusedDay) {
                        if (user?.email != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DisplayFirebase(selectedDay: selectedDay, key: UniqueKey()),
                            ),
                          );
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TableBooking(selectedDay: selectedDay)));
                        }
                      },
                      calendarBuilders: CalendarBuilders(
                        selectedBuilder: (context, date, events) => Container(
                          margin: EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _colorController.text == "أحمر"
                                ? Colors.red
                                : _colorController.text == "برتقالي"
                                    ? Colors.orange
                                    : Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      calendarStyle: CalendarStyle(
                        isTodayHighlighted: true,
                        todayDecoration: BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.circle,
                        ),
                      ),
                      headerStyle: HeaderStyle(
                        titleCentered: true,
                        headerPadding: EdgeInsets.all(10),
                        formatButtonVisible: false,
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(fontSize: 10, color: Colors.white),
                        weekendStyle: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: user?.email != null
            ? FloatingActionButton.extended(
                icon: Icon(Icons.add),
                backgroundColor: Colors.orange,
                label: Text("إضافة فعالية"),
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AddEventDialog(
                    selectedEvents: selectedEvents,
                    SelectedDay: SelectedDay,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
