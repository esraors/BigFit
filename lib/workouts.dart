import 'package:big_fit_vize/stretch.dart';
import 'package:flutter/material.dart';

import 'abs.dart';
import 'arm.dart';
import 'back.dart';
import 'fullbody.dart';
import 'leg.dart';
class Workouts extends StatefulWidget {
  @override
  _WorkoutsState createState() {
    return _WorkoutsState();
  }

}

class _WorkoutsState extends State<Workouts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workouts'),
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
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              'yapmak istediğiniz antrenmanı seçin:',
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("photos/ABSS.jpg"),
              ),
              title: Text('ABS'),
              subtitle: Text('Karın Egzersizleri'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Abs()),
                );
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("photos/BACAK.jpg"),
              ),
              title: Text('LEG'),
              subtitle: Text('Bacak Egzersizleri'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Leg()),
                );
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("photos/FULL.jpg"),
              ),
              title: Text('FULL BODY'),
              subtitle: Text('Tüm Vücut Egzersizleri'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Fullbody()),
                );
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("photos/KOL.jpg"),
              ),
              title: Text('ARM'),
              subtitle: Text('Kol Egzersizleri'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Arm()),
                );
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("photos/BACK.jpg"),
              ),
              title: Text('Back'),
              subtitle: Text('Sırt Egzersizleri'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Back()),
                );
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("photos/ST KAPAK.jpg"),
              ),
              title: Text('Stretching'),
              subtitle: Text('Esneme Hareketleri'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Stretch()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}