
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home_screen.dart';


class QuizMainPage2 extends StatefulWidget {
  const QuizMainPage2({Key? key}): super(key: key);
  @override
  _QuizMainPageState2 createState() => _QuizMainPageState2();
}

class _QuizMainPageState2 extends State<QuizMainPage2> {
  
  
  final _valueList = ['동물','노래','영화','기타'];
  var _selectedValue = '기타';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Image.asset("images/sky.jpeg", width: 300),
        const Padding(padding: EdgeInsets.only(bottom: 10.0)),
        Container(
          padding: const EdgeInsets.only(left:10.0, right: 50.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffF7E3EF),
            
          ),
          child: DropdownButton(
          style: const TextStyle(color: Color(0xff9481A1)),

          elevation: 0,
          underline: Container(),
            borderRadius: BorderRadius.circular(10),
            dropdownColor: const Color(0xffF7E3EF),
            iconEnabledColor: const Color(0xffffffff),
            
    
            value: _selectedValue,
          
            items: _valueList.map((value){
              return DropdownMenuItem(
                value: value,
                child: Text(value),);
            },).toList(),
            onChanged: (value){
            setState(() {
              _selectedValue = value.toString();
            });
            
          },),
        ),
        
          ElevatedButton(
            child: const Text('퀴즈 풀러 가기',style: TextStyle(color: Color(0xff9481A1)),),
            style: ElevatedButton.styleFrom(primary: const Color(0xffF7E3EF)),
            onPressed: (){},)
      ],),)
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