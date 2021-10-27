
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home_screen.dart';


class Chocie extends StatelessWidget {
  final _valueList = ['동물','노래','영화','기타'];
  var _selectedValue = '기타';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: DropdownButton(
            value: _selectedValue,
            items: _valueList.map((value){
              return DropdownMenuItem(
                value: value,
                child: Text(value),);
            },
          ).toList(),
          onChanged: (value){
          },)
    
      //bottomNavigationBar: buildCurvedNavigationBar(),
    )));
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