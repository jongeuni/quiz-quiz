
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home_screen.dart';


class Chocie extends StatelessWidget {
  var _selectedValue = '기타';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(130.0),
        child: Center(
          child: Column(children: [
        DropdownButton<String>(icon: const Icon(Icons.arrow_downward),
        items: <String>['동물','노래','영화','기타'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
            
            );
        }).toList(),
        onChanged: (value){
          
        },
        )
      ],),),)
    
      //bottomNavigationBar: buildCurvedNavigationBar(),
    );
  }
}

class _MainPageState extends  State<HomeScreen>{
  final _valueList = [];
  var _selectedValue = '기타';
  @override 
  Widget build(BuildContext context){
    return Scaffold(
    );
  }
}