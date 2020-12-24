import 'dart:math';

import 'package:bmi_calculator/about.dart';
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
      bmi = ((weight / pow(height, 2)).toDouble());
      print(bmi);
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
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("BMI calculator"),
        actions: [
          IconButton(icon: Icon(Icons.account_box_outlined), 
              onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));
              }),
          Padding(padding: EdgeInsets.all(10),),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.pinkAccent, Colors.pinkAccent,Colors.purple[900],]
            )
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(30, 40, 30, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Weight",style: TextStyle(fontSize: 30, color: Colors.white),),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
                child: TextFormField(
                  style: TextStyle(color: Colors.white, decorationColor: Colors.white),
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
              Text("Height",style: TextStyle(fontSize: 30, color: Colors.white),),
              Row(
                children: [
                  //feet form
                  Container(
                    height: 80, width: 80,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
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
                      style: TextStyle(color: Colors.white),
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
              Padding(padding: EdgeInsets.all(20),),
              //Button
              Center(
                child: FlatButton(
                  splashColor: Colors.yellowAccent,
                  child: Icon(Icons.timeline_sharp, color: Colors.red,),
                  color: Colors.greenAccent,
                  onPressed: (){
                    height_change();
                  },
                ),
              ),
              //Result text
              Center(
                child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(bmi.toStringAsPrecision(3), style: TextStyle(fontSize: 50, color: Colors.white))
                ),
              ),
              Center(
                child: Builder(builder: (context){
                  if(bmi>2 && bmi<18.5){
                    return Text("Underweight", style: TextStyle(fontSize: 60, color: Colors.white),);
                  }else if(bmi>18.5 && bmi<25){
                    return Text("Normal.", style: TextStyle(fontSize: 60, color: Colors.white),);
                  }else if(bmi>25 && bmi<30){
                    return Text("Overweight", style: TextStyle(fontSize: 60, color: Colors.white),);
                  }else if(bmi>30 && bmi<35){
                    return Text("Obese Class I", style: TextStyle(fontSize: 60, color: Colors.white),);
                  }else if(bmi>35 && bmi<40){
                    return Text("Obese Class II", style: TextStyle(fontSize: 60, color: Colors.white),);
                  }else if(bmi>40){
                    return Text("Obese Class III", style: TextStyle(fontSize: 60, color: Colors.white),);
                  } else{
                    return Text("No data");
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
