import 'package:flutter/material.dart';
import 'package:big_fit_vize/vki.dart';

class Nutrition extends StatefulWidget {
  @override
  _NutritionState createState() {
    return _NutritionState();
  }
}

class _NutritionState extends State<Nutrition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beslenme Hakkinda"),
      ),
      body: Column(
          children:<Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("photos/GENEL.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(6.0),
              decoration:BoxDecoration(
              ),
              child: Text("PROTEİN: Sedanter(hareketsiz insan) bir bireyde (kadin erkek) güncel kiloyu korumak ve ihtiyacı karşılamak için kilo başına 1-2 gr protein alınması gerekir."),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(6.0),
              decoration:BoxDecoration(
              ),
              child: Text("KARBONHİDRAT: Sedanter(hareketsiz insan) bir bireyde (kadin erkek) güncel kiloyu korumak ve ihtiyacı karşılamak için kilo başına 2-2,5 gr karbonhidrat alınması gerekir."),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(6.0),
              decoration:BoxDecoration(
              ),
              child: Text("YAĞ: Sedanter(hareketsiz insan) bir bireyde (kadin erkek) güncel kiloyu korumak ve ihtiyacı karşılamak için kilo başına 0,3-0,5 gr yağ alınması gerekir."),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VucutKitleIndeksi()),
                  );
                },
                child: Text('Vücut Kitle Indeksi Hesaplama'),
              ),
            ),
          ]
      ),
    );
  }
}