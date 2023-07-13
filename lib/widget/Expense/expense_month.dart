import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odiacalendar2023/database/note_database.dart';
import 'package:odiacalendar2023/widget/Expense/add_expense.dart';
import 'package:odiacalendar2023/widget/Expense/all_trans.dart';

class expanseMonth extends StatefulWidget {
  DateTime month;
  expanseMonth({required this.month,super.key});

  @override
  State<expanseMonth> createState() => _expanseMonthState(month: month);
}

class _expanseMonthState extends State<expanseMonth> {
  DateTime month;
  var expn = 0;
  late DateFormat dateFormatt;
  _expanseMonthState({required this.month});
  List<Map<String,dynamic>> expanse_data_month = [];

  @override
  void initState() {
    dateFormatt = new DateFormat.MMMM("or");
    // TODO: implement initState
    super.initState();
    getall_expense();

  }
  getall_expense() async{
    expanse_data_month = await DbHelper().fetchexpense_month("${dateFormatt.format(month) }");

      for(var i=0;i < expanse_data_month.length;i++) {
         expn += int.parse(expanse_data_month[i]["amount"].toString());
      }



    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 7,
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => add_expense(month_name: month,)));
                      },
                      child: const Align(
                        heightFactor: 1.0,
                        widthFactor: 12.0,
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 20),
                            child: Text("+ ଖର୍ଚ୍ଚ add କରନ୍ତୁ",style:TextStyle(color: Colors.red,fontSize: 22, fontWeight: FontWeight.bold,backgroundColor: Colors.black),))
                      ),
                    )),
                Expanded(
                  flex: 9,
                  child: Container(
                    color: Colors.green,
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Center(
                        child: Text(
                          "${DateFormat.MMMM("or").format(month)} ମାସର ସମୂର୍ଣ୍ଣ ଖର୍ଚ୍ଚ ହେଉଛି \u{20B9} ${expn.toString()}",//${expanse_data_month[]}
                          style:
                          const TextStyle(fontSize: 43, fontWeight: FontWeight.bold),
                        )),
                  ),
                )
              ],
            )),
        Expanded(
            flex: 13,
            child: allTrans(expanse_data_month),
            ),
      ],
    );
  }
}
