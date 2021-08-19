import 'dart:convert';

import 'package:flutter_app/model/model_quiz.dart';

List<Quiz> parseQuizs(String responseBody){
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Quiz>((json)=>Quiz.fromJsosn(json)).toList();
}