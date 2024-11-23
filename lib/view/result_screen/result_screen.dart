import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp_flutter/dummy_db.dart';
import 'package:quizapp_flutter/view/quiz_app_screen/quiz_app_screen.dart';
import 'package:share_plus/share_plus.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.rightanswercount});
  final int rightanswercount;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
   int starCount=0;
   
    
  
 
  
 

  @override
  // void initState() {
  //  calculatePrecentage();
  //   super.initState();
  // }
 

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      
        children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(3, (index) =>
           Padding(
             padding:  EdgeInsets.only(right: 15,left: 15,bottom: index == 1  ?40 : 0),
             child: Icon(Icons.star,
                       color: starCount > index ?Colors.yellow:Colors.grey,
                       size: index == 1 ? 70:40,
                       ),
           ))
         ),
         SizedBox(height: 40,),
         CachedNetworkImage(imageUrl: "",
         placeholder: (context, url) =>
         Lottie.asset("assests\animations\Animation - 1731990252659.json"), 
         ),

         Text("Congratulations",style: TextStyle(color: Colors.yellow,fontSize: 25,fontWeight: FontWeight.bold),),
         SizedBox(height: 40,),
         Text("Your Score",style: TextStyle(fontSize: 15,color: Colors.grey),),
          SizedBox(height: 10,),
          Text("${widget.rightanswercount}/${Dummydb.questions.length}",
          style: TextStyle(fontSize: 25,color: Colors.yellow,fontWeight: FontWeight.bold),),
          


         SizedBox(height: 60,),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            InkWell(
            onTap: () {
              Share.share("${widget.rightanswercount}/${Dummydb.questions.length}");
             
              
             },
              
              
            
            child: Container(
             width: 60,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
                
              ),
              alignment: Alignment.center,
              
              child: Icon(Icons.share),
             
              ),
            ),
         
            
            SizedBox(width: 20,),

          InkWell(
            onTap: () {
              Share.share("${widget.rightanswercount}/${Dummydb.questions.length}");
             
               Navigator.push(context, MaterialPageRoute(builder: (context,) =>QuizScreen()));
            // calculatePrecentage();
             },
              
              
            
            child: Container(
              width: 200,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
                
              ),
              alignment: Alignment.center,
              
              child: Text("Retry",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
              ),
            ),
          ),

         

        ],
      ),
        ]
      )
      );
    
//  Share.share("${widget.rightanswercount}/${Dummydb.questions.length}");

  }
  // calculatePrecentage() {
  //   var percentage = { rightanswercount/ Dummydb.questions.length} * 100;
  //  if(percentage>=90){
  //   starCount=3;
  //  }
  //  else if(percentage>=50){
  //   starCount=2;

  //  }
  //  else if(percentage>=30){
  //   starCount=1;

  //  }
  //  setState(() {
     
  //  });

  // } 
}