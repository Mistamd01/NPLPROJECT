import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:npl/ambassadorone.dart';
import 'package:http/http.dart' as http;

import 'ambassadorthree.dart';
import 'camp.dart';
import 'homescreen.dart';
import 'login.dart';
import 'model/reg_model.dart';


class AmbTwo extends StatefulWidget {
  const AmbTwo({Key? key}) : super(key: key);

  @override
  _AmbTwoState createState() => _AmbTwoState();
}




class _AmbTwoState extends State<AmbTwo> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
 
   late RegModel _regModel;
TextEditingController motivationController = new TextEditingController();
TextEditingController abouteController = new TextEditingController();
TextEditingController certificateController = new TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
       appBar: AppBar(
                backgroundColor: Colors.green[900],
                leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white,),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AmbOne()));
                    })),
      
       body: SingleChildScrollView(
          
            child: Form(
              key: formkey,
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: <Widget>[
                  //SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                 
                      
                         
                          
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                 Text("2022 Ambassadors", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 10),
                                   Text("Leadership Program", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold ),)
                               ],),
                              ),
                            ),
                          
                          ),
             SizedBox(height: 15),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20),
              //   child: Container(
              //     child: Column(
              //       children: [
              //         Text("PERSONAL DETAILS")
              //       ],
              //     ),
              //   ),
              // ),
                
                 
                   Padding(
                     padding: const EdgeInsets.all(40),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Step 2", style: TextStyle(fontSize: 20, ),),
                           ],
                         ),
                         SizedBox(height: 15),
                         TextFormField(
                            style: TextStyle(color: Colors.black),
                             cursorColor: Colors.black,
                             decoration: InputDecoration(
                                        labelText: "Certification",
                                        labelStyle: TextStyle(color: Colors.green,),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                             enabledBorder:
                                     OutlineInputBorder(borderSide: BorderSide(color: Colors.green), borderRadius: BorderRadius.circular(30)),
                                     //border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                                     focusedBorder: OutlineInputBorder(
                                     borderSide: BorderSide(
                                     color: Colors.green,
                                     ), borderRadius: BorderRadius.circular(30)),
                              ),


                                  validator: (value) {
                                  if (value!.isEmpty) {
                                  return "Field required";
                                  } else {
                                  return null;
                              }}),
                  SizedBox(height: 20),


Padding(
  padding: const EdgeInsets.fromLTRB(25, 0, 0, 5),
  child:   Text("Motivation"),
),
                           Container(
                            
                             child: TextFormField(
                               
                              style: TextStyle(color: Colors.black, height: 6),
                               cursorColor: Colors.black,
                               decoration: InputDecoration(
                                          labelText: "150 Words Motivation",
                                          labelStyle: TextStyle(color: Colors.green),

                              enabledBorder:
                                       OutlineInputBorder(borderSide: BorderSide(color: Colors.green), borderRadius: BorderRadius.circular(30)),
                                       focusedBorder: OutlineInputBorder(
                                       borderSide: BorderSide(
                                       color: Colors.green,
                                       )),
                                      ),
                                    validator: (value) {
                                    if (value!.isEmpty) {
                                    return "Field required";
                                    } else {
                                    return null;
                                }}),
                           ),
                  SizedBox(height: 15),



 Padding(
   padding: const EdgeInsets.fromLTRB(25, 0, 0, 5),
   child: Text("About ME"),
 ),
                           TextFormField(
                            style: TextStyle(color: Colors.black, height:6),
                             cursorColor: Colors.black,
                             decoration: InputDecoration(
                                        labelText: "About ME",
                                        labelStyle: TextStyle(color: Colors.green),

                                      enabledBorder:
                                     OutlineInputBorder(borderSide: BorderSide(color: Colors.green), borderRadius: BorderRadius.circular(30)),
                                     focusedBorder: OutlineInputBorder(
                                     borderSide: BorderSide(
                                     color: Colors.green,
                                     ), borderRadius: BorderRadius.circular(30)),
                                    ),
                                  validator: (value) {
                                  if (value!.isEmpty) {
                                  return "Field required";
                                  } else {
                                  return null;
                              }}),
                 


                     
               ],
                     ),
                   ),


                  SizedBox(height: 10),
                 
 Padding(
                   padding: const EdgeInsets.only(left: 70),
                   child: Center(
                     child: Row(
                       
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Center(
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                 color:  Colors.green,
                                  borderRadius: BorderRadius.circular(20)
                                  
                                  ),
                              child: MaterialButton(
                                onPressed: () async {
   
                                   
                                
                                 
                                },
                                child: Text(
                                  'Skip',
                                  style: TextStyle(color: Colors.white, fontSize: 25),
                                ),
                              shape: RoundedRectangleBorder(

                             borderRadius: BorderRadius.circular(15),
                            // side: BorderSide(color: Colors.white)
               ),
                                color: Colors.green,
                              ),
                            ),
                ),
                         ),

                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                 color:  Colors.green,
                                  borderRadius: BorderRadius.circular(20)
                                  
                                  ),
                              child: MaterialButton(
                                onPressed: () async {
    Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>  AmbThree()));
                                   
                                
                                 
                                },
                                child: Text(
                                  'Next',
                                  style: TextStyle(color: Colors.white, fontSize: 25),
                                ),
                              shape: RoundedRectangleBorder(

                             borderRadius: BorderRadius.circular(15),
                            // side: BorderSide(color: Colors.white)
               ),
                                color: Colors.green
                              ),
                            ),
                    ),
                ),
                       ],
                     ),
                   ),
                 
 ),

                            



               
                ],
            ),
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

  Future submitData(
    String certificate,
    String motivation,
    String aboute,
    //String address
    ) async {
  var response = await http.post(
      Uri.parse("https://app.fmysdenterprisetraining.com.ng/api/user/alp_register?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBwLmZteXNkZW50ZXJwcmlzZXRyYWluaW5nLmNvbS5uZ1wvYXBpXC9sb2dpbiIsImlhdCI6MTY0NTAzNjUxMywiZXhwIjoxNjQ1MDQwMTEzLCJuYmYiOjE2NDUwMzY1MTMsImp0aSI6ImFqN0FqTmp0Y21wTXJNR0wiLCJzdWIiOjEsInBydiI6ImViMzViMjUwYmMyNmVmOGFmODYyYWM3Yjg0NDU5OWQ1NzVlMTdlNWQifQ.KKpZrIEIwNcNilPE7iXh24zfIY3ufjRk9zx5frl37ao"),
      body: {
        "motivation": motivation,
        "certificate" : certificate,
        "aboute" : aboute,
      });

  var data = response.body;
  print(data);
  
String responseString;
  
  if (response.statusCode == 200) {
    responseString = response.body;
    regModelFromJson(responseString);


    
    showDialog(

                    context: context,
                    builder: (context) {

                      Widget okButton = TextButton(
                      child: Text("OK", style: TextStyle(color: Colors.black),),
                      onPressed: () {
                      Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AmbTwo()));
                      },
                      );
                      return AlertDialog(
                       content: Text( "Account created successfully", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                       // title: Text("updated successfully"),
                        
                         actions: [
                      okButton,
                     ],
                      );
                     });
        
    
  } else{

    
   //return null;
   Fluttertoast.showToast(
        msg:data,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 10,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 70.0
    );}
    
}

}

   

