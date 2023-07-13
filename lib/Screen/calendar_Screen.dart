
import 'package:flutter/material.dart';
import 'package:odiacalendar2023/model/festival_data.dart';
import 'package:odiacalendar2023/widget/Expense/add_expense.dart';
import 'package:odiacalendar2023/widget/Note/add_Note.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:in_app_review/in_app_review.dart';

class EventCalendarScreen extends StatefulWidget {
  const EventCalendarScreen({Key? key}) : super(key: key);

  @override
  State<EventCalendarScreen> createState() => _EventCalendarScreenState();
}

// ignore: duplicate_ignore
class _EventCalendarScreenState extends State<EventCalendarScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int activeindex = 0;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;
  var chooseYrReq = "ପର୍ବପର୍ବାଣୀ";
  bool pressAttention = false;

  //var month = DateTime(2023, 9, 7, 17, 30);


  final descpController = TextEditingController();
  late DateFormat dateFormatt;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    _selectedDate = _focusedDay;
//var month = DateFormat('MMM').format(_focusedDay);
    loadPreviousEvents();
    dateFormatt = new DateFormat.yMMMM("or");
    review();
  }

  final InAppReview inAppReview = InAppReview.instance;

  Future<void> review() async {
    if (await inAppReview.isAvailable()) {
      Future.delayed(const Duration(days: 5), () {
        inAppReview.requestReview();
      });
    }
  }

  List _listOfDayEvent(DateTime dateTime) {
    if (Jan[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return Jan[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else if (Feb[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return Feb[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else if (Mar[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return Mar[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else if (Apr[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return Apr[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else if (May[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return May[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else if (Jun[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return Jun[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else if (Jul[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return Jul[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else if (Aug[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return Aug[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else if (Sep[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return Sep[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else if (Oct[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return Oct[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else if (Nov[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return Nov[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else if (Dec[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return Dec[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }

    // if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
    //   return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    // } else {
    //   return [];
    //}
    //_focusedDay = DateFormat('yyyy-MM-dd').format(dateTime);
  }
  List _listOfDayNote(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  List Cool = [
    Colors.pink[400],
    Colors.greenAccent,
    Colors.grey,
    Colors.teal[900],
    Colors.amber,
    Colors.blue,
    Colors.cyanAccent,
    Colors.red,
    Colors.tealAccent,
  ];

  List NmeOfkeyMonth = ["ପର୍ବପର୍ବାଣୀ", "img","ସୁଭଦିନ"];


  List _listOfDayEvents(data) {
    if (data == "2023-Jan") {
      List liss1 = [];
      Jan.forEach((key, value) {
        liss1.addAll(value);
      });
      return liss1;
    } else if (data == "2023-Feb") {
      List liss1 = [];
      Feb.forEach((key, value) {
        liss1.addAll(value);
      });
      return liss1;
    } else if (data == "2023-Mar") {
      List liss1 = [];
      Mar.forEach((key, value) {
        liss1.addAll(value);
      });
      return liss1;
    } else if (data == "2023-Apr") {
      List liss1 = [];
      Apr.forEach((key, value) {
        liss1.addAll(value);
      });
      return liss1;
    } else if (data == "2023-May") {
      List liss1 = [];
      May.forEach((key, value) {
        liss1.addAll(value);
      });
      return liss1;
    } else if (data == "2023-Jun") {
      List liss1 = [];
      Jun.forEach((key, value) {
        liss1.addAll(value);
      });
      return liss1;
    } else if (data == "2023-Jul") {
      List liss1 = [];
      Jul.forEach((key, value) {
        liss1.addAll(value);
      });
      return liss1;
    } else if (data == "2023-Aug") {
      List liss1 = [];
      Aug.forEach((key, value) {
        liss1.addAll(value);
      });
      return liss1;
    } else if (data == "2023-Sep") {
      List liss1 = [];
      Sep.forEach((key, value) {
        liss1.addAll(value);
      });
      return liss1;
    } else if (data == "2023-Oct") {
      List liss1 = [];
      Oct.forEach((key, value) {
        liss1.addAll(value);
      });
      return liss1;
    } else if (data == "2023-Nov") {
      List liss1 = [];
      Nov.forEach((key, value) {
        liss1.addAll(value);
      });
      return liss1;
    } else if (data == "2023-Dec") {
      List liss1 = [];
      Dec.forEach((key, value) {
        liss1.addAll(value);
      });
      return liss1;
    } else {
      return [];
    }
  }


  _showEventDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          bool istrue =
          _listOfDayEvent(_selectedDate!).length == 0 ? false : true;
          return StatefulBuilder(builder: ((context, setState) {
            return AlertDialog(
                title: Text(
                  DateFormat('yyyy,MMMM,dd').format(_focusedDay).toString(),
                  textAlign: TextAlign.center,
                ),
                content: SingleChildScrollView(
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                istrue = true;
                                // dundr = ["event", "img", "date"];
                                setState(() {});
                              },
                              child: const Text("Today calendar")),
                          ElevatedButton(
                              onPressed: () {
                                // dundr = ["event"];
                                istrue = false;
                                print(istrue);
                                setState(() {});
                              },
                              child: const Text("Add new on this date"))
                        ],
                      ),
                      Visibility(
                          visible: istrue,
                          child: Column(
                            children: [
                              ..._listOfDayEvent(_selectedDate!).map(
                                      (myEvents) => ListTile(
                                    // leading: const Icon(
                                    //   Icons.done,
                                    //   color: Colors.teal,
                                    // ),
                                      title: Column(
                                        children: [
                                          //column widget return of the date basis of the calender ontab on the date
                                          for (int j = 0;
                                          j < NmeOfkeyMonth.length;
                                          j++)
                                            myEvents[NmeOfkeyMonth[j]] == null
                                                ? const SizedBox(
                                              //color: Colors.red,
                                              height: 0,
                                              width: 0,
                                            )
                                                : Column(
                                              children: [
                                                Text(
                                                  NmeOfkeyMonth[j].toString(),
                                                  style: const TextStyle(

                                                    //backgroundColor: Colors.black,
                                                      color: Colors.blue,
                                                      fontSize: 30,
                                                      fontWeight:
                                                      FontWeight.w900),
                                                ),
                                                NmeOfkeyMonth[j] =="img"?Image.asset(
                                                  "assets/image/${myEvents[NmeOfkeyMonth[j]][0]}",height: 200, fit: BoxFit.cover,):SizedBox(
                                                  height: myEvents[
                                                  NmeOfkeyMonth[
                                                  j]]
                                                      .length *
                                                      27.1,
                                                  width: 350,
                                                  //color: Color.fromARGB(255, 18, 222, 28),
                                                  // child: Text("Hii is am event"),
                                                  child: ListView.builder(
                                                      itemCount: myEvents[
                                                      NmeOfkeyMonth[
                                                      j]]
                                                          .length,
                                                      //itemCount: myEvents['event'].length,
                                                      scrollDirection:
                                                      Axis.vertical,
                                                      itemBuilder: (c, i) {
                                                        //return Text("data");

                                                        return Text(
                                                            '${i + 1}. ${myEvents[NmeOfkeyMonth[j]][i]}',
                                                            style: const TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                color: Colors
                                                                    .deepOrange));
                                                      }),
                                                )
                                              ],
                                            ),
                                        ],
                                      ))
                                // child: Text('Event Title:   ${myEvents['event'][0]}'),
                              ),
                            ],
                          )),
                      Visibility(
                          visible: !istrue,
                          child: Container(
                            // height: 200,
                            // width: 300,

                            //child: Text(_listOfDayNote(_selectedDate!)[0]["event"]),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Column(
                                children:[
                                ElevatedButton.icon(

                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context, MaterialPageRoute(builder: (context) => const addNte()));
                                    setState((){});
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 30.0,
                                  ),
                                  label: const Text("Add note"),
                                ),
                                  ElevatedButton.icon(

                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => add_expense(month_name: _focusedDay)));
                                      setState((){});
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      size: 30.0,
                                    ),
                                    label: const Text("Add expense"),
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ]))
              //],
            );
          }));
        });
    //   ),
    // );
  }


  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    _tabController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
            children: [
              TableCalendar(
                rowHeight: 50,
                locale: "or_IN",
                firstDay: DateTime(2022),
                lastDay: DateTime(2024),
                focusedDay: _focusedDay,
                calendarFormat: CalendarFormat.month,
                availableGestures: AvailableGestures.horizontalSwipe,
                onDayLongPressed: (selectedDay, focusedDay) {
                    // Call `setState()` when updating the selected day
                    setState(() {
                      _showEventDialog();
                      //Entry the widget which open on the day selected
                      _selectedDate = selectedDay;
                      _focusedDay = focusedDay;
                    });
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDate, selectedDay)) {
                    // Call `setState()` when updating the selected day
                    setState(() {
                      //Entry the widget which open on the day selected
                      _selectedDate = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDate, day);
                },
                holidayPredicate: (date) {
                  var iio =
                  _listOfDayEvent(DateTime(date.year, date.month, date.day));
                  return isSameDay(
                      iio.length == 0 ? null : iio[0]["holydy"], date);
                },
                onPageChanged: (focusedDay) {
                  // No need to call `setState()` here
                  chooseYrReq = "ପର୍ବପର୍ବାଣୀ";
                  _focusedDay = focusedDay;
                  setState(() {});
                },
                eventLoader: _listOfDayEvent,
                calendarBuilders: CalendarBuilders(
                  headerTitleBuilder: (context, day) {
                    return SingleChildScrollView(
                      child: Container(
                        height: 70,
                        child: ListView(
                          // controller: _scrollController1,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 100,
                              decoration: const BoxDecoration(
                                  color: Colors.pink,
                                  shape: BoxShape.rectangle,
                                  border: Border.symmetric(
                                    vertical:
                                    BorderSide(color: Colors.black, width: 4),
                                  )),
                              child: Text(
                                dateFormatt.format(_focusedDay),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    wordSpacing: 1.4,
                                    letterSpacing: 1.9,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            ..._listOfDayEvents(DateFormat('yyyy-MMM')
                                .format(_focusedDay)
                                .toString())
                                .map((myEvents) => myEvents['img'] == null
                                ? const SizedBox(
                              height: 0,
                              width: 0,
                            )
                                : Container(
                                color: Colors.blue,
                                height: 50,
                                width: 70,
                                //decoration: BoxDecoration(),
                                child: ListView.builder(
                                  //  controller: _scrollController1,
                                  reverse: true,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: myEvents['img'].length,
                                  itemBuilder: (context, i) {
                                    // print(myEvents);
                                    return Image.asset(
                                      "assets/image/${myEvents["img"][i]}",height: 70,width: 70,fit: BoxFit.fill,);
                                  },
                                )))
                          ],
                        ),
                      ),
                    );
                  },
                  defaultBuilder: (context, day, focusedDay) {
                    var Date =
                    _listOfDayEvent(DateTime(day.year, day.month, day.day));
                    // print(iio);
                    return Date.length == 0
                        ? Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(2.0),
                      decoration: const BoxDecoration(color: Colors.black),
                      child: Text(
                        "${day.day}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decorationColor: Colors.black
                        ),
                      ),
                    )
                        : Date[0]["img"] == null
                        ? Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(2.0),
                        decoration: const BoxDecoration(color: Colors.black),
                        // height:30,
                        // width:50,
                        child:Text("${day.day}",textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 24,
                              decorationColor: Colors.white,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                    ): Image.asset("assets/image/${Date[0]["img"][0]}",height: 50,width:50,fit: BoxFit.fill,);
                  },
                  singleMarkerBuilder: (context, day, event) {
                    var holyimg = _listOfDayEvent(DateTime(day.year, day.month, day.day));

                    return holyimg[0]["holyimg"] == null
                        ? const SizedBox(
                      height: 0,
                      width: 0,
                    )
                        : Image.asset(
                      "assets/image/${holyimg[0]["holyimg"][0]}",
                      height: 20,
                      width: 20,
                    );

                  },
                ),

                calendarStyle: CalendarStyle(

                  tablePadding: const EdgeInsets.all(5),
                  outsideDaysVisible: false,
                  markersAlignment: Alignment.bottomLeft,
                  markerMargin: const EdgeInsets.all(0),
                  //markerSize: 10.0,
                  markersAnchor: 5.0,
                  tableBorder: TableBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  holidayDecoration: const BoxDecoration(color: Colors.red),
                  holidayTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                daysOfWeekHeight: 50,
                daysOfWeekStyle: DaysOfWeekStyle(
                    dowTextFormatter: ((date, locale) =>
                        DateFormat.EEEE(locale).format(date)),
                    weekdayStyle: const TextStyle(
                      // color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.visible),
                    weekendStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        textBaseline: TextBaseline.alphabetic),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow),
                        color: Colors.green[300])),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  headerMargin: EdgeInsets.all(0),
                  headerPadding: EdgeInsets.all(0),
                  leftChevronMargin: EdgeInsets.all(3.0),
                  leftChevronPadding: EdgeInsets.all(0),
                  rightChevronMargin: EdgeInsets.all(3.0),
                  rightChevronPadding: EdgeInsets.all(5.0),
                  // formatButtonShowsNext: true
                ),
              ),
              //Buttom of togle where you seen "ପର୍ବପର୍ବାଣୀ" "Good day for start" and "sun rise and set"
              Container(
                color: Colors.yellow,
                height: 50,
                child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    padding: const EdgeInsets.all(1),
                    indicatorWeight: 5.0,
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.purple,
                    labelStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,decorationColor: Colors.white),
                    tabs: const [
                      Tab(text: "ପର୍ବପର୍ବାଣୀ"),
                      Tab(text: "ସୁଭଦିନ"),
                      // Tab(text: "Ads"),
                      // Tab(text: "Ekadasi/purnima/amabasya"),
                      // Tab(text: "Income/expense"),
                      // Tab(text: "Ads"),
                ]),
                
              ),
        Container(
          height: _listOfDayEvents(
              DateFormat('yyyy-MMM').format(_focusedDay).toString()).length*90,
          color: Colors.red,
          child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        ..._listOfDayEvents(
                            DateFormat('yyyy-MMM').format(_focusedDay).toString())
                            .map((myEvents) => myEvents["ପର୍ବପର୍ବାଣୀ"] == null
                            ? const SizedBox(
                          //color: Colors.red,
                          height: 0,
                          width: 0,
                        )
                            : Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 20.0),
                              padding: const EdgeInsets.only(top: 20.0),
                              width: 50,
                              height: 70,
                              decoration: const BoxDecoration(
                                // borderRadius: BorderRadius.circular(5),
                                  color: Colors.black),
                              child: Text(
                                "${myEvents['ତାରିଖ']}",
                                style: const TextStyle(
                                  // backgroundColor: Colors.black,
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                    decoration:
                                    const BoxDecoration(color: Colors.black),
                                    height: 70,
                                    width:
                                    MediaQuery.of(context).size.width * 1 - 50,
                                    child: ListView.builder(
                                        padding: const EdgeInsets.all(10.0),
                                        //margin:EdgeInsets.only(bottom: 10.0)
                                        scrollDirection: Axis.horizontal,
                                        itemCount: myEvents["ପର୍ବପର୍ବାଣୀ"].length,
                                        itemBuilder: (context, i) {
                                          return Center(
                                            //color: Colors.red,
                                            child: Text(
                                              "${myEvents["ପର୍ବପର୍ବାଣୀ"][i]} ",
                                              style: TextStyle(
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  backgroundColor:
                                                  Cool[i] as Color),
                                              textAlign: TextAlign.center,
                                            ),
                                          );
                                        })),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            )
                          ],
                        )),
                      ],
                    ),
                    Column(
                      children: [
                        ..._listOfDayEvents(
                            DateFormat('yyyy-MMM').format(_focusedDay).toString())
                            .map((myEvents) => myEvents["ସୁଭଦିନ"] == null
                            ? const SizedBox(
                          //color: Colors.red,
                          height: 0,
                          width: 0,
                        )
                            : Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 20.0),
                              padding: const EdgeInsets.only(top: 20.0),
                              width: 50,
                              height: 70,
                              decoration: const BoxDecoration(
                                // borderRadius: BorderRadius.circular(5),
                                  color: Colors.black),
                              child: Text(
                                "${myEvents['ତାରିଖ']}",
                                style: const TextStyle(
                                  // backgroundColor: Colors.black,
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                    decoration:
                                    const BoxDecoration(color: Colors.black),
                                    height: 70,
                                    width:
                                    MediaQuery.of(context).size.width * 1 - 50,
                                    child: ListView.builder(
                                        padding: const EdgeInsets.all(10.0),
                                        //margin:EdgeInsets.only(bottom: 10.0)
                                        scrollDirection: Axis.horizontal,
                                        itemCount: myEvents["ସୁଭଦିନ"].length,
                                        itemBuilder: (context, i) {
                                          return Center(
                                            //color: Colors.red,
                                            child: Text(
                                              "${myEvents["ସୁଭଦିନ"][i]} ",
                                              style: TextStyle(
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  backgroundColor:
                                                  Cool[i] as Color),
                                              textAlign: TextAlign.center,
                                            ),
                                          );
                                        })),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            )
                          ],
                        )),
                      ],

                    ),
                    // Container(color: Colors.green,
                    // child: const Center(
                    //   child: Text("Ads Comming Soon....."),
                    // ),),
                    // Container(color: Colors.black12,),
                    // Container(color: Colors.deepPurpleAccent,),
                    // Container(color: Colors.green,)

              ]),
        )
        //
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       const SizedBox(
              //         width: 10,
              //       ),
              //       ElevatedButton(
              //         onPressed: () {
              //           setState(() {
              //             chooseYrReq = "ପର୍ବପର୍ବାଣୀ";
              //           });
              //         },
              //         child: const Text(
              //           "ପର୍ବପର୍ବାଣୀ",
              //           style: TextStyle(
              //               fontSize: 30.0, letterSpacing: 2.0, wordSpacing: 4.0),
              //         ),
              //       ),
              //       const SizedBox(
              //         width: 20,
              //       ),
              //       ElevatedButton(
              //           onPressed: () {
              //             setState(() {
              //               chooseYrReq = "ସୁଭଦିନ";
              //             });
              //           },
              //           child: const Text(
              //             "ସୁଭଦିନ",
              //             style: TextStyle(
              //                 fontSize: 30.0, letterSpacing: 2.0, wordSpacing: 4.0),
              //           )),
              //       const SizedBox(
              //         width: 20,
              //       ),
              //     ],
              //   ),
              // ),

//Alll requirement of the this of user has shown on bellow

            ],
          )
    );
  }
}