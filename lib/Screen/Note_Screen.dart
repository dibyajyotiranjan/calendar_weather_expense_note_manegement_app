// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odiacalendar2023/Screen/index.dart';
import 'package:odiacalendar2023/database/note_database.dart';
import 'package:odiacalendar2023/widget/Note/add_Note.dart';
import 'package:odiacalendar2023/widget/Note/show_Note.dart';
import 'package:odiacalendar2023/widget/Note/update_note.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NoteApp extends StatefulWidget {
  const NoteApp({super.key});

  @override
  State<StatefulWidget> createState() => _NoteApp();
}

//const MyApp({super.key});
class _NoteApp extends State<NoteApp> {
  List<Map<String, dynamic>> notes = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllData();
  }

  var i = 0;
  void getAllData() async {
    notes = await DbHelper().fetchData();
    setState(() {});
  }

  delet(int id) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Are you sure to want delet"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("cancel")),
              TextButton(
                  onPressed: () {
                    DbHelper().deletRow(id);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainPage(index: 2,)));
                  },
                  child: const Text("Ok"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
            style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
                (state) => Colors.orange)),
                onPressed: (){
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const addNte()));
              setState(() {

              });
            }, child: const Text("'+' ନୋଟ Add କରନ୍ତୁ",style: TextStyle(color: Colors.white),)),
            /* It i s the notification of the text where you have set the notification of this nots */            // TextButton(onPressed: (){
            //   print(notes);
            // }, child: Text("Set Notification",style:TextStyle(color: Colors.white),)),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        StaggeredGridView.countBuilder(
          padding: const EdgeInsets.only(left: 13,right: 13),
            primary: true,
            physics: const ScrollPhysics(),
           // controller: ScrollController(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
        crossAxisCount: 4,
        itemCount: notes.length,
          itemBuilder: (context, index){
          return Container(
            color: Colors.red,
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(DateFormat('yyyy/MM/dd')
                          .format(DateTime.parse(notes[index]["date"])),style: const TextStyle(color: Colors.white),),
                      Text(DateFormat('hh:mm a')
                          .format(DateTime.parse(notes[index]["date"])),style: const TextStyle(color: Colors.white))
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => notest(notes[index]["note_id"])));
                    },
                    child: Column(
                      children: [
                        Text(
                          notes[index]["note_Title"],
                          textAlign: TextAlign.start,
                          style:
                          const TextStyle(fontWeight: FontWeight.bold,fontSize: 25,wordSpacing: 5.0,letterSpacing: 2.0),
                        ),
                        Text(
                          notes[index]["note_des"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white, fontSize: 17,wordSpacing: 3.0),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => updateNote(id:notes[index]["note_id"],title: notes[index]["note_Title"], desc: notes[index]["note_des"])));

                          },
                          child: const Icon(Icons.edit)),
                      InkWell(
                          onTap: () {
                            delet(notes[index]["note_id"]);
                          },
                          child: const Icon(Icons.delete)),
                    ],
                  )
                ]),
          );
          },
          staggeredTileBuilder: (int index) =>
          const StaggeredTile.fit(2),
      mainAxisSpacing: 14.0,
      crossAxisSpacing: 9.0
        ),
      ]
    );
  }
}
