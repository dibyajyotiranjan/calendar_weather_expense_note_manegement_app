import 'package:flutter/material.dart';
import 'package:odiacalendar2023/Screen/index.dart';
import 'package:odiacalendar2023/database/note_database.dart';

class addNte extends StatefulWidget {
  const addNte({super.key});

  @override
  State<addNte> createState() => _addNteState();
}

class _addNteState extends State<addNte> {
  final text1 = TextEditingController();
  final text2 = TextEditingController();
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
                      const Text("ନୋଟ୍ର Title"),
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
                              hintText: "Title(ବିବରଣୀ) ଟାଇପ କରନ୍ତୁ ନୋଟ୍ ବିଶେୟରେ",
                              contentPadding: EdgeInsets.all(20.0)),
                        ),
                      ),
                      const Text("All About your Notes"),
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
                              hintText: "Describe(ସମ୍ପୂର୍ଣ୍ଣ ବିବରଣୀ) ଟାଇପ କରନ୍ତୁ ନୋଟ୍ ବିଶେୟରେ",
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
                              child: const Text("cancel")),
                          ElevatedButton(
                              onPressed: () {
                                DbHelper().addDate(
                                    text1.text.toString(), text2.text.toString());
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
