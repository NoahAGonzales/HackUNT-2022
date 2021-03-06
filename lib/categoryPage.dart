import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hackunt2022/LeaderboardDatabaseAccess.dart';
import 'package:hackunt2022/LeaderboardEntry.dart';
import 'dart:math';

import 'package:sqflite/sqflite.dart';



class CategoryPage extends StatefulWidget {

  @override
  _CategoryPage createState() => _CategoryPage();
}

class _CategoryPage extends State<CategoryPage> {
  static String LBData = "";
  static bool NeedsUpdate = false;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Category Page',
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFFE22925),
          title: const Text ('State Farm'),
        ),
        body: Column(
          children: [
            Score(),
            Visual(),
            PerformanceMessage(message: "Your acceleration was rather aggressive!", eval: 3),
            EntryRandom(),
            CreateDatabase(),
            FindMeStuff(context: context),
            FoundMeStuff(data: LBData, context: context),
          ],
        )
      )
    );
  }
}

class Visual extends StatefulWidget {
  @override
  _Visual createState() => _Visual();
}

class _Visual extends State<Visual> {
  @override
  Widget build (BuildContext context) {
    return Container(
      child: VisualLineChart()
    );
  }
}


class Score extends StatefulWidget {
  @override
  _Score createState() => _Score();
}

class _Score extends State<Score> {
  @override
  Widget build (BuildContext context) {
    return Row(
      children: [
        Text(
          '89',
          style: TextStyle(
            fontSize: 40
          )
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            '%',
            style: TextStyle(
              fontSize: 10
            )
          ),
        )
      ],
    );
  }
}

//-------------------------------------------------

class EntryRandom extends StatefulWidget {
  @override
  EntryRandomState createState() => EntryRandomState();
}

class EntryRandomState extends State<EntryRandom> {
  @override
  Widget build (BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.deepOrange),
      ),
      onPressed: () => addEntry(),
      child: const Text('Test'),
    );
  }
}


class CreateDatabase extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.deepOrange),
      ),
      onPressed: () => initDb(),
      child: const Text('Create Database !!!!!!!'),
    );
  }
}


Future initDb() async {
  await LeaderboardDatabase.instance;
}

Future addEntry() async {
  final entry = LeaderboardEntry(name: "name", leaderboardLocation: Random().nextInt(100), personScore: Random().nextInt(100));

  await LeaderboardDatabase.instance.create(entry);

}
//-----0------------------0-----=--=-

class FindMeStuff extends StatefulWidget {
  final BuildContext context;
  FindMeStuff({Key? key, required this.context}) : super(key: key);
  @override
  FindMeStuffState createState() => FindMeStuffState();
}

class FindMeStuffState extends State<FindMeStuff> {
  List<LeaderboardEntry> entries = <LeaderboardEntry>[];
  late String buttonText = "FIND ME SPIDERMAN!";
  @override
  Widget build (BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.deepOrange),
      ),
      onPressed: () => findStuff(),
      child: Text(buttonText),
    );
  }

  Future findStuff() async {
    entries = await LeaderboardDatabase.instance.readAllEntries();
    buttonText = entries[2].name + " | " + entries[2].leaderboardLocation.toString() + " | Size of list: " + entries.length.toString();

    setState(() {
      _CategoryPage.LBData = Random().nextInt(100).toString();
    });
    (widget.context as Element).markNeedsBuild();
  }
}

class FoundMeStuff extends StatelessWidget {
  String data = "Find Me Spiderman";
  BuildContext context;
  FoundMeStuff({Key? key, required this.data, required this.context }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Flexible(
            child: Text(data)
          )
        ],
    );
    (context as Element).markNeedsBuild();

  }
}


//---------------------------------------------------------------

class PerformanceMessage extends StatefulWidget {
  final String message;
  final int eval; // 0:"bad", 1:"ne" - Needs improvement, 2:"decent", 3:"good"
  const PerformanceMessage({Key? key, required this.message, required this.eval}) : super(key: key);
  final int color = 0;

  @override
  _PerformanceMessageState createState() => _PerformanceMessageState();
}

class _PerformanceMessageState extends State<PerformanceMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all( Radius.circular(18) ),
        color: Color(0x66000000),
      ),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      child: Row(
        children: [
          Container(),
          Flexible(
            child: Text(
              widget.message,
              style: TextStyle(
                fontSize: 20,
              ),
            )

          )
        ],
      )
    );
  }
}

// --------------------------------------------------------------


class VisualLineChart extends StatefulWidget {
  const VisualLineChart({Key? key}) : super(key: key);

  @override
  _VisualLineChartState createState() => _VisualLineChartState();
}

class _VisualLineChartState extends State<VisualLineChart> {
  List<Color> gradientColors = [
    const Color(0xFF008140),
    const Color(0xFF008140),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 2.5,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Color(0xFF008140)
            ),
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 0.0, left: 0.0, top: 0, bottom: 0),
              child: LineChart(mainData()),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xFF000000),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text = const Text('');
    switch (value.toInt()) {
      //case 0:
      //  text = const Text('-14', style: style);
      //  break;
      default:
        text = const Text('', style: style);
        break;
    }

    return Padding(child: text, padding: const EdgeInsets.only(top: 8.0));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xFF000000),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text = "";
    switch (value.toInt()) {
    //case 0:
    //  text = '0';
    //  break;
    //case 100:
    //  text = '100';
    //  break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        drawHorizontalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0x00000000),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0x00000000),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 30,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: false,
          border: Border.all(color: const Color(0xFF000000), width: 1)),
      minX: -14,
      maxX: 0,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(-14, 70),
            FlSpot(-13, 72),
            FlSpot(-12, 65),
            FlSpot(-11, 70),
            FlSpot(-10, 80),
            FlSpot(-9, 77),
            FlSpot(-8, 75),
            FlSpot(-7, 70),
            FlSpot(-6, 72),
            FlSpot(-5, 75),
            FlSpot(-4, 80),
            FlSpot(-3, 90),
            FlSpot(-2, 87),
            FlSpot(-1, 85),
            FlSpot(0, 70)
          ],
          isCurved: true,
          color: Color(0xFFFFFFFF),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: false,
            color: Color(0xFF008140),
          ),
        ),
      ],
    );
  }
}
