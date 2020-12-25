import 'dart:math';
import 'package:bmi_calculator/about.dart';
import 'package:bmi_calculator/info_widget.dart';
import 'package:bmi_calculator/title_widget.dart';
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
      backgroundColor: Colors.cyan,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Title_Widget(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    colors: [Color(0xff3A4166), Color(0xff080933)]
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
                          style: TextStyle(color: Colors.white, ),
                          decoration:
                          InputDecoration(
                            fillColor: Colors.white,
                              hintText: "type here",
                              labelText: "feet"),
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
                  ButtonTheme(
                    height: 50,
                    minWidth: 140,
                    child: Center(
                      child: RaisedButton(
                        splashColor: Colors.yellow,
                        child: Icon(Icons.timeline_sharp, color: Colors.white, size: 50,),
                        color: Colors.cyan,
                        onPressed: (){
                          height_change();
                        },
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(20),),
                  //Result text
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(bmi.toStringAsPrecision(3), style: TextStyle(fontSize: 50, color: Colors.white))
                      ),
                    ),
                  ),
                  Info(bmi),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
