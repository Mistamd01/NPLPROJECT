// @dart=2.9
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:npl/welcome.dart';
import 'package:npl/welcometwo.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
    body: Stack(
       children: [
         new Container(
    constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/Assets/splash2.png"),
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
                     Text("We encourage", style: TextStyle(color: Colors.white, fontSize: 30,),),
                     SizedBox(height: 10),
                      Text(" experiental knowledge sharing", style: TextStyle(color: Colors.white, fontSize: 15,)),
                      SizedBox(height: 5),
                       //Text(" promote excellence in hardship", style: TextStyle(color: Colors.white, fontSize: 15,)),
                       SizedBox(height: 20),
                       Padding(
                         padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
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
                          MaterialPageRoute(builder: (context) => WelcomeTwo()));
                         },
                         child: Text("NEXT",  style: TextStyle(color: Colors.green[900], fontSize: 25, fontWeight: FontWeight.bold)),
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
