import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/model_quiz.dart';
import 'package:flutter_app/screen/screen_result.dart';
import 'package:flutter_app/widget/widget_candidate.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

@immutable
class QuizScreen extends StatefulWidget{
  List<Quiz> quizs;
  QuizScreen({this.quizs});
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

/*
class _main extends State<QuizScreen>{
  int _selecetdIndex = 0;

  List _selectedMenu = [
    Text('View 1'),
    Text('View 2'),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: buildCurvedNavigationBar(),
      body: Container(
        child: _selectedMenu.elementAt(_selecetdIndex),
        ),
    );
  }
}
*/

class _QuizScreenState extends State<QuizScreen>{
  int _selecetdIndex = 0;
  List _selectedMenu = [
    Text('View 1'),
    Text('View 2'),
  ];
  List<int> _answers = [-1,-1,-1];
  List<bool> _answerState = [false, false, false, false];
  int _currentIndex = 0;
  SwiperController _controller = SwiperController();

  @override
  Widget build(BuildContext context){
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return SafeArea(
      
      child: Scaffold(
      backgroundColor: Color(0xffBDB2FF),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xffBDB2FF)),
          ),
          width: width*0.8,
          height: height * 0.6,
          child: Swiper(
            controller: _controller,
            physics: NeverScrollableScrollPhysics(),
          loop: false,
          itemCount: widget.quizs.length,
          itemBuilder: (BuildContext context, int index){
            return _buildQuizCard(widget.quizs[index], width, height);
          },
          ),
        ),
        ),
      ),
    );
  }

  Widget _buildQuizCard(Quiz quiz, double width, double height){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
        color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0,width * 0.024, 0, width * 0.024),
            child: Text(
              'Q'+(_currentIndex +1).toString() + '.',
              style: TextStyle(
                fontSize: width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: width * 0.8, // ?
            padding: EdgeInsets.only(top: width * 0.012),
            child: AutoSizeText(
              quiz.title,
              textAlign: TextAlign.center,
              maxLines: 2, // ?
              style: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(child: Container(),),
          Column(children: _buildCandidates(width, quiz),
          ),
          Container(
            padding: EdgeInsets.all(width * 0.024),
            child: Center(
              child: ButtonTheme(
                minWidth: width * 0.5,
                height: height * 0.05,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: _currentIndex == widget.quizs.length-1
                      ? Text('결과보기')
                      : Text('다음문제'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffBDB2FF), // background
                    onPrimary: Colors.white, // text color
                  ),
                  onPressed: _answers[_currentIndex]==-1 ? null : (){
                    if (_currentIndex == widget.quizs.length-1){
                      Navigator.push(
                          context,MaterialPageRoute(builder: (context)=> ResultScreen(
                        answers: _answers,
                        quizs: widget.quizs,
                      ),
                      ),
                      );
                    } else{
                      _answerState=[false, false, false, false];
                      _currentIndex += 1;
                      _controller.next();
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );

  }

  List<Widget> _buildCandidates(double width, Quiz quiz){
    List<Widget> _children = [];
    for(int i = 0; i<4; i++){
      _children.add(
        CandWidget(
          index: i,
          text: quiz.candidates[i],
          width: width,
          answerSate: _answerState[i],
          tap: (){
            setState(() {
              for(int j = 0; j<4; j++){
                if(j==i){
                  _answerState[j] = true;
                  _answers[_currentIndex] = j;
                  //print(_answers[_currentIndex]);
                } else{
                  _answerState[j] = false;
                }
              }
            });
          },
        ),
      );
      _children.add(
        Padding(padding: EdgeInsets.all(width*0.024),
        ),
      );
    }
    return _children;
  }
}