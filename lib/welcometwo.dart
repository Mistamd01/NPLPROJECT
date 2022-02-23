// @dart=2.9
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:npl/register.dart';
import 'package:npl/welcomeThree.dart';


class WelcomeTwo extends StatefulWidget {
  @override
  _WelcomeTwoState createState() => _WelcomeTwoState();
}

class _WelcomeTwoState extends State<WelcomeTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
     body: Stack(
       children: [
         new Container(
    constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/Assets/splash3.png"),
        fit: BoxFit.cover,
        )
      ),
         ),

         SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.only(top: 498),
      child: Column(
        children: <Widget>[
          Container(
            height: 360,
              decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/Assets/curve.png"),
        fit: BoxFit.cover,
        )
      ),
           child: Center(
             child: Padding(
               padding: const EdgeInsets.all(10),
               child: Padding(
                 padding: const EdgeInsets.fromLTRB(0,100, 0, 0),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("  We recognize", style: TextStyle(color: Colors.white, fontSize: 30,),),
                     SizedBox(height: 10),
                      Text("    outstanding act of leadership, based", style: TextStyle(color: Colors.white, fontSize: 15,)),
                      SizedBox(height: 5),
                       Text("    on a clearly defined Nigerian", style: TextStyle(color: Colors.white, fontSize: 15,)),
                      SizedBox(height: 5),
                       Text("    paradigm, at varoius levels of society,", style: TextStyle(color: Colors.white, fontSize: 15,)),
                      SizedBox(height: 5),
                       Text("    and human interest", style: TextStyle(color: Colors.white, fontSize: 15,)),
                      SizedBox(height: 5),
                       //Text(" promote excellence in hardship", style: TextStyle(color: Colors.white, fontSize: 15,)),
                       SizedBox(height: 10),
                       Padding(
                         padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                         child: Container(
                           width: 200,
                           child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18),
                                                                                        ),
                                              backgroundColor: Colors.white),
                                        
                           onPressed: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>WelcomeThree()));
                         },
                         child: Text("Get Started",  style: TextStyle(color: Colors.green[900], fontSize: 25, fontWeight: FontWeight.bold)),
                         ),
                       ))
                   ],
                 ),
               ),
               
             ),
           ),

           

           
          )
          ]
         )),
        ) 
       ]));
  }
}
