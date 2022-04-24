import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'VisualLineChart.dart';
import 'VisualLineChart2.dart';
import 'VisualLineChart3.dart';
import 'Overview.dart';
import 'main.dart';
import 'package:hive_flutter/hive_flutter.dart';

class User {
  String name;
  String score = "none";

  User(String this.name, double score) {
    this.score = score.toString();
  }
}

double progressValue = 80;
int trips = 25;
int miles = 168;

User rank1 = new User("Bryan", 99);
User rank2 = new User("Bryan", 99);
User rank3 = new User("Bryan", 99);
User rank4 = new User("Bryan", 99);
User rank5 = new User("Bryan", 99);
User rank6 = new User("Bryan", 99);
User rank7 = new User("Bryan", 99);
User rank8 = new User("Bryan", 99);
User rank9 = new User("Bryan", 99);
User rank10 = new User("Bryan", 99);

var bodyList = [
  SingleChildScrollView(
    child: Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Color(0xFFE22925),
          height: 175,
          padding: EdgeInsets.only(top: 10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        showLabels: false,
                        showTicks: false,
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.2,
                          cornerStyle: CornerStyle.bothCurve,
                          color: Color.fromARGB(30, 0, 169, 181),
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        // ranges: <GaugeRange>[
                        //   GaugeRange(startValue: 0, endValue: 25,
                        //   color: Color(0XFFFF2E63), startWidth: .2,endWidth: .2),
                        //   GaugeRange(startValue: 25, endValue: 55,
                        //       color: Color(0XFF252A34), startWidth: .2,endWidth: .2),
                        //   GaugeRange(startValue: 55, endValue: 80,
                        //       color: Color(0XFF08D9D6), startWidth: .2,endWidth: .2),
                        //   GaugeRange(startValue: 80, endValue: 100,
                        //       color: Color.fromARGB(30, 0, 169, 181), startWidth: .2,endWidth: .2),
                        // ],
                        ranges: <GaugeRange>[ //Guage Ranges
                          GaugeRange(startValue: 0,endValue: 25, //start and end point of range
                              color: Color(0XFF7E4CCB), startWidth: 27,endWidth: 22
                          ),
                          GaugeRange(startValue: 25,endValue: 55,color: Color(0XFF008140),startWidth: 22,endWidth: 17),
                          GaugeRange(startValue: 55,endValue: 80,color: Color(0XFFF78BAA),startWidth: 17,endWidth: 12),
                          GaugeRange(startValue: 80,endValue: 100,color: Color.fromARGB(10, 0, 169, 181),startWidth: 2,endWidth: 2)
                          //add more Guage Range here
                        ],
                        pointers: <GaugePointer>[
                          // RangePointer(
                          //   value: progressValue,
                          //   cornerStyle: CornerStyle.bothCurve,
                          //   width: 0.2,
                          //   sizeUnit: GaugeSizeUnit.factor,
                          // ),
                          MarkerPointer(
                              value: progressValue,
                              markerHeight: 20,
                              markerWidth: 20,
                              markerType: MarkerType.circle,
                              color: Colors.white,
                              borderWidth: 2,
                              borderColor: Colors.black)
                        ],

                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            positionFactor: 0.1,
                            angle: 90,
                            widget: Text(
                              progressValue.toStringAsFixed(0) + '%',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ]
                    ),
                  ]
              ),
              Positioned(
                left: 40,
                child: Column(
                  children: [
                    Text(trips.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text('Trips',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 40,
                child: Column(
                  children: [
                    Text(miles.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text('Miles',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 5,
                child: Text("2-Week Driving Score",
                  style: TextStyle(
                    color: Colors.white,
                  ),),)
            ],
          ),
        ),
        Container(
            color: Color(0xFFE22925),
            padding: EdgeInsets.only(bottom: 5, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                    text: TextSpan(
                        children: [
                          WidgetSpan(
                              child: Icon(Icons.circle, color:Color(0XFF7E4CCB), size: 15)
                          ),
                          TextSpan(
                              text: " Habit",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
                          )
                        ]
                    )
                ),
                RichText(
                    text: TextSpan(
                        children: [
                          WidgetSpan(
                              child: Icon(Icons.circle, color:Color(0XFF008140), size: 15)
                          ),
                          TextSpan(
                              text: " Environment",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
                          )
                        ]
                    )
                ),
                RichText(
                    text: TextSpan(
                        children: [
                          WidgetSpan(
                              child: Icon(Icons.circle, color:Color(0XFFF78BAA), size: 15)
                          ),
                          TextSpan(
                              text: " Safety",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
                          )
                        ]
                    )
                ),
              ],
            )
        ),

        Container(
          margin: EdgeInsets.only(top:20, bottom:10, left: 20, right: 20),
          width: 350,
          height: 155,
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.discount),
                  title: Text('Applied Discount                  \$68.42'),
                  subtitle: Text('Discount From March 24, 2019 to April 24, 2022'),
                ),
                Divider(),
                TextButton(
                    child: Text('Details',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    onPressed: () {}
                )
              ],

            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          width: 310,
          child: Text("Leaderboard",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),

            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            width: 350,
            height: 200,
            child:ListView(
              children: [
                DataTable(
                    columns: [
                      DataColumn(label: Text('Rank',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:  FontWeight.w400,
                        ),
                      ),
                      ),
                      DataColumn(label: Text('Name',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:  FontWeight.w400,
                        ),
                      ),
                      ),
                      DataColumn(label: Text('Score',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:  FontWeight.w400,
                        ),
                      ),
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(
                          Text('1'),
                        ),
                        DataCell(
                          Text(rank1.name),
                        ),
                        DataCell(
                          Text(rank1.score),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text('2'),
                        ),
                        DataCell(
                          Text(rank2.name),
                        ),
                        DataCell(
                          Text(rank2.score),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text('3'),
                        ),
                        DataCell(
                          Text(rank3.name),
                        ),
                        DataCell(
                          Text(rank3.score),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text('4'),
                        ),
                        DataCell(
                          Text(rank4.name),
                        ),
                        DataCell(
                          Text(rank4.score),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text('5'),
                        ),
                        DataCell(
                          Text(rank5.name),
                        ),
                        DataCell(
                          Text(rank5.score),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text('6'),
                        ),
                        DataCell(
                          Text(rank6.name),
                        ),
                        DataCell(
                          Text(rank6.score),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text('7'),
                        ),
                        DataCell(
                          Text(rank7.name),
                        ),
                        DataCell(
                          Text(rank7.score),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text('8'),
                        ),
                        DataCell(
                          Text(rank8.name),
                        ),
                        DataCell(
                          Text(rank8.score),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text('9'),
                        ),
                        DataCell(
                          Text(rank9.name),
                        ),
                        DataCell(
                          Text(rank9.score),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text('10'),
                        ),
                        DataCell(
                          Text(rank10.name),
                        ),
                        DataCell(
                          Text(rank10.score),
                        ),
                      ]),
                    ]),
              ],
            )
        ),
      ],
    ),

  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,

    children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        width: double.infinity,
        height: 190,
        child: GestureDetector(
          onTap: (){Navigator.pushNamed(Nextpage, "Safety");},
          child: Card(
            color: Color(0X40F78BAA),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  child: Text("Safety", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20) ),),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Hero(tag: "safety",
                    child: VisualLineChart3())
                )
              ],
            ),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        width: double.infinity,
        height: 190,
        child: Card(
          color: Color(0X407E4CCB),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Text("Habits", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20) ),),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: VisualLineChart2()
              )
            ],
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        width: double.infinity,
        height: 190,
        child: Card(
          color: Color(0X40008140),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Text("Environment", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20), ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: VisualLineChart()
              )
            ],
          ),
        ),
      )
    ],
  ),
  Container(
    child: Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DataTable(
            columns: [
              DataColumn(label: Text('Setting',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight:  FontWeight.w400,
                ),
              ),
              ),
            ],
            rows: [
              DataRow(cells: [
                DataCell(
                    Text('Profile'))
                )
              ]
              ),
              DataRow(cells: [
                DataCell(
                    Text('Update Leadboard')
                )
              ]
              ),
              DataRow(cells: [
                DataCell(
                  Text('Logout'))
              ]
              )
            ]
        )
      ],
    ),
  )];
