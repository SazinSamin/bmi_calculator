import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var weight = 0;
  var feet = 0;
  var inches = 0;
  var height = 0.0;
  var bmi = 0.0;

  height_change(){
    setState(() {
      height = (inches + (feet*12)) * 0.0254;
      print("Height in meter: $height m");
      bmi = weight / pow(height, 2);
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      height_change();
      //calculation();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text("BMI calculator"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.cyanAccent,
          padding: EdgeInsets.fromLTRB(30, 40, 30, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Weight"),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "type here", labelText: "Wight"),
                  onChanged: (val) {
                    setState(() {
                      weight = int.parse(val);
                    });
                  },
                  validator: (val){
                  },
                ),
              ),
              Text("new"),
              Row(
                children: [
                  //feet form
                  Container(
                    height: 80, width: 80,
                    child: TextFormField(
                      decoration:
                      InputDecoration(hintText: "type here", labelText: "feet"),
                      onChanged: (val) {
                        setState(() {
                          feet = int.parse(val);
                        });
                      },
                      validator: (val){
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(20),),
                  //inches form
                  Container(
                    height: 80, width: 80,
                    child: TextFormField(
                      decoration:
                      InputDecoration(hintText: "type here", labelText: "inches"),
                      onChanged: (val) {
                        setState(() {
                          inches = int.parse(val);
                        });
                      },
                      validator: (val){
                      },
                    ),
                  ),
                ],
              ),
              //Button
              FlatButton(
                child: Icon(Icons.timeline_sharp, color: Colors.white,),
                color: Colors.red,
                onPressed: (){
                  height_change();
                },
              ),
              //Result text
              Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(bmi!=null ? "Result" : bmi.toStringAsPrecision(3), style: TextStyle(fontSize: 50),)),
            ],
          ),
        ),
      ),
    );
  }
}
