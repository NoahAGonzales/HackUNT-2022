import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class VisualLineChart3 extends StatefulWidget {
  const VisualLineChart3({Key? key}) : super(key: key);

  @override
  _VisualLineChartState3 createState() => _VisualLineChartState3();
}

class _VisualLineChartState3 extends State<VisualLineChart3> {
  List<Color> gradientColors = [
    const Color(0x00008140),
    const Color(0x00008140),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 2.5,
          child: Container(
            /*decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Color(0x00008140)
            ),*/
            //margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
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
        horizontalInterval: 10,
        verticalInterval: 3,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0XFFC8CFD2),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0XFFC8CFD2),
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

        border: Border.all(color: const Color(0XFFC8CFD2), width:3),),
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
          color: Color(0XFFF78BAA),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: Color(0X70F78BAA),
          ),
        ),
      ],
    );
  }
}