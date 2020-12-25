import 'package:flutter/material.dart';

class Info extends StatelessWidget {

  double bmi;
  Info(this.bmi);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Builder(builder: (context){
        if(bmi>2 && bmi<18.5){
          return Text("Underweight", style: TextStyle(fontSize: 40, color: Colors.white),);
        }else if(bmi>18.5 && bmi<25){
          return Text("Normal.", style: TextStyle(fontSize: 60, color: Colors.white),);
        }else if(bmi>25 && bmi<30){
          return Text("Overweight", style: TextStyle(fontSize: 40, color: Colors.white),);
        }else if(bmi>30 && bmi<35){
          return Text("Obese Class I", style: TextStyle(fontSize: 40, color: Colors.white),);
        }else if(bmi>35 && bmi<40){
          return Text("Obese Class II", style: TextStyle(fontSize: 40, color: Colors.white),);
        }else if(bmi>40){
          return Text("Obese Class III", style: TextStyle(fontSize: 40, color: Colors.white),);
        } else{
          return Text("No data");
        }
      }),
    );
  }
}
