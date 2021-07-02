import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState()=> _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext){
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Quiz-quiz!'),
            backgroundColor: Colors.deepPurple,
            leading: Container(),
          ),
          body:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(child: Image.asset('images/cat.jpg', width: width *0.8),)
            ],
          )
        ),
    );
  }
}