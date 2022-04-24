import 'package:flutter/material.dart';
import 'package:hackunt2022/Overview.dart';
import 'main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();

}




class _LoginPageState extends State<LoginPage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFE22925),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('lib/images/logo.jpg'),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Username",
                icon: Icon(Icons.person),
                enabledBorder: InputBorder.none,

              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
                icon: Icon(Icons.lock),
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 250,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Color(0XFFF44336),

              ),
              onPressed: () {
                Navigator.pushNamed(context, "Overview");
              },
              child: Text('Login'),
                ),
          )
        ],
      ),
    );
  }
}
