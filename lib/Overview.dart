import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'body.dart';
import 'package:hackunt2022/LeaderboardDatabaseAccess.dart';
import 'package:hackunt2022/LeaderboardEntry.dart';


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
    getLeaderboardEntries();
    //buttonText = entries[2].name + " | " + entries[2].leaderboardLocation.toString() + " | Size of list: " + entries.length.toString()

    print('end of initState');
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

