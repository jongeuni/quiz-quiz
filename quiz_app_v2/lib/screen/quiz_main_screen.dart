
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home_screen.dart';


class QuizMainPage extends StatefulWidget {
  const QuizMainPage({Key? key}): super(key: key);
  @override
  _QuizMainPageState createState() => _QuizMainPageState();
}

class _QuizMainPageState extends State<QuizMainPage> {
  
  
  final _valueList = ['동물','노래','영화','기타'];
  var _selectedValue = '기타';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          
          child: DropdownButton(
            elevation: 0,
            borderRadius: BorderRadius.circular(10),
            dropdownColor: const Color(0xffF7E3EF),
            iconEnabledColor: const Color(0xffF7E3EF),
            value: _selectedValue,
            items: _valueList.map((value){
              return DropdownMenuItem(
                value: value,
                child: Text(value),);
            },
          ).toList(),
          onChanged: (value){
            setState(() {
              _selectedValue = value.toString();
            });
            
          },)
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