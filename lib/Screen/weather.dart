import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/weather.dart';




class weather extends StatefulWidget {
  @override
  State<weather> createState() => _weatherState();
}

class _weatherState extends State<weather> {
  late SharedPreferences pref;
  var latitude1,longitude1;
  String key = '90bf89b2ee342d49bf5901f70ef4c7ac';
  late WeatherFactory ws;
  List CurWeather = [];
  List day1 = [];
  List day2 = [];
  List day3 = [];
  List day4 = [];
  List day5 = [];
  List<Weather> curDAta = [];
  //double? lat, lon;
  late List day = [day1, day2, day3, day4, day5];
  @override
  void initState() {
    super.initState();
    getFromSharedPreference();
  }

  Map<String,dynamic> weat ={
    "few clouds":"ସାମାନ୍ୟ ବାଦଲ",
    "broken clouds":"ଭାସମାନ ବାଦଲ",
    "scattered clouds":"ଘୋରା ଘୋରା ପାଗ",
    "clear sky":"ନିର୍ମଳ ଆକାଶ",
    "light rain":"ସାମାନ୍ୟ ବର୍ଷା",
    "shower rain":"ଝିପିଝିପି ବର୍ଷା",
    "rain":"ପ୍ରବଳ ବର୍ଷା",
    "thunderstorm":"ଘଡଘଡି ବିଜୁଳି ବର୍ଷା",
    "snow":"ବହୁତ୍ ଥଣ୍ଡା ପାଗ",
    "mist":"କୁହୁଡି ଧୂଆଁ ଦଦେଖାଯିବ",
};

