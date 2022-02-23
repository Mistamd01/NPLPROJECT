// @dart=2.9
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:npl/welcome.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
     body: Stack(
       children: [
         new Container(
    constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/Assets/splash1.png"),
        fit: BoxFit.cover,
        )
      ),
         ),

         SingleChildScrollView(
    //You can use any widget
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
                     Text("We are created", style: TextStyle(color: Colors.white, fontSize: 30,),),
                     SizedBox(height: 10),
                      Text(" to establish a new culture that", style: TextStyle(color: Colors.white, fontSize: 15,)),
                      SizedBox(height: 5),
                       Text("  promote excellence in hardship", style: TextStyle(color: Colors.white, fontSize: 15,)),
                       SizedBox(height: 20),
                       Padding(
                         padding: const EdgeInsets.only(top: 30),
                         child: Container(
                           width:200,
                           child: TextButton(
                            style: TextButton.styleFrom(
                             shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18),
                                                                                        ),
                                              backgroundColor: Colors.white),
                                              
                                        
                           onPressed: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Welcome()));
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
