import 'package:flutter/material.dart';
import 'package:quizapp_flutter/view/quiz_app_screen/quiz_app_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:QuizScreen() ,
    );
  }
}