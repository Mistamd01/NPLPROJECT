import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:npl/ambassadorone.dart';

import 'viewcampaign.dart';
import 'homescreen.dart';





class AmbThree extends StatefulWidget {
  const AmbThree({Key? key}) : super(key: key);

  @override
  _AmbThreeState createState() => _AmbThreeState();
}




class _AmbThreeState extends State<AmbThree> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
 
  
  




  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30,),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    })),
      //  appBar: AppBar(
      //           backgroundColor: Colors.green[900],
      //           leading: IconButton(
      //               icon: Icon(Icons.arrow_back, color: Colors.white,),
      //               onPressed: () {
      //                 Navigator.push(context,
      //                     MaterialPageRoute(builder: (context) => AmbOne()));
      //               })),
      
       body: SingleChildScrollView(
          
            child: Center(
              child: Column(
                children: [

                  SizedBox(height: 160),
                  Container(
                    child: Column(
                      children: <Widget>[
                                       Text("Thank you for Applying with NPL", style: TextStyle(color: Colors.black, fontSize: 27, fontWeight: FontWeight.bold)),
                                        SizedBox(height: 10),
                                         Text("We are currently Processing Your Application", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold ),)
                                     ],
                                     ),
                  ),

SizedBox(height: 70),
                  Container(
                  height: 300,
                                   decoration: BoxDecoration(
                                 
                 // color: Colors.green,
                                  
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    
                                    image: AssetImage("lib/Assets/done.png"),
                                  ),
                                ),
                              ),
              
              
                ])

                
                             
            ),
          ),
        
      

       bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(color: Colors.green[900],
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(20),
              //    topRight: Radius.circular(20)
              // ),
              boxShadow: [
                BoxShadow(
                 // offset: Offset(0, -15),
                 // blurRadius: 20,
                 // color: Colors.white,
                )
              ]),
          child: SafeArea(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      iconSize: 25,
                      onPressed: () {
                           Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomeScreen()));
                      },
                      icon: Icon(Icons.home),
                      color: Colors.white,
                      tooltip: 'Home'),
                  Text('Home',
                      style: TextStyle(color:  Colors.white, fontSize: 15)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      iconSize: 25,
                      onPressed: () {

                      },
                      icon: Icon(Icons.money_sharp),
                      color: Colors.white,
                      tooltip: 'My Funding'),
                  Text('My Funding',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      iconSize: 25,
                      onPressed: () {
                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Fetch()));
                      },
                      icon: Icon(Icons.person),
                      color: Colors.white,
                      tooltip: 'Profile'),
                  Text('My Profile',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ],
              ),
            ],
          )),
        )
    );

   
  }
   
}
