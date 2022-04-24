import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackunt2022/main.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'body.dart';
import 'VisualLineChart.dart';
import 'VisualLineChart2.dart';
import 'VisualLineChart3.dart';
import 'package:hackunt2022/LeaderboardDatabaseAccess.dart';
import 'package:hackunt2022/LeaderboardEntry.dart';
import 'package:hive/hive.dart';
import 'dart:collection';
import 'package:location/location.dart';

var Nextpage;

class Overview extends StatefulWidget {
  final BuildContext context;
  const Overview({Key? key, required this.context}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override

  void initState() {
    super.initState();
    UsersBox?.put("Bryan", "90");
    UsersBox?.put("Richard", "88");
    UsersBox?.put("John", "84");
    UsersBox?.put("Amy", "82");
    UsersBox?.put("Noah", "9");
    UsersBox?.put("Ann", "89");
    UsersBox?.put("Kevin", "52");
    UsersBox?.put("Bob", "67");
    UsersBox?.put("Tim", "58");
    UsersBox?.put("Grace", "97");

    var loc = new Location();
    loc.onLocationChanged.listen((LocationData currentLocation) {
      print(currentLocation.toString());
    });

    // Set default values and populate the LB with users
    setLB();
    // Populate leaderboard on screen
    populateTable();
  }

  void setLB() {
    LBBox?.put(1, ["", "0"]);
    LBBox?.put(2, ["", "0"]);
    LBBox?.put(3, ["", "0"]);
    LBBox?.put(4, ["", "0"]);
    LBBox?.put(5, ["", "0"]);
    LBBox?.put(6, ["", "0"]);
    LBBox?.put(7, ["", "0"]);
    LBBox?.put(8, ["", "0"]);
    LBBox?.put(9, ["", "0"]);
    LBBox?.put(10, ["", "0"]);

    var users = UsersBox!.toMap();
    for (String user in users.keys) {
      users[user] = int.parse(users[user]);
    }

    // Sort Map key in ascending order
    final sortedUsers = SplayTreeMap<String, int>.from(
        users, (keys1, keys2) => users[keys2].compareTo(users[keys1]));

    int place = 1;

    for (String user in sortedUsers.keys) {
      LBBox?.put(place, [user, sortedUsers[user].toString() ]);
      place++;
      if (place == 11) {
        break;
      }
    }

  }

  void populateTable() {
    rank1.name = LBBox?.get(1)[0];
    rank1.score = LBBox?.get(1)[1];
    rank2.name = LBBox?.get(2)[0];
    rank2.score = LBBox?.get(2)[1];
    rank3.name = LBBox?.get(3)[0];
    rank3.score = LBBox?.get(3)[1];
    rank4.name = LBBox?.get(4)[0];
    rank4.score = LBBox?.get(4)[1];
    rank5.name = LBBox?.get(5)[0];
    rank5.score = LBBox?.get(5)[1];
    rank6.name = LBBox?.get(6)[0];
    rank6.score = LBBox?.get(6)[1];
    rank7.name = LBBox?.get(7)[0];
    rank7.score = LBBox?.get(7)[1];
    rank8.name = LBBox?.get(8)[0];
    rank8.score = LBBox?.get(8)[1];
    rank9.name = LBBox?.get(9)[0];
    rank9.score = LBBox?.get(9)[1];
    rank10.name = LBBox?.get(10)[0];
    rank10.score = LBBox?.get(10)[1];
  }

  void getLeaderboardEntries() async {
    List<LeaderboardEntry> entries = <LeaderboardEntry>[];
    entries = await LeaderboardDatabase.instance.readAllEntries();
    print(entries.toString());
    setState(() {
      rank1.name = "test";//entries[0].name;
      /*rank2.name = entries[1].name;
      rank3.name = entries[2].name;
      rank4.name = entries[3].name;
      rank5.name = entries[4].name;
      rank6.name = entries[5].name;
      rank7.name = entries[6].name;
      rank8.name = entries[7].name;
      rank9.name = entries[8].name;
      rank10.name = entries[9].name;
      rank1.score = entries[0].personScore.toString();
      rank2.score = entries[1].personScore.toString();
      rank3.score = entries[2].personScore.toString();
      rank4.score = entries[3].personScore.toString();
      rank5.score = entries[4].personScore.toString();
      rank6.score = entries[5].personScore.toString();
      rank7.score = entries[6].personScore.toString();
      rank8.score = entries[7].personScore.toString();
      rank9.score = entries[8].personScore.toString();
      rank10.score = entries[9].personScore.toString();*/
    });
    (widget.context as Element).markNeedsBuild();
    rebuildAllChildren(context);
    print("finished async call");
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }
    (context as Element).visitChildren(rebuild);
  }


  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //bodyList[_selectedIndex],

  Widget build(BuildContext context) {
    setState(() {
      Nextpage = context;
    });
    rebuildAllChildren(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFE22925),
        title: new Text("State Farm"),
      ),
      body: bodyList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFE22925),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

