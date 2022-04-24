import 'package:flutter/material.dart';

class PerformanceMessage extends StatefulWidget {
  final String message;
  final Color col; // 0:"bad", 1:"ne" - Needs improvement, 2:"decent", 3:"good"
  const PerformanceMessage({Key? key, required this.message, required this.col}) : super(key: key);
  final int color = 0;

  @override
  _PerformanceMessageState createState() => _PerformanceMessageState();
}

class _PerformanceMessageState extends State<PerformanceMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all( Radius.circular(18) ),
          color: widget.col,
        ),
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        margin: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
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