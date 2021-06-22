import 'package:flutter/material.dart';

class Abs extends StatefulWidget {
  @override
  _AbsState createState() {
    return _AbsState();
  }
}
class _AbsState extends State<Abs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("photos/GENEL.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ListTile(
                title: Text("ABS WORKOUTS"),
                subtitle: Text(
                    "-CRUNCH                                                                         -AB BIKES                                                             -GARHAMMER RAISE                                                             -HIP THRUSTOR                                                             -SIDE PLANK"),
                leading: Icon(Icons.arrow_forward_ios_rounded), //başına ikon
              ),
              ListTile(
                title: Text("SQUEEZE YOUR ABS"),
                subtitle: Text("KNOW YOUR LIMITS"),
                trailing: Icon(Icons.auto_awesome), //sonuna ikon
              ),
              ListTile(
                title: Text("Music is a powerful force."),
                subtitle: Text("Listen some song for motivate yourself"),
                leading: Icon(Icons.water_damage_rounded), //başına ikon
                trailing: Icon(Icons.audiotrack), //sonuna ikon
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('Anasayfaya Dön'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
