
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';


class QuizScreen extends StatefulWidget{
  const QuizScreen(this.selectedValue);
  final String selectedValue;
  @override
  _QuizScreenState createState() => _QuizScreenState(selectedValue);
}
class _QuizScreenState extends State<QuizScreen>{
  final String _selectedValue;
  _QuizScreenState(this._selectedValue);
  @override
  Widget build(BuildContext context){
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;


    return Container(
      //decoration: BorderRadius.circular(20),
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(0,width * 0.024, 0, width * 0.024),
          child: Text(
        'Q'+'질문입니당',
        style: TextStyle(
          fontSize: width * 0.05,
          fontWeight: FontWeight.bold,
        ),
      ),
        ),
        Container(
          width: width * 0.8, // ?
            padding: EdgeInsets.only(top: width * 0.012),
            child:  AutoSizeText(
              "quiz.title",
              textAlign: TextAlign.center,
              maxLines: 2, // ?
              style: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
            
        ),
        Expanded(child: Container(),),
        Column(children: _buildCandidates(width, _selectedValue),),
        Container(
          padding: EdgeInsets.all(width * 0.024),
          
        )
      ])
      
    
    );
   // return SafeArea(child: Text(_selectedValue));
  }
  List<Widget> _buildCandidates(double width, String value){
    List<Widget> children = [];
    for(int i = 0; i<4; i++){
      children.add(
        Text(value)
      );

    }
    return children;
  }

}