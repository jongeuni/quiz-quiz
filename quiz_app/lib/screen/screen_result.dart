import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/model/model_quiz.dart';
import 'package:flutter_app/screen/screen_home.dart';

class ResultScreen extends StatelessWidget{
  List<int> answers;
  List<Quiz> quizs;
  ResultScreen({this.answers, this.quizs});
  @override
  Widget build(BuildContext context){
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    int score = 0;
    for(int i =0; i<quizs.length; i++){
      if(quizs[i].answer == answers[i]){
        score += 1;
      }
    }

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Quiz-quiz ✦‿✦'),
        backgroundColor: Color(0xffBDB2FF),
        leading: Container(),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xffBDB2FF)),
            color: Color(0xffBDB2FF),
          ),
          width: width * 0.9,
          height: height * 0.5,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: width * 0.048),
              ),
              Container(decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xffBDB2FF)),
                color: Colors.white,
              ),
              width: width *0.8,
              height: height * 0.3,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        0, width * 0.048, 0, width * 0.012),
                    child: Text(
                      '수고하셨습니다~',
                      style: TextStyle(
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ),
                  Text('당신의 점수는', style: TextStyle(
                    fontSize: width * 0.053, height: height * 0.003,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Text(
                    score.toString() + '/' + quizs.length.toString(),
                    style: TextStyle(
                      fontSize: width * 0.15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffA0C4FF),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(width * 0.012)
                  )
                ],
              ),
              ),
              // 홈으로 돌아가기 버튼
              Expanded(child: Container(),
              ),
              Container(
                padding: EdgeInsets.only(bottom: width * 0.048),
                child: ButtonTheme(
                  minWidth: width * 0.73,
                  height: height * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return HomeScreen();
                    }));
                  },
                  child: Text('홈으로 돌아가기',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold
                      ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                  ),
                ), 
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}