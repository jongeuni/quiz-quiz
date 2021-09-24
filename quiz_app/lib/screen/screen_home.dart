import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/api_adapter.dart';
import 'package:flutter_app/model/model_quiz.dart';
import 'package:flutter_app/screen/quiz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState()=> _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Quiz> quizs = [];
  bool isLoading = false;

  _fetchQuizs() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.parse('https://drf-quiz-test.herokuapp.com/quiz/3/'));
    if(response.statusCode == 200){
      setState(() {
        quizs = parseQuizs(utf8.decode(response.bodyBytes));
        isLoading = false;
      });
    } else {
      throw Exception('failed to load data');
    }
  }

  // List<Quiz> quizs = [
  //   Quiz.fromMap({
  //     'title': 'test',
  //     'candidates': ['a','b','c','d'],
  //     'answer':0
  //   }),
  //   Quiz.fromMap({
  //     'title': 'test',
  //     'candidates': ['a','b','c','d'],
  //     'answer':0
  //   }),
  //   Quiz.fromMap({
  //     'title': 'test',
  //     'candidates': ['a','b','c','d'],
  //     'answer':0
  //   }),
  // ];

CurvedNavigationBar buildCurvedNavigationBar(){
  return CurvedNavigationBar(
    index: 0,
    height: 50,
    backgroundColor: Colors.transparent,
    buttonBackgroundColor: Color(0XFFFFFF),
    color: Color(0xffF7E3EF),
    animationDuration: const Duration(milliseconds: 150),
    animationCurve: Curves.easeInOutQuart,
    onTap: (index){
    },
    items: [
      Icon(Icons.quiz, size: 24, color: Color(0xffD5CFF5)),
      Icon(Icons.account_box, size: 24, color: Color(0xffD5CFF5))
    ] 
    );
}

  @override
  Widget build(BuildContext){
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
        child: Scaffold(
          bottomNavigationBar: buildCurvedNavigationBar(),
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text('Quiz-quiz!'),
            backgroundColor: Color(0xffBDB2FF),
            leading: Container(),
          ),
          body:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                    'images/cat.jpg',
                    width: width *0.6
                ),
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.024),
              ),
              Text(
                'Quiz-Quiz',
                style: TextStyle(
                  fontSize: width *0.068,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '퀴즈를 풀기 전 안내사항입니다.\n퀴즈 풀기를 눌러주세요.',
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(width*0.04),
              ),
              _buildStep(width, '1. 랜덤으로 나오는 퀴즈 3개를 풀어보세요.'),
              _buildStep(width, '2. 문제를 잘 읽고 정답을 고른 뒤 다음 문제 버튼을 \n눌러주세요.'),
              _buildStep(width, '3. 세 문제를 다 풀 때까지 나갈 수 없습니다. 파이팅.'),
              Padding(
                padding: EdgeInsets.all(width * 0.03),
              ),
              Container(
                padding: EdgeInsets.only(left: width * 0.036),
                child: Center(
                  child: ButtonTheme(
                    minWidth: width * 0.8,
                    height: height * 0.05,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                        child: Text(
                          '지금 퀴즈 풀기',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xffBDB2FF)),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(
                                children: <Widget>[
                                  CircularProgressIndicator(),
                                  Padding(padding: EdgeInsets.only(left:width*0.036),
                                  ),
                                  Text('로딩 중....')
                                ],
                              ),
                          ));
                          _fetchQuizs().whenComplete(() {
                            return Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context) =>
                                  QuizScreen(
                                    quizs: quizs,
                                  ),
                            ),
                            );
                          });
                        },
                    ),
                  ),
                )
              )
            ],
          )
        ),
    );
  }

  

  Widget _buildStep(double width, String title){
    return Container(
      padding: EdgeInsets.fromLTRB(
        width * 0.048,
        width * 0.024,
        width *0.048,
        width*0.024,
      ),
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.check_box,
            size: width*0.04,
          ),
          Padding(
            padding: EdgeInsets.only(right: width * 0.024),
          ),
          Text(title),
        ],
      )
    );
  }
}

