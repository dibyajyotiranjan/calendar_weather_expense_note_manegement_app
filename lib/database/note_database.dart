import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  //var tableNme = "note_db.db";
  var noteTable = "note";
  var columnID = "note_id";
  var columnTitle = "note_Title";
  var columnDesc = "note_des";
  var Date = "date";

  //Expanse
  var expanseTable = "expense";
  var exp_columnID = "expense_id";
  var exp_category = "expanse_cat";
  var exp_title = "expanse_title";
  var exp_Desc = "expense_des";
  var exp_amt = "amount";
  var exp_date = "date";
  var exp_time = "time";
  var exp_month = "month";
  //expense*/

  Future<Database> openDB() async {
    var directory = await getApplicationDocumentsDirectory();
    await directory.create(recursive: true);
    var path = directory.path + "note_data.db";
    return await openDatabase(path, version: 2, onCreate: (db, version) async {
      await db.execute(
          "Create Table $noteTable ($columnID integer primary key autoincrement, $columnTitle text,$columnDesc text,$Date text)");
      await db.execute(
          "Create Table $expanseTable ($exp_columnID integer primary key autoincrement,$exp_month text,$exp_category text,$exp_title text,$exp_Desc text,$exp_amt integer,$exp_date text,$exp_time text)");
    });
  }

  void addDate(String title, String desc) async {
    var myDB = await openDB();
    String datet = DateTime.now().toString();
    myDB.insert(noteTable, {columnTitle: title, columnDesc: desc, Date: datet});
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    var myDB = await openDB();
    return myDB.query(noteTable);
  }

  Future<List<Map<String, dynamic>>> fetchDataRow({required int id}) async {
    var myDB = await openDB();
    return await myDB
        .query(noteTable, where: "$columnID =?", whereArgs: ["$id"]);
  }

  void update(int id, String title, String desc) async {
    var myDb = await openDB();
    myDb.update(noteTable, {columnTitle: title, columnDesc: desc},
        where: "$columnID =?", whereArgs: ["$id"]);
  }

  void delet() async {
    var myDB = await openDB();
    myDB.delete(noteTable);
  }

  void deletRow(int id) async {
    var myDB = await openDB();
    myDB.delete(noteTable, where: "$columnID =$id");
  }
  //Expanse all function of database SQFLite

  void addexpense(String month, String category, String title, String desc,
      int amount, String date, String time) async {
    var myDB = await openDB();
    await myDB.insert(expanseTable, {
      exp_month: month,
      exp_category: category,
      exp_title: title,
      exp_Desc: desc,
      exp_amt: amount,
      exp_date: date,
      exp_time: time
    });
  }

  Future<List<Map<String, dynamic>>> fetchexpense_month(String mon) async {
    var myDB = await openDB();
    return myDB.query(expanseTable, where: "$exp_month=?", whereArgs: ["$mon"]);
  }

  Future<List<Map<String, dynamic>>> fetch_all_expense() async {
    var myDB = await openDB();
    return myDB.query(expanseTable);
  }

  void update_expanse(int id, String month, String category, String title,
      String desc, int amount, String date, String time) async {
    var myDb = await openDB();
    myDb.update(
        expanseTable,
        {
          exp_month: month,
          exp_category: category,
          exp_title: title,
          exp_Desc: desc,
          exp_amt: amount,
          exp_date: date,
          exp_time: time
        },
        where: "$exp_columnID =?",
        whereArgs: ["$id"]);
  }

  void delet_expanse(int id) async {
    var myDB = await openDB();
    myDB.delete(expanseTable, where: "$exp_columnID =$id");
  }
}
