import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BMIState();
  }
}

class BMIState extends State<BMI> {

  final TextEditingController _heightTextController = new TextEditingController();
  final TextEditingController _weightTextController = new TextEditingController();
  double _bmi = 0;
  void _calculate(){
    double h = double.parse(_heightTextController.text)/100;
    setState(() {
      _bmi = double.parse((double.parse(_weightTextController.text)/(h*h)).toStringAsFixed(1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "BMI",
      home: new Scaffold(
          backgroundColor: Colors.blueGrey[900],
          body: new ListView(
            padding: const EdgeInsets.all(4.0),
            children: <Widget>[
              new Padding(padding: const EdgeInsets.only(top: 50.0)),
              Image.asset(
                'images/bmilogo.png',
                height: 40.0,
                width: 60.0,
              ),

              new Padding(padding: const EdgeInsets.only(top: 30.0)),
              new Container(
                margin: const EdgeInsets.all(5.0),
                padding:const EdgeInsets.all(15.0),
                height: 250.0,
                color: Colors.blue[200],
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _heightTextController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'Height in CM',
                          hintText: 'eg: 165',
                          icon: new Icon(Icons.insert_chart)),
                    ),
                    new TextField(
                      controller: _weightTextController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'Weight in KG',
                          hintText: 'eg: 35',
                          icon: new Icon(Icons.line_weight)),
                    ),
                    new Padding(padding: const EdgeInsets.all(5.0)),
                    new RaisedButton(
                      color: Colors.blue[700],
                      onPressed: _calculate,
                      child: new Text(
                        "Calculate",
                        style: new TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20.0),
                      ),
                    ),
                    new Padding(padding: const EdgeInsets.all(10.0)),
                    new Text("Your BMI is $_bmi",style: TextStyle(color: Colors.lightBlue[700],fontWeight: FontWeight.w500,fontSize: 20.0),),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
