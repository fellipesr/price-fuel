import 'package:flutter/material.dart';

import 'loading-button-widget.dart';

class Success extends StatelessWidget {
  var result = "";
  Color color = Colors.deepPurple;
  Function reset;

  Success({
    @required this.result,
    @required this.reset,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text(
            result,
            style: TextStyle(
              color: color,
              fontSize: 36,
              fontFamily: "Big Shoulders Display",
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          LoadingButton(
            color: color,
            busy: false,
            invert: true,
            func: reset,
            text: "CALCULAR NOVAMENTE",
          ),
        ],
      ),
    );
  }
}
