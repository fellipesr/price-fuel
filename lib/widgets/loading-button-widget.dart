import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  Color color = Colors.deepPurple;
  var busy = false;
  var invert = false;
  Function func;
  var text = "";

  LoadingButton({
    @required this.busy,
    @required this.invert,
    @required this.func,
    @required this.text,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            height: 60,
            margin: EdgeInsets.all(30),
            width: double.infinity,
            decoration: BoxDecoration(
              color: invert ? color : Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(
                60,
              ),
            ),
            child: FlatButton(
              child: Text(
                text,
                style: TextStyle(
                  color: invert ? Colors.white : color,
                  fontSize: 24,
                  fontFamily: "Big Shoulders Display",
                ),
              ),
              onPressed: func,
            ),
          );
  }
}
