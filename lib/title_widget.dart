import 'package:flutter/material.dart';

class Title_Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.cyan, Colors.cyan]
        )
      ),
      height: MediaQuery.of(context).size.height/4.5,
      width: MediaQuery.of(context).size.width,
      child: Center(child: Text("BMI calculator", style: TextStyle(fontSize: 45, color: Colors.white),)),
    );
  }
}
