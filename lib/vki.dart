import 'package:flutter/material.dart';

class VucutKitleIndeksi extends StatefulWidget {
  @override
  _VucutKitleIndeksiState createState() {
    return _VucutKitleIndeksiState();
  }
}

class _VucutKitleIndeksiState extends State<VucutKitleIndeksi> {
  double boy, kilo, vki;
  var _formKey = GlobalKey<FormState>();
  String sonuc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vücut Kitle İndeksi"),
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
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(border: Border.all()),
                margin: EdgeInsets.all(25),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) => validateSayi(value),
                  onSaved: (value) => boy = double.parse(value) / 100,
                  decoration: InputDecoration(
                    labelText: "Boyunuzu Giriniz. (cm)",
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                margin: EdgeInsets.all(25),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) => validateSayi(value),
                  onSaved: (value) => kilo = double.parse(value),
                  decoration: InputDecoration(
                    labelText: "Kilonuzu Giriniz. (kg)",
                  ),
                ),
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                child: Text("HESAPLA"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    print("$boy $kilo");
                    setState(() {
                      vkiHesapla();
                    });
                  }
                },
              ),
              vki != null
                  ? Text(
                "Vücut Kitle Indeksi:  $vki",
                style: TextStyle(fontSize: 24),
              )
                  : Text(
                "Lütfen değer Giriniz",
                style: TextStyle(fontSize: 24),
              ),
              sonuc != null
                  ? Text(
                "$sonuc",
                style: TextStyle(fontSize: 24),
              )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  void vkiHesapla() {
    vki = kilo / (boy * boy);
    vki = double.parse(vki.toStringAsFixed(2));
    if (vki < 18.5) {
      sonuc = "Zayıf";
    } else if (18.5 <= vki && vki < 25) {
      sonuc = "Normal Kilolu";
    } else if (25 <= vki && vki < 30) {
      sonuc = "Fazla Kilolu";
    } else if (30 <= vki && vki < 35) {
      sonuc = "1. Derece Obezite";
    } else if (35 <= vki && vki < 40) {
      sonuc = "2. Derece Obezite";
    } else if (40 <= vki && vki < 50) {
      sonuc = "3. Derece Obezite";
    } else if (50 <= vki && vki < 60) {
      sonuc = "Süper Süper Obezite";
    } else if (vki > 60) {
      sonuc = "Süper Süper Obezite";
    } else {
      sonuc = "hata!1";
    }
  }

  validateSayi(String value) {
    if (value.length < 1) return 'Geçersiz';
    try {
      double.parse(value);
    } catch (e) {
      return "Geçersiz";
    }
  }
}
