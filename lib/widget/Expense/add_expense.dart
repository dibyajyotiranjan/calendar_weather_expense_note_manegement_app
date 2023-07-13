import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odiacalendar2023/Screen/index.dart';
import 'package:odiacalendar2023/database/note_database.dart';

class add_expense extends StatefulWidget {
  DateTime month_name;
  add_expense({required this.month_name, super.key});

  @override
  State<add_expense> createState() => _add_expenseState(month_name);
}

class _add_expenseState extends State<add_expense> {
  DateTime month_name;

  _add_expenseState(this.month_name);
  NumberFormat formatter = NumberFormat("00");
  var daa = DateFormat("yyyy:MMM:dd").format(DateTime.now());
  var dat;
  late DateFormat dateFormatt;

  String time = DateFormat('hh:mm a').format(
      DateTime.now()); // "${DateTime.now().hour}:${DateTime.now().minute}";
  bool isvisible = false;
  final title = TextEditingController();
  final desc = TextEditingController();
  final amount = TextEditingController();
  String cat = "Other";
  var col = Colors.red;
  @override
  void initState() {
    dateFormatt = new DateFormat.MMMM("or");
    // TODO: implement initState
    super.initState();
    category;
    daa=DateFormat("yyyy:MMMM:dd").format(DateTime(int.parse(formatter.format(month_name.year)),int.parse(formatter.format(month_name.month)),int.parse(formatter.format(month_name.day))));
  }
  List category=["Growsery","Bill Payment","Traveling","Other","Food eating"];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MainPage(index: 3,)));
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("Choose a Catagory (bill payment)"),
                trailing: const Icon(Icons.arrow_downward),
                onTap: () {
                  if (isvisible == false) {
                    isvisible = true;
                  } else {
                    isvisible = false;
                  }
                  setState(() {});
                },
              ),
              Visibility(
                visible: isvisible,
                child: SizedBox(
                  height: 80,
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: category.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .3,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            cat = category[index];
                            col = Colors.green;
                            isvisible=false;
                            setState(() {

                            });
                          },
                          child: Container(
                           color: col as Color,
                            child: Text(category[index]),
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(height: 40,),
              TextField(
                controller: title,
                decoration: InputDecoration(
                  hintText: "ହୋଇଥିବା ଟଙ୍କା ଖର୍ଚ୍ଚ ବିଶେରେ ସୂଚନା",
                  contentPadding: const EdgeInsets.only(left: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              TextField(

                controller: desc,
                decoration: InputDecoration(
                  hintText: "ଖର୍ଚ୍ଚ ହୋଇଥିବା ଟଙ୍କା ବିଶେରେ ସମ୍ପୂର୍ଣ୍ଣ ସୂଚନା",
                  contentPadding: const EdgeInsets.only(left: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              TextField(
                controller: amount,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter your spending amount",
                  contentPadding: const EdgeInsets.only(left: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              Row(
                children: [
                  Container(
                    width: 40,
                  ),
                  Container(
                    width: 30,
                    color: Colors.amber,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 200,

                    child: TextField(
                      // onTapOutside: (value) => InputDecoration(hintText: daa),
                      onTap: () {
                        showDatePicker(
                          useRootNavigator: false,
                            context: context,
                            initialDate: DateTime(int.parse(formatter.format(month_name.year)), int.parse(formatter.format(month_name.month)),int.parse(formatter.format(month_name.day))),
                            // initialEntryMode: DatePickerEntryMode.calendarOnly,
                            // initialDatePickerMode: DatePickerMode.day,
                           firstDate: DateTime(int.parse(formatter.format(month_name.year)),int.parse(formatter.format(month_name.month))),
                            //lastDate: DateTime(2023,12)
                            lastDate: DateTime(2023, int.parse(formatter.format(month_name.month+1)),00)
                            )
                            .then((value) {
                          dat = value.toString();
                          daa = DateFormat("yyyy:MMM:dd").format(value!);
                          setState(() {});
                        });
                      },
                      decoration: InputDecoration(hintText: daa.toString()),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      // onTapOutside: (value) => InputDecoration(hintText: daa),
                      onTap: () {
                        showTimePicker(
                            context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          time = value.toString().substring(10, 15);
                          setState(() {});
                        });
                      },
                      decoration: InputDecoration(
                        hintText: time,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70,),
              ElevatedButton(
                  onPressed: () {
                     DbHelper().addexpense(dateFormatt.format(month_name), cat,title.text.toString(), desc.text.toString(), int.parse(amount.text.toString()), daa.toString(), time.toString());
                     // print(DateTime(month_name.year,month_name.month));
                   setState(() {});
                  },
                  child: const Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}