import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'body.dart';
import 'VisualLineChart.dart';
import 'VisualLineChart2.dart';
import 'VisualLineChart3.dart';
import 'PerformanceMessage.dart';

class Environment extends StatefulWidget {
  const Environment({Key? key}) : super(key: key);

  @override
  State<Environment> createState() => _Environment();
}

class _Environment extends State<Environment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Color(0X40008140),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40,),
                  Container(
                      margin: EdgeInsets.only(bottom: 50),
                      child: Center(child: Text("Environment", style: TextStyle(fontSize: 30, color: Colors.black), textAlign: TextAlign.center,))),
                  Center(child: Text("91%", style: TextStyle(fontSize: 30, color: Colors.black), textAlign: TextAlign.center,)),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: SfLinearGauge(
                      axisTrackStyle: LinearAxisTrackStyle(color: Color.fromARGB(30, 0, 169, 181), thickness: 15),
                      minimum: 0,
                      maximum: 100,
                      showLabels: false,
                      showTicks: false,
                      barPointers: [LinearBarPointer(value: 91, color: Color(0XFF008140), thickness: 10,),],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 50, right: 30, left: 30),
                      child: Hero(tag: "envir",
                          child: VisualLineChart())),
                  PerformanceMessage(message: "You did not wasted a lot of gas with unneccary acceleration!", col: Colors.green),
                  PerformanceMessage(message: "You did not take too many unnecessary trips!", col: Colors.green),
                ],

              ),
            ),

          ],
        )
    );
  }
}