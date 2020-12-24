import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlatButton(onPressed: (){
              Navigator.pop(context);
            }, child: Icon(Icons.arrow_back, color: Colors.red, size: 50,)),
            Text("Design and Developed by"),
            Text("Sazin Reshed Samin"),

          ],
        )
      ),
    );
  }
}
