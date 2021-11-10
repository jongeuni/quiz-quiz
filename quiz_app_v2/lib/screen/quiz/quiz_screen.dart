import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
    return SafeArea(child: Text(_selectedValue)
    );
  }
}