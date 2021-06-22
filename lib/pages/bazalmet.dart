import 'package:flutter/material.dart';

class BazalMet extends StatefulWidget {
  @override
  _BazalMetState createState() => _BazalMetState();
}
class _BazalMetState extends State<BazalMet> {

  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _bcontroller = TextEditingController();
  final TextEditingController _ccontroller = TextEditingController();
  double a = 0.0, b = 0.0, c = 0.0, result = 0.0;
  String bmr, eqn1, gdr1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.pinkAccent[200],
        accentColor: Colors.yellowAccent[200],
        fontFamily: 'Gochi Hand',
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('BMH HESAPLAMA'),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent[200],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("BMH Denklemleri:", style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Theme.of(context).accentColor
            ),),
            DropdownButton<String>(
              isExpanded: true,
              items: [
                DropdownMenuItem<String>(
                  child: Text('Mifflin-St Jeor Denklemi'),
                  value: 'Mifflin-St Jeor',
                ),
                DropdownMenuItem<String>(
                  child: Text('Harris-Benedict Denklemi'),
                  value: 'Harris-Benedict',
                ),
              ],
              onChanged: (String value) {
                setState(() {
                  eqn1 = value;
                });
              },
              value: eqn1,
              style: TextStyle(fontSize: 25),
            ),
            Text("Cinsiyet:", style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Theme.of(context).accentColor
            ),),
            DropdownButton<String>(
              isExpanded: true,
              items: [
                DropdownMenuItem<String>(
                  child: Text('Kadın'),
                  value: 'Kadın',
                ),
                DropdownMenuItem<String>(
                  child: Text('Erkek'),
                  value: 'Male',
                ),
              ],
              onChanged: (String value) {
                setState(() {
                  gdr1 = value;
                });
              },
              value: gdr1,
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Yaşınız",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _ccontroller,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Boyunuz(cm)",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _acontroller,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Kilonuz(kg)",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _bcontroller,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: RaisedButton(
                child: Text("HESAPLA"),
                onPressed: _onPress,
              ),
            ),
            Text("BMH BAZAL METABOLİZMA HIZINIZ: $bmr"),
          ],
        ),
      ),
    );
  }
  void _onPress() {
    setState(() {
      a = double.parse(_acontroller.text);
      b = double.parse(_bcontroller.text);
      c = double.parse(_ccontroller.text);
      if (eqn1 == 'Mifflin-St Jeor') {
        if (gdr1 == 'Kadın') {
          result = (10 * b) + (6.25 * a) - (5 * c) - 161;
        } else if (gdr1 == 'Erkek') {
          result = (10 * b) + (6.25 * a) - (5 * c) + 5;
        }
      } else if (eqn1 == 'Harris-Benedict') {
        if (gdr1 == 'Erkek') {
          result = ((13.75 * b) + (5.003 * a) - (6.755 * c) + 66.47);
        } else if (gdr1 == 'Kadın') {
          result = ((9.563 * b) + (1.85 * a) - (4.676 * c) + 655.1);
        }
      }
      bmr = format(result);
    });
  }
  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }
}