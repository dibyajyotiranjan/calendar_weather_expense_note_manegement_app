import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:odiacalendar2023/Screen/Note_Screen.dart';
import 'package:odiacalendar2023/Screen/calendar_Screen.dart';
import 'package:odiacalendar2023/Screen/expense_Screen.dart';
import 'package:odiacalendar2023/Screen/notification_page.dart';
import 'package:odiacalendar2023/Screen/weather.dart';
import "package:share_plus/share_plus.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
class MainPage extends StatefulWidget {
  var index;
  MainPage({this.index,super.key});

  @override
  State<MainPage> createState() => _MainPageState(index: index);
}

class _MainPageState extends State<MainPage> {
  notification noti = notification();
  var index;
  _MainPageState({this.index});
  var page = [
    const EventCalendarScreen(),
    weather(),
    const NoteApp(),
    Expanse(),
  ];
  var _page;
  @override
  void initState() {
    _page = index??0;
    getFromSharedPreference();
    // TODO: implement initState
    super.initState(

    );
    noti.initilizationSetting();
    noti.schduleNoti();
  }
  void getlocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      LocationPermission asked = await Geolocator.requestPermission();
      if (asked == LocationPermission.whileInUse) {
        Position currentPosition = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        await sharePrefLocation(currentPosition.latitude, currentPosition.longitude);
      }
    }
    setState(() {});
  }


  sharePrefLocation(latitude,longitude) async{
    var pref = await SharedPreferences.getInstance();
    pref.setString("latitude",latitude.toString());
    pref.setString("longitude", longitude.toString());
  }
  getFromSharedPreference() async{
    SharedPreferences.getInstance().then((value) {
      if (value.getString("latitude") == null ||
          value.getString("longitude") == null) {
        getlocation();
      }
    }
    );
    setState(() {

    });

  }


  Future<void> _launchInApp(String url) async {
    if (await canLaunch('https://play.google.com')) {
      final bool nativeAppLaunchSucceeded = await launch(
        'https://play.google.com/store/apps/details?id=com.OdishaApplication.odiacalendar',
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(
            'https://play.google.com/store/apps/details?id=com.OdishaApplication.odiacalendar',
            forceSafariVC: true);
      }
    }
  }

  Future<void> _launchMoreApp(String url) async {
    if (await canLaunch('https://play.google.com')) {
      final bool nativeAppLaunchSucceeded = await launch(
        'https://play.google.com/store/apps/developer?id=Odisha+Applicatipon',
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(
            'https://play.google.com/store/apps/developer?id=Odisha+Applicatipon',
            forceSafariVC: true);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              DrawerHeader(
                child: Image.asset("assets/icon/odia-calendar-2023.png"),
              ),
              ListTile(
                leading: const Icon(Icons.share_outlined),
                title: const Text("Share this app to your frinds"),
                onTap: () {
                  Share.share(
                      "https://play.google.com/store/apps/details?id=com.OdishaApplication.odiacalendar",
                      subject: "Odia Calendar");
                },
              ),
              ListTile(
                leading: const Icon(Icons.auto_awesome),
                title: const Text("Rate this app"),
                onTap: (() {
                  _launchInApp('com.OdishaApplication.odiacalendar');
                }),
              ),
              ListTile(
                leading: const Icon(Icons.grid_3x3),
                title: const Text("More App"),
                onTap: (() {
                  _launchMoreApp('com.OdishaApplication.odiacalendar');
                }),
              )
            ],
          ),
        ),
       bottomNavigationBar: BottomNavigationBar(


         items: const [

           BottomNavigationBarItem(icon: Icon(Icons.calendar_month, size: 30),label: "କାଲେଣ୍ଡର"),
           BottomNavigationBarItem(icon: Icon(Icons.cloud_sync_outlined, size: 30),label: "ପାଣିପାଗ"),
           BottomNavigationBarItem(icon: Icon(Icons.notes, size: 30),label: "ନୋଟ୍ସ ବାନାନ୍ତୁ"),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined, size: 30),label: "ଦୈନିକ ଖର୍ଚ୍ଚ"),
         ],
         currentIndex: _page,
         selectedItemColor: Colors.blue,
         iconSize: 20,
         backgroundColor: Colors.black,
         selectedIconTheme: const IconThemeData(color: Colors.green),
         selectedFontSize: 19,
         unselectedItemColor: Colors.black,
         unselectedLabelStyle: const TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 13),
         //showSelectedLabels: true,
         showUnselectedLabels: true,
         onTap: (index){
           _page = index;
           setState(() {

           });
         },
       ),

        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
              centerTitle: true,
              title: Text('ଓଡ଼ିଆ କାଲେଣ୍ଡର ୨୦୨୩'),
              pinned: true,
            ),

          ],
          body: SingleChildScrollView(
            child: Container(
              color: Colors.blueAccent,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[page[_page]],
                ),
              ),
            ),
          ),
        ));
  }
}
