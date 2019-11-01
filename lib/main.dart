import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

void main() => runApp(Bailador());

class Bailador extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Bailarin();
  }
}

class Bailarin extends State {
  AccelerometerEvent acelerometro;
  double alto, ancho;
  String imagen = 'images/bailarin_e.jpg';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Inflable bailarin'),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Container(
            child: Image.asset(
              imagen,
              height: 600,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        acelerometro = event;
        if (acelerometro.x < 1.2 && acelerometro.x > -1.3) {
          imagen = 'images/bailarin_e.jpg';
        } else if (acelerometro.x <= 1.2) {
          imagen = 'images/bailarin_izq.jpg';
        } else if (acelerometro.x >= 1.2) {
          imagen = 'images/bailarin_der.jpg';
        }
      });
    });
  }
}
