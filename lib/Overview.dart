import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class User {
  String name;
  String score = "none";

  User(String this.name, double score) {
    this.score = score.toString();
  }
}

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
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

  @override
  void initState() {
    super.initState();
    setState(() {
      rank1.name = "Don";
    });
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
      if (_selectedIndex == 1) {
        Navigator.pushNamed(context, "Category");
      }
      else if (_selectedIndex == 2) {
        Navigator.pushNamed(context, "Setting");
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFE22925),
        title: new Text("State Farm"),
      ),
      body: SingleChildScrollView(
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