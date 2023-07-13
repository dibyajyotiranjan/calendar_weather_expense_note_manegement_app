import 'package:flutter/material.dart';
import 'package:odiacalendar2023/Screen/Note_Screen.dart';
import 'package:odiacalendar2023/Screen/index.dart';
import 'package:odiacalendar2023/database/note_database.dart';

class updateNote extends StatefulWidget {
  var id;
  var title;
  var desc;
  updateNote({required this.id,required this.title, required this.desc,super.key});

  @override
  State<updateNote> createState() => _updateState(id: id,title: title,desc: desc);
}

class _updateState extends State<updateNote> {
  var id;
  var title;
  var desc;

  _updateState({required this.id,required this.title, required this.desc});
  var text1 = TextEditingController();
  var text2 = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    text1 = new TextEditingController(text: title);
    text2 = new TextEditingController(text: desc);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MainPage(index: 2,)));
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text("Title of your note"),
                Container(
                  height: 100,
                  color: Colors.red,
                  child: TextField(
                    controller: text1,
                    cursorColor: Colors.white,
                    cursorWidth: 3.0,
                    cursorHeight: 32.0,
                    maxLines: 5,
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                        hintText: "Title of your Note",
                        contentPadding: EdgeInsets.all(20.0)),
                  ),
                ),
                const Text("note descreption"),
                Container(
                  height: 400,
                  color: Colors.blue,
                  child: TextField(
                    controller: text2,
                    autocorrect: true,
                    maxLines: 18,
                    cursorColor: Colors.white,
                    cursorWidth: 3.0,
                    cursorHeight: 22.0,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: "Decribe your note",
                        contentPadding: EdgeInsets.all(15)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          text1.text = "";
                          text2.text = "";
                        },
                        child: const Text("clear")),
                    ElevatedButton(
                        onPressed: () {
                          DbHelper().update(id, text1.text.toString(), text2.text.toString());
                          text1.text = "";
                          text2.text = "";
                        },
                        child: const Text("save")),
                  ],
                )
              ]),
        ),
      ),
    );

  }
}
