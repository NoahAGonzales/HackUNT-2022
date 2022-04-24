import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'body.dart';
import 'VisualLineChart.dart';
import 'VisualLineChart2.dart';
import 'VisualLineChart3.dart';
import 'PerformanceMessage.dart';

class Habits extends StatefulWidget {
  const Habits({Key? key}) : super(key: key);

  @override
  State<Habits> createState() => _Habits();
}

class _Habits extends State<Habits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Color(0X407E4CCB),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40,),
                  Container(
                      margin: EdgeInsets.only(bottom: 50),
                      child: Center(child: Text("Habits", style: TextStyle(fontSize: 30, color: Colors.black), textAlign: TextAlign.center,))),
                  Center(child: Text("76%", style: TextStyle(fontSize: 30, color: Colors.black), textAlign: TextAlign.center,)),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: SfLinearGauge(
                      axisTrackStyle: LinearAxisTrackStyle(color: Color.fromARGB(30, 0, 169, 181), thickness: 15),
                      minimum: 0,
                      maximum: 100,
                      showLabels: false,
                      showTicks: false,
                      barPointers: [LinearBarPointer(value: 76, color: Color(0XFF7E4CCB), thickness: 10,),],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 50, right: 30, left: 30),
                      child: Hero(tag: "habit",
                          child: VisualLineChart2())),
                  PerformanceMessage(message: "You floored it too much!", col: Colors.red),
                  PerformanceMessage(message: "You did not slam the breaks too much!", col: Colors.green),
                ],

              ),
            ),

          ],
        )
    );
  }
}
