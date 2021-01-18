import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:priceFuel/widgets/logo.widget.dart';
import 'package:priceFuel/widgets/submit-form.dart';
import 'package:priceFuel/widgets/success.widget.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Color _color = Colors.deepPurple;

  var _gasCrtl = new MoneyMaskedTextController();
  var _alcCrtl = new MoneyMaskedTextController();

  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar álcool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            _completed
                ? Success(
                    reset: reset,
                    result: _resultText,
                    color: _color,
                  )
                : SubmitForm(
                    gasCtrl: _gasCrtl,
                    alcCtrl: _alcCrtl,
                    busy: _busy,
                    submitFunc: calculate,
                  ),
          ],
        ),
      ),
    );
  }

  Future calculate() {
    double alc =
        double.parse(_alcCrtl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double gas =
        double.parse(_gasCrtl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;

    double res = alc / gas;

    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = "Compensa utilizar Gasolina";
        } else {
          _resultText = "Compensa utilizar Álcool";
        }

        _completed = true;
        _busy = false;
      });
    });
  }

  reset() {
    setState(() {
      _gasCrtl = new MoneyMaskedTextController();
      _alcCrtl = new MoneyMaskedTextController();

      _color = Colors.deepPurple;
      _completed = false;
      _busy = false;
    });
  }
}
