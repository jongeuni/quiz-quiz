qize



> 괄호 시작 부분에서 엔터를 쳐주는 것 같다. 그리고 그 안에서 쉼표가 있을 때도 쉼표 뒤에서 엔터를 쳐준다.

사실 이제 쉼표를 언제쓰는지를모르겠다 그냥 괄호닫으면 쉼표찍나? 근데 왜 자동으로 안생겨



영상에서는 RaisedButton을 사용했는데 그건 이제 사용하지 않는다고 ElevatedButton을 쓰라고했따.





1

기존 main.dart 파일을 지운다 MyHome을 그대로 가져갈것이기때문home:은 우리가 따로 클래스를 만들것임 lib screen 폴더 안에 screen_hom.dart 파일을 만들것임

screen_home.dart

Stateful Widget으로 만들것임.

> Stateful Widget은?
>
> 변경 가능한 상태를 가진 Widget
>
> UI가 동적으로 변할 수 있는 경우 유용 (화면의 COUNT라는 상태가 더하기표시를 누를때마다 바뀐다.)
>
> flutter 앱내의 모든것들은 위젯으로 구성된다. 텍스트 버튼 그리고 스크린 레이아웃까지 전부 위젯이고 계층적인순서를가지고배열한다.
>
> 

> _ 은 위젯을 private으로 만드는ㄷ스. 해당 StatefulWidget에서만 인스턴스화 할 수 있도록 함.

```dart
class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState()=> _HomeScreenState();
}
```

이런식으로 선언을 해주고 그다음에는 _HomeScreenState를 만들것임.

```dart
class _HomeScreenState extends State<HomeScreen>{}
```

이상태에서 가장 기본적은 Widget build 함수를 선언해줌

```dart
class _HomeScreenState extends State<HomeScreen>{
    @override
    Widget build(BuildContext context){
        
    }
}
```

기기 크기와 상관없이 위젯의 크기나 비율이 일정하게 들어오도록 반응형 ui로 만들것임. 이러기위해서는 현재기기의 여러 상태정보를 알수있는 MediaQuery를 사용해야함 화면 크기나 화면 로테이션 여부 등의 정보를 가져올수있음. 여기선 크기 정보를 가지고 올 것임.

```dart
@override
    Widget build(BuildContext context){
     	Size screenSize = MediaQuery.of(context).size;
    }
```

size타입의 변수를 만듦 이제 이 변수로 너비와 높이를 알아낼것임.

```dart
@override
    Widget build(BuildContext context){
     	Size screenSize = MediaQuery.of(context).size;
        double width = screenSize.width;
        double height = screenSize.height;
    }
```

MediaQuery를 사용한다는것은 이후 높이 패딩 폰트 사이즈에 대해 상수를 쓰지 않고 width와 heigth에 곱하기를 한 상대수치를 사용한다는것임



SafeArea에 Scaffold를 넣는 형태로 화면을 구성하여 return 하겠다.

```dart
@override
Widget build(BuildContext context){
	...
    return SafeArea(
        child:scaffold(
            appBar:AppBoar(
                title: Text('text'),
                leading: Container(),
                ),
            ),
        );
    }
```

SafeArea는 상단 노티바 부분, 하단 영역을 침범하지 않는 안전한 영역을 잡아주는 위젯임

leading에 컨테이너를 비워놓았는데 앱 바 좌측에 있는 버튼을 지우는 효과가 있음 (페이지 이동시에 자동으로 생겨나는 뒤로가기 버튼 지우기.)

```dart
@override
Widget build(BuildContext context){
	...
    return SafeArea(
        child:scaffold(
            appBar:AppBoar(
                title: Text('text'),
                leading: Container(),
                ),
            body: Column( //--1s
                mainAxisAlignment: MainAxisAlignment.center,
            	crossAxisAlignment: CrossAxisAlignment.center,
            	children: <Widget>[
              	Center(
                	child: Image.asset(
                    	'images/cat.jpg',
                    	width: width *0.6
                	),
              	), // --1f
            )
            ),
        );
    }
```

body:는 Column을 넣고 children은 Widget에 Center child는 Image.asset을 넣겟다 여기에 퀴즈 이미지를 넣을것이다

이미지를 등록하기위해 pubspec.yaml파일을 열어 assets: 부분의 주석을 지우고 이미지를 등록해준다.



main.dart파일로 돌아와서 home: HomeScree()해준다.



```dart
class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext){
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Quiz-quiz!'),
            backgroundColor: Colors.deepPurple,
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
              Padding( // 3s
                padding: EdgeInsets.all(width * 0.024),
              ),
              Text(
                '퀴즈 앱',
                style: TextStyle(
                  fontSize: width *0.065,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '퀴즈를 풀기 전 안내사항입니다.\n꼼꼼히 읽고 퀴즈 풀기를 눌러주세요.',
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(width*0.048),
              ),
              _buildStep(width, '1. 랜덤으로 나오는 퀴즈 3개를 풀어보세요.'),
              _buildStep(width, '2. 문제를 잘 읽고 정답을 고른 뒤 다음 문제 버튼을 \n눌러주세요.'),
              _buildStep(width, '3. 만점을 향해 도전해보세요'),
              Padding(
                padding: EdgeInsets.all(width * 0.048),
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
                          backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                        ),
                        onPressed: (){},
                    ),
                  ),
                )
              )
            ],
          )
        ),
    );
  }
```

3s

패딩을 적용하고 밑에 텍스트를 넣어줌 (Text)

그 밑에  새로운 텍스트를 넣고 (Text) textAlign을 Center로 설정한다

또다시 패딩을 넣어준다.

하단에 안내사항을 따로 함수로 만들어준다.

안내사항 출력 함수는 Widget build 밖, HomeScreeState 클래스 내부에 만든다. 



```dart
Widget _buildStep(double width, String title){}
```

그리고 패딩을 적용한다.

```dart
Widget _buildStep(double width, String title){    return Container( // 1      padding: EdgeInsets.fromLTRB(        width * 0.048,        width * 0.024,        width *0.048,        width*0.024,      ), // 1f      child:Row(        crossAxisAlignment: CrossAxisAlignment.start,        children: <Widget>[          Icon(            Icons.check_box,            size: width*0.04,          ),          Padding(            padding: EdgeInsets.only(right: width * 0.024),          ),          Text(title),        ],      )    );  }
```

1

return Container에서 패딩을 적용한다. 패딩이 적용되었으면 child는 Row로 설정해주고 children은 체크박스 아이콘을 넣어주고 패딩도 적용해준다. <Widget>은뭔지 모르겠다. 패딩이 생각보다 중요한 것 같다. 패딩 잘못 설정하면 화면이 나가버린다. (패딩 하나 지웠더니 화면이 통채로 나갔었다 그리고 사진 크기가 안 맞아서 밑에 바 부분도 나갔었다. ) 마지막으로 텍스트에 title을 넣는다.

이렇게 _buildStap함수가 완성되었다. ?함수 앞에 _이거 넣는이유



이 buildStep함수로 `패딩 밑에 내용을 작성함. 

```dart
Padding(                padding: EdgeInsets.all(width*0.048),              ),              _buildStep(width, '1. 랜덤으로 나오는 퀴즈 3개를 풀어보세요.'),              _buildStep(width, '2. 문제를 잘 읽고 정답을 고른 뒤 다음 문제 버튼을 \n눌러주세요.'),              _buildStep(width, '3. 만점을 향해 도전해보세요'),              Padding(                padding: EdgeInsets.all(width * 0.048),              ),              Container( // 1                padding: EdgeInsets.only(left: width * 0.036),                child: Center(                  child: ButtonTheme(                    minWidth: width * 0.8,                    height: height * 0.05,                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),                    ),                    child: ElevatedButton( //2                        child: Text(                          '지금 퀴즈 풀기',                          style: TextStyle(color: Colors.white),                        ),                        style: ButtonStyle(                          backgroundColor: MaterialStateProperty.all(Colors.deepPurple),                        ),                        onPressed: (){},                    ),                  ),                )              )
```

화면비율을잘맞춰야하는데 백엔드를했어서 그런지 불편한것같다. 예를들면 설명문같은경우도 \n를 안써주면 자동으로 화면에 맞춰서 내려가는게 아니라 화면이 깨져버린다.

하단에 다시 패딩을 넣고 퀴즈 풀기 버튼을 만든다. 버튼 만드는 방식은 여러가지가있는데 ButtonTheme를 적용한다. 

1

컨테이너에 패딩을 넣고 child에 ButtonTeme를 높이/너비설정과함께선언한다. > Container란

shape도 설정해준다. <?

2

ButtonTheme의 child에 RaisedButton을 넣는다고 강의에선그러는데 RaisedButton이 이제 사용이 안되는 것 같아서ElvatedButton을 사용했다. << https://seizemymoment.tistory.com/44 다른점!

onPressed란?



