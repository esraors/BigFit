import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:big_fit_vize/pages/workouts.dart';
import 'package:big_fit_vize/pages/hakkinda.dart';
import 'package:big_fit_vize/pages/nutrition.dart';
import 'package:big_fit_vize/services/api.dart';
import 'package:big_fit_vize/services/firebase.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppHome(),
    );
  }
}

class MyAppHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppHomeState();
  }
}
  String dragDirection = '';
  String startDXPoint = '';
  String startDYPoint = '';
  String velocity = '';
  String distance = '';
class _MyAppHomeState extends State<MyAppHome> {
  @override
  Widget build(BuildContext context) {
    int rDeger=0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('BigFit'),
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("photos/GENEL.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Adınız:',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Adınızı giriniz',
                ),
                keyboardType: TextInputType.text,
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter
                ],
              ),
            ),
            Text(
              'Kilonuz: ',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Kilonuzu giriniz',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            RadioListTile(
                title: Text("Kadın"),
                value: 1,
                groupValue: rDeger,
                activeColor: Colors.blue,
                onChanged: (int veri){
                  setState(() {
                    rDeger=veri;
                  });
                }
            ),
            RadioListTile(
                title: Text("Erkek"),
                value: 2,
                groupValue: rDeger,
                activeColor: Colors.purple,
                onChanged: (int veri){
                  setState(() {
                    rDeger=veri;
                  });
                }
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Workouts()),
                  );
                },
                child: Text('Workouts'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Hakkinda()),
                  );
                },
                child: Text('Hakkında'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Nutrition()),
                  );
                },
                child: Text('Beslenme Hakkinda'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FiBa()),
                  );
                },
                child: Text('Firebase'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ApiEx()),
                  );
                },
                child: Text('Api'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}