import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CandWidget extends StatefulWidget{
  VoidCallback tap;

  String text;
  int index;
   double width;
   bool answerSate;

   CandWidget({this.tap, this.index, this.width, this.text, this.answerSate});
   _CandWidgetState createState() => _CandWidgetState();
}

class _CandWidgetState extends State<CandWidget>{
  @override
  Widget build(BuildContext context){
    return Container(
      width: widget.width *0.8,
      height: widget.width * 0.1,
      padding: EdgeInsets.fromLTRB(
          widget.width * 0.048,
          widget.width*0.024,
          widget.width*0.048,
          widget.width*0.024
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.deepPurple),
        color: widget.answerSate ? Colors.deepPurple:Colors.white, // 선택되었으면 보라색 선택되지 않았으면 흰색
      ),
      child: InkWell(
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.width*0.035,
            color: widget.answerSate ? Colors.white : Colors.black,
          ),
        ),
        onTap: (){
          setState(() {
            widget.tap();
            widget.answerSate=!widget.answerSate;
          });
        },
      ),
    );
  }
}