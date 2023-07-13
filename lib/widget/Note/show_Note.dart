import 'package:flutter/material.dart';
import 'package:odiacalendar2023/database/note_database.dart';

class notest extends StatefulWidget {
  int id;
  notest(this.id, {super.key});

  @override
  State<notest> createState() => _notestState(id);
}

class _notestState extends State<notest> {
  int id;
  _notestState(this.id);
  List<Map<String, dynamic>> notes = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllData();
  }

  void getAllData() async {
    notes = await DbHelper().fetchDataRow(id: id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Text(
          notes[0]["note_Title"],
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 44),
        ),
        Text(
          notes[0]["note_des"],
          textAlign: TextAlign.left,
        )
      ]),
    );
  }
}
