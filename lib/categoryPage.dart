import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class CategoryPage extends StatefulWidget {
  @override
  _CategoryPage createState() => _CategoryPage();
}

class _CategoryPage extends State<CategoryPage> {
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
      onPressed: () => Navigator.pop(context),
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
      onPressed: () => Navigator.pop(context),
      child: const Text('Create Database !!!!!!!'),
    );
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
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.80,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Color(0xff232d37)
            ),
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 20.0, left: 20.0, top: 20, bottom: 20),
              child: LineChart(mainData()),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
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
      color: Color(0xff67727d),
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
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
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
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
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
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}