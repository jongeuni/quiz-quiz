import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/choice.dart';
import 'package:flutter_application_1/screen/mypage_screen.dart';

class HomeScreen extends StatefulWidget {
  //HomeScreen({Key key, this.title}):super(key:key);
  late String title;

  @override
  _State createState() => _State();
}

class _State extends State<HomeScreen> {
  final _valueList = ['동물','노래','영화','기타'];
  var _selectedValue = '기타';

  void _onTap(int index){
    print(index);
    setState((){
      _currentIndex = index;
    });
  }

  int _currentIndex = 0;
  final List<Widget> _children = [Chocie(),MyPage()];


  @override
  Widget build(BuildContext context) {
    print(_currentIndex);
    print(_children[_currentIndex].toString());
    return Scaffold(
      
      body: _children[_currentIndex],
       bottomNavigationBar: buildCurvedNavigationBar(),
    );
  }


CurvedNavigationBar buildCurvedNavigationBar(){
  return CurvedNavigationBar(
    index: 0,
    height: 50,
    backgroundColor: Colors.transparent,
    buttonBackgroundColor: Color(0XFFFFFF),
    color: Color(0xffF7E3EF),
    animationDuration: const Duration(milliseconds: 150),
    animationCurve: Curves.easeInOutQuart,
    onTap: _onTap,
    items: [
      Icon(Icons.quiz, size: 24, color: Color(0xffD5CFF5)),
      Icon(Icons.account_box, size: 24, color: Color(0xffD5CFF5))
    ] 
    );
}
  
}

class Navigation {
  
}