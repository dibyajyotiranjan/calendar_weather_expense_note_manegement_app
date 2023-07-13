

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odiacalendar2023/widget/Expense/expense_month.dart';

class Expanse extends StatefulWidget {
  @override
  State<Expanse> createState() => _ExpanseState();
}

class _ExpanseState extends State<Expanse> with SingleTickerProviderStateMixin {
  late DateFormat dateFormatt;
  NumberFormat formatter = new NumberFormat("00");
  @override
  void initState() {
    // _tabController = TabController(length: 12, vsync: this);
    dateFormatt = new DateFormat.MMMM("or");
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*1,
      child: DefaultTabController(
        //initialIndex: 3,
          initialIndex: DateTime.now().month - 1,
          length: 12,
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: TabBar(

                  indicatorWeight: 3,
                    indicatorColor: Colors.black,
                    labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    isScrollable: true, tabs: [
                      Text(
                        dateFormatt.format(DateTime(2023, 01)),
                      ),
                      Text(
                        dateFormatt.format(DateTime(2023, 02)),
                      ),
                      Text(
                        dateFormatt.format(DateTime(2023, 03)),
                      ),
                      Text(
                        dateFormatt.format(DateTime(2023, 04)),
                      ),
                      Text(
                        dateFormatt.format(DateTime(2023, 05)),
                      ),
                      Text(
                        dateFormatt.format(DateTime(2023, 06)),
                      ),
                      Text(
                        dateFormatt.format(DateTime(2023, 07)),
                      ),
                      Text(
                        dateFormatt.format(DateTime(2023, 08)),
                      ),
                      Text(
                        dateFormatt.format(DateTime(2023, 09)),
                      ),
                      Text(
                        dateFormatt.format(DateTime(2023, 10)),
                      ),
                      Text(
                        dateFormatt.format(DateTime(2023, 11)),
                      ),
                      Text(
                        dateFormatt.format(DateTime(2023, 12)),
                      ),
                    ]),
              ),
              Expanded(
                child: TabBarView(children: [
                  expanseMonth(month: DateTime(2023, 01,int.parse(formatter.format(DateTime.now().day)))),
                  expanseMonth(month: DateTime(2023, 02,int.parse(formatter.format(DateTime.now().day)))),
                  expanseMonth(month: DateTime(2023, 03,int.parse(formatter.format(DateTime.now().day)))),
                  expanseMonth(month: DateTime(2023, 04,int.parse(formatter.format(DateTime.now().day)))),
                  expanseMonth(month: DateTime(2023, 05,int.parse(formatter.format(DateTime.now().day)))),
                  expanseMonth(month: DateTime(2023, 06,int.parse(formatter.format(DateTime.now().day)))),
                  expanseMonth(month: DateTime(2023, 07,int.parse(formatter.format(DateTime.now().day)))),
                  expanseMonth(month: DateTime(2023, 08,int.parse(formatter.format(DateTime.now().day)))),
                  expanseMonth(month: DateTime(2023, 09,int.parse(formatter.format(DateTime.now().day)))),
                  expanseMonth(month: DateTime(2023, 10,int.parse(formatter.format(DateTime.now().day)))),
                  expanseMonth(month: DateTime(2023, 11,int.parse(formatter.format(DateTime.now().day)))),
                  expanseMonth(month: DateTime(2023, 12,int.parse(formatter.format(DateTime.now().day)))),
                ]),
              ),
            ],
          ),


          ),
    );
  }
}
