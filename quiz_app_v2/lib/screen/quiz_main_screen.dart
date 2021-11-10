
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home_screen.dart';
import 'package:flutter_application_1/screen/quiz/quiz_screen.dart';


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
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Image.asset("images/sky.jpeg", width: 300),
        const Padding(padding: EdgeInsets.only(bottom: 10.0)),
        Container(
          height: 39,
          width: 110,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffF7E3EF),),
          child: DropdownButton(
            isExpanded: true,
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
        const Padding(padding: EdgeInsets.only(bottom: 10.0),),
        Container(
          width: 200,
          height: 39,
          child: ElevatedButton(
            
            child: const Text('퀴즈 풀러 가기',style: TextStyle(color: Color(0xff9481A1)),),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffF7E3EF), 
              elevation: 0, 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> QuizScreen(_selectedValue))); // selected value 전달
            },),

        )
          
      ],),)
    );
  }
}