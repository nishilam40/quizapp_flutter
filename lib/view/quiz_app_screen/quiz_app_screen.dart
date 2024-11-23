import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

import 'package:quizapp_flutter/dummy_db.dart';
import 'package:quizapp_flutter/view/result_screen/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen ({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentquestionindex=0;
  int? selectedanswerindex;
  int corrceanswrindex=0;
  int rightanswercount=0;
  

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black,
     appBar: AppBar(backgroundColor: Colors.black,
     actions: [Text("1/10")],
     ),
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20),
       child: Column(
       children: [
          // Lottie.asset("assests/animations/Animation - 1731925029993.json"),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration( color: Colors.grey.shade900,borderRadius: BorderRadius.circular(15)),
              width: double.infinity,
              height: 100,
              alignment: Alignment.center,
              child:Stack(
                children: [
                 
                if(selectedanswerindex==
               Dummydb.questions[currentquestionindex]["answerIndex"])
               Align(
                alignment: Alignment.center,
         
                   child: Lottie.asset("assests/animations/Animation - 1731990252659.json"), 
               ),
               Align(
                alignment: Alignment.center,
                child: Text(
                    Dummydb.questions[currentquestionindex]["question"],
                    textAlign: TextAlign.center,
               
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                )),
                ]
              ),
            ),
          ),
        ),
                
             
        SizedBox(height: 20,),
        Column(
          children: List.generate(4, (optionIndex) => Padding(
            padding: const EdgeInsets.all(6),
            child: InkWell(
              onTap: () {
               if (selectedanswerindex==null);{
                  selectedanswerindex =optionIndex;
                  if(selectedanswerindex==Dummydb.questions[currentquestionindex]["answerIndex"]
                  ){
                    rightanswercount++;
                  }
                 
                  setState(() {
                    
                  });
                }
                
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color:getColor(optionIndex)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  
                    Expanded(
                      child: Text(Dummydb.questions[currentquestionindex]["options"][optionIndex],
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: Colors.white),),
                    ),Icon(Icons.circle_outlined,color: Colors.white,),
                  ],
                ),
                     
              ),
            ),
          )),
        ),
      
     
     
         if(selectedanswerindex != null)
          InkWell(
            onTap: () {
              if(currentquestionindex<Dummydb.questions.length-1){
                currentquestionindex++;
                 selectedanswerindex=null;
             
              setState(() {
               
                selectedanswerindex=null;
              });

              }
             else{
              Navigator.push(context, MaterialPageRoute(builder: (context,) =>ResultScreen(rightanswercount: rightanswercount,)));
             }
              
              
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade900
                
              ),
              alignment: Alignment.center,
              child: Text("Next",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
          ),
       ]
        )
     )
       );
     
    
  }
 Color getColor(int clickedIndex){
  if(selectedanswerindex !=null){
    if(Dummydb.questions[currentquestionindex]["answerIndex"]==clickedIndex){
      return Colors.green;
    }
  }
  if(selectedanswerindex == clickedIndex){
    if(selectedanswerindex==Dummydb.questions[currentquestionindex]["answerIndex"]){
     
      return Colors.green;
    }
    return Colors.red;
  }else{
    return Colors.grey.shade800;
  }
 }
 
 }