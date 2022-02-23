import 'package:flutter/material.dart';
import 'package:npl/donate_two.dart';
import 'package:npl/homescreen.dart';

class Succpay extends StatefulWidget {
  const Succpay({ Key? key }) : super(key: key);

  @override
  _SuccpayState createState() => _SuccpayState();
}

class _SuccpayState extends State<Succpay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
          
            child: Center(
              child: Column(
                children: [
 Stack(children: <Widget>[
                Container(
                    child: Image.asset(
                  'lib/Assets/e.png',
                  width: 1000,
                  fit: BoxFit.fitWidth,
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 5, 0, 0),
                      child: Expanded(
                        child: ClipRRect(
                            borderRadius: new BorderRadius.circular(0.0),
                            child: Image.asset(
                              'lib/Assets/what.png',
                              height: 165,
                              width: 165,
                            )),
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        iconSize: 30,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        })
                  ],
                ),
              ]),
                  //SizedBox(height: 160),
                 

SizedBox(height: 70),
                  Container(
                  height: 300,
                  width: 300,
                          child: Image.asset("lib/Assets/group22.png", height: 200, width:200),      
                                 
                 // color: Colors.green,
                                  
                                 
                              ),
              SizedBox(height: 20),

              Container(
                child: Text("Thank You", style: TextStyle(fontSize: 25))
              ),
              

 SizedBox(height: 33),
               Container(
                           width: 200,
                           child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18),
                                                                                        ),
                                              backgroundColor: Colors.green[900]),
                                        
                           onPressed: (){
                           Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                         },
                         child: Text("Back Home",  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                         ),
                       )
                ])

                
                             
            ),
          ),
        
      

       
            
         
     
      
    );
  }
}