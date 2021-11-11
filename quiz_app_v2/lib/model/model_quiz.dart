class Quiz{
  String title;
  List<String> contents;
  int answer;
  String image;

  Quiz({required this.title, required this.contents, required this.answer, required this.image});

  Quiz.fromMap(Map<String, dynamic> map)
    : title = map['title'],
      contents = map['condidates'],
      answer = map['answer'],
      image = map['image'];

  Quiz.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      contents = json['contents'].toString().split('/'),
      answer = json['answer'],
      image = json['image'];
}