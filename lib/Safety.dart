import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'body.dart';
import 'VisualLineChart.dart';
import 'VisualLineChart2.dart';
import 'VisualLineChart3.dart';
import 'PerformanceMessage.dart';

class Safety extends StatefulWidget {
  const Safety({Key? key}) : super(key: key);

  @override
  State<Safety> createState() => _SafetyState();
}

class _SafetyState extends State<Safety> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Color(0X40F78BAA),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                Container(
                    margin: EdgeInsets.only(bottom: 50),
                    child: Center(child: Text("Safety", style: TextStyle(fontSize: 30, color: Colors.black), textAlign: TextAlign.center,))),
                Center(child: Text("76%", style: TextStyle(fontSize: 30, color: Colors.black), textAlign: TextAlign.center,)),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: SfLinearGauge(
                    axisTrackStyle: LinearAxisTrackStyle(color: Color.fromARGB(30, 0, 169, 181), thickness: 15),
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    barPointers: [LinearBarPointer(value: 76, color: Color(0XFFF78BAA), thickness: 10,),],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 50, right: 30, left: 30),
                    child: Hero(tag: "safety",
                        child: VisualLineChart3())),
                PerformanceMessage(message: "You did not drive while intoxicated!", col: Colors.green),
                PerformanceMessage(message: "You drove in inclement weather!", col: Colors.yellow),
                PerformanceMessage(message: "You did not drive the wrong way!", col: Colors.green)
              ],

            ),
          ),

        ],
      )
    );
  }
}