  void getlocation() async{
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      LocationPermission asked = await Geolocator.requestPermission();
      //print(asked);
      if (asked == LocationPermission.whileInUse) {
        Position currentPosition = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        await apiData(currentPosition.latitude.toString(),
            currentPosition.longitude.toString());
        await sharePrefLocation(currentPosition.latitude, currentPosition.longitude);

      }
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      await apiData(currentPosition.latitude.toString(),
          currentPosition.longitude.toString());
      await sharePrefLocation(currentPosition.latitude, currentPosition.longitude);
      //setState(() {});
    }

  }

  sharePrefLocation(latitude,longitude) async{
    pref = await SharedPreferences.getInstance();
    pref.setString("latitude",latitude.toString());
    pref.setString("longitude", longitude.toString());
    getFromSharedPreference();
  }
  getFromSharedPreference() async{
    SharedPreferences.getInstance().then((value) {
      if (value.getString("latitude") == null ||
          value.getString("longitude") == null) {
        getlocation();
      }else{
        latitude1 = value.getString("latitude");
        longitude1 = value.getString("longitude");
        apiData(value.getString("latitude"), value.getString("longitude"));

      }
    }

    );


  }

  apiData(lat, lon) async {
    var pob = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=90bf89b2ee342d49bf5901f70ef4c7ac');
    await get(pob).then((value) => setState((){
      CurWeather.add(jsonDecode(value.body));
    }));
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lon}&appid=90bf89b2ee342d49bf5901f70ef4c7ac');


    await get(url).then((val){
      setState(() {
        if (val.statusCode == 200) {
          // print(response.body);
          final data = jsonDecode(val.body);
          // print(DateTime.parse('2023-02-07'));
          int dibya = DateTime.now().day;
          //print(dibya);
          //print(data["list"][1]["dt_txt"]);

          for (var i = 0; i < 40; i++){
            if (dibya == DateTime.parse(data["list"][i]["dt_txt"]).day) {
              day1.add(data["list"][i]);
            } else if (dibya+1 == DateTime.parse(data["list"][i]["dt_txt"]).day) {
              day2.add(data["list"][i]);
            } else if (dibya+2 == DateTime.parse(data["list"][i]["dt_txt"]).day) {
              day3.add(data["list"][i]);
            } else if (dibya+3 == DateTime.parse(data["list"][i]["dt_txt"]).day) {
              day4.add(data["list"][i]);
            } else if (dibya+4 == DateTime.parse(data["list"][i]["dt_txt"]).day) {
              day5.add(data["list"][i]);
            }
            // weath.add(data.list[i]);
          }
          setState(() {});
          //print(weath);
        } else {
          print("Something Weint erong");
        }
      });
    });

    // print(response);

    //setState(() {});
  }

  // @override
  // didChangeDependencies() {
  //   var args = ModalRoute.of(context)?.settings.arguments as List?;
  //   day = args ?? [];
  //   setState(() {});
  //   getlocation();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height*1,
        child: Column(

            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
                Expanded(
                  flex: 4,
                  child:Container(
                    padding: const EdgeInsets.all(10),
                    // height: 250,
                    color: Colors.red[100],
                    // padding: EdgeInsets.only(left: 30, right: 30),
                    // margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                    child: CurWeather.length==0? const Center(child: Text("Loading..."),):Column(

                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("ବର୍ତ୍ତମାନର ପାଗ ବା ପାଣିପାଗ ର ସୂଚନା",style: TextStyle(color: Colors.blue,backgroundColor: Colors.black12,fontWeight: FontWeight.bold,fontSize: 27),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network('http://openweathermap.org/img/w/${CurWeather[0]["weather"][0]["icon"]}.png'),
                                  Text(
                                      "${(CurWeather[0]["main"]["temp"] - 273.15).toStringAsFixed(2).toString()} \u2103"), //CurWeather[0]["main"]["temp"]

                                ],
                              ),
                              Text(
                                CurWeather[0]["name"],
                                style: const TextStyle(
                                  letterSpacing: 2,
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                fontSize: 33,
                                fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Text(weat[CurWeather[0]["weather"][0][
                          "description"]], style: const TextStyle( fontWeight: FontWeight.bold,color: Colors.pink),), //CurWeather[0]["weather"][0]["description"]
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Text("ସୂର୍ଯ୍ୟୋଦୟ"),
                                  Text(DateFormat("hh.mm.ss a").format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          CurWeather[0]["sys"]["sunrise"] *
                                              1000,
                                          isUtc: false)),style: const TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 17),)
                                ],
                              ),
                              Column(
                                children: [
                                  const Text("ସୂର୍ଯ୍ୟାସ୍ତ"),
                                  Text(DateFormat("hh.mm.ss a").format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          CurWeather[0]["sys"]["sunset"] * 1000,
                                          isUtc: false)),style: const TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 17),)
                                ],
                              )
                            ],
                          )
                        ],
                      ),

                  ),
                ),
                Expanded(
                    flex: 9,
                    //height: 1050,
                    child: ListView.builder(
                        itemCount: day.length,
                        itemBuilder: (context, index) {
                          return Container(
                              width: 400,
                              height: 150,
                              margin: const EdgeInsets.only(bottom: 30),
                              color: Colors.green,
                              padding: const EdgeInsets.all(10),
                              child: day[index].length==0?const Center(child: Text("Loading..."),):Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(DateFormat("yyyy MMMM dd")
                                          .format(DateTime
                                          .fromMillisecondsSinceEpoch(
                                          day[index][0]["dt"] *
                                              1000,
                                          isUtc: false))
                                          .toString()
                                        //"Date:: ${DateFormat.yMMMMd().format(DateTime.parse(""))}"
                                      ),
                                      Text(DateFormat.EEEE("or").format(
                                          (DateTime
                                              .fromMillisecondsSinceEpoch(
                                              day[index][0]["dt"] * 1000,
                                              isUtc: false))),style: const TextStyle(color: Colors.white,backgroundColor: Colors.black, fontWeight: FontWeight.bold,fontSize: 17),)
                                    ],
                                  ),
                                  SizedBox(
                                    width: 400,
                                    height: 100,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: day[index].length,
                                      itemBuilder: (context, ind) {
                                        return Container(
                                          color: Colors.white,
                                          width: 130,
                                          margin: const EdgeInsets.only(
                                              right: 10, top: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(DateFormat("h a").format(
                                                  DateTime
                                                      .fromMillisecondsSinceEpoch(
                                                      day[index][ind]
                                                      ["dt"] *
                                                          1000,
                                                      isUtc: false))),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
                                                  Image.network('http://openweathermap.org/img/w/${day[index][ind]["weather"][0]["icon"]}.png'),
                                                  Text(
                                                      "${(day[index][ind]["main"]["temp"] - 273.15).toStringAsFixed(1).toString()} \u2103")
                                                ],
                                              ),
                                              Text(
                                                  weat[day[index][ind]["weather"][0]["description"]]??day[index][ind]["weather"][0]["description"],style: const TextStyle(overflow: TextOverflow.ellipsis,color: Colors.red,fontSize: 13),)
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ));
                        })),
              const SizedBox(
                height: 140,
              )
            ],
          ),
              ),
    );

  }
}
