import 'package:flutter/material.dart';
import 'package:npl/homescreen.dart';
import 'package:npl/result.dart';

import 'elearning2.dart';

class LearnOne extends StatefulWidget {
  const LearnOne({ Key? key }) : super(key: key);

  @override
  _LearnOneState createState() => _LearnOneState();
}

class _LearnOneState extends State<LearnOne> {
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
      body: Container(


        child: Column(children: [
          SizedBox(height:70),

          Container(


            
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(210, 0, 0, 0),
                  child: GestureDetector(child: Text("Check Result",style: TextStyle(fontSize: 20),),
                  onTap: (){
                     Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Result()));
                  },
                  
                  ),
                ),
                IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.black,
                            ),
                            iconSize: 35,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Result()));
                            }),
              ],
            )
          ),

          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50,
              width: 1000,
              color: Colors.green[900],
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                child: GestureDetector(
                   onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => LearnTwo()));
                                  },
                  
                  child: Text("Select course", style: TextStyle(color: Colors.white, fontSize: 20),)),
              ),

            ),
          ),
//SizedBox(height:20),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Container(
              height: 300,
              width: 1000,
              color: Colors.blue,
             child: Image.asset("lib/Assets/lady.png", height: 150, width:150),      
                                   
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Container(
               decoration: BoxDecoration(
            border: Border.all(color: Colors.green)
          ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Text("National Leadership Dialogue", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                    Text("we recognize with profound gratitude, the tireless and heroic sacrifies of many Nigerians to build a great and dynamic economy, withing a free, democratic and noble economy", style: TextStyle(fontSize: 15),)
                  ],
                ),
              ),
            ),
          ),

//SizedBox(height: 20),
          
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green)
          ),
          height: 50,
          width: 1000,
          
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => LearnTwo()));
                                  },
                                  child: Padding(
                                   padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                                    child: Text(
                                      "View Course   --->",
                                      
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),

                                ),
             ],
           ),

        ),
      )





        ],),
      ),

    );
  }
}