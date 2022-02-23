import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:npl/ambassadorthree.dart';
import 'package:npl/model/reg_model.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:npl/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'ambassadortwo.dart';
import 'camp.dart';
import 'homescreen.dart';



class AmbOne extends StatefulWidget {
  const AmbOne({Key? key}) : super(key: key);

  @override
  _AmbOneState createState() => _AmbOneState();
}

 
class _AmbOneState extends State<AmbOne> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

   void validate() {
    if (formkey.currentState!.validate()) {
      print("object");
    } else {
      print("not val");
    }
  }

 late RegModel _regModel;
TextEditingController firstNameController = new TextEditingController();
TextEditingController lastNameController = new TextEditingController();
TextEditingController stateOriginController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController stateResidenceController = new TextEditingController();
  TextEditingController abouteController = new TextEditingController();
  TextEditingController certificateController = new TextEditingController();
  TextEditingController motivationController = new TextEditingController();
   TextEditingController addressController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
       appBar: AppBar(
                backgroundColor: Colors.green[900],
                leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white,),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    })),
      
       body: SingleChildScrollView(
          
            child: Form(
              key: formkey,
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: <Widget>[
                  //SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                 
                      
                         
                          
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
             SizedBox(height: 17),
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
                             Text("PERSONAL DETAILS"),
                           ],
                         ),
                         SizedBox(height: 10),
                         TextFormField(
                           controller: firstNameController,
                            style: TextStyle(color: Colors.black),
                             cursorColor: Colors.black,
                             decoration: InputDecoration(
                                        labelText: "First name",
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
                  SizedBox(height: 15),



                           TextFormField(
                             
                             controller: lastNameController,
                          style: TextStyle(color: Colors.black),
                             cursorColor: Colors.black,
                             decoration: InputDecoration(
                                        labelText: "Last name",
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
                  SizedBox(height: 15),

                           TextFormField(
                             controller: emailController,
                            style: TextStyle(color: Colors.black),
                             cursorColor: Colors.black,
                             decoration: InputDecoration(
                                        labelText: "Email address",
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
                   SizedBox(height: 15),


   TextFormField(
     controller: phoneController,
                             style: TextStyle(color: Colors.black),
                             cursorColor: Colors.black,
                             decoration: InputDecoration(
                                        labelText: "Mobile number",
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
                  SizedBox(height: 15),

 TextFormField(
   controller: stateOriginController,
                           style: TextStyle(color: Colors.black),
                             cursorColor: Colors.black,
                             decoration: InputDecoration(
                                        labelText: "State of Origin",
                                        labelStyle: TextStyle(color: Colors.green),
                                      enabledBorder:
                                     OutlineInputBorder(borderSide: BorderSide(color: Colors.green), borderRadius: BorderRadius.circular(30)),
                                     focusedBorder: OutlineInputBorder(
                                       
                                     borderSide: BorderSide(
                                      // borderRadius: BorderRadius.circular(20)
                                     color: Colors.green,
                                     )),
                                    ),
                                  validator: (value) {
                                  if (value!.isEmpty) {
                                  return "Field required";
                                  } else {
                                  return null;
                              }}),
                  SizedBox(height: 15),

   TextFormField(
     controller: stateResidenceController,
                           style: TextStyle(color: Colors.black),
                             cursorColor: Colors.black,
                             decoration: InputDecoration(
                                        labelText: "State of resident",
                                        labelStyle: TextStyle(color: Colors.green),
                                      enabledBorder:
                                     OutlineInputBorder(borderSide: BorderSide(color: Colors.green), borderRadius: BorderRadius.circular(30)),
                                     focusedBorder: OutlineInputBorder(
                                       
                                     borderSide: BorderSide(
                                      // borderRadius: BorderRadius.circular(20)
                                     color: Colors.green,
                                     )),
                                    ),
                                  validator: (value) {
                                  if (value!.isEmpty) {
                                  return "Field required";
                                  } else {
                                  return null;
                              }}),
SizedBox(height: 15),
                                TextFormField(
   controller: addressController,
                           style: TextStyle(color: Colors.black),
                             cursorColor: Colors.black,
                             decoration: InputDecoration(
                                        labelText: "Addtess",
                                        labelStyle: TextStyle(color: Colors.green),
                                      enabledBorder:
                                     OutlineInputBorder(borderSide: BorderSide(color: Colors.green), borderRadius: BorderRadius.circular(30)),
                                     focusedBorder: OutlineInputBorder(
                                       
                                     borderSide: BorderSide(
                                      // borderRadius: BorderRadius.circular(20)
                                     color: Colors.green,
                                     )),
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
                            controller: certificateController,
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
                               controller: motivationController,
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
                             controller: abouteController,
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
                              }}),   ],
                     ),
                   ),

                 
                 
                  SizedBox(height: 10),
                  Center(
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        
                          borderRadius: BorderRadius.circular(20)
                          
                          ),
                      child: MaterialButton(
                        onPressed: () async {
  validate();
  
                            String firstname = firstNameController.text;
                            String lastName = lastNameController.text;
                            String phone = phoneController.text;
                            String email = emailController.text;
                            String stateOrigin = stateOriginController.text;
                            String stateResidence = stateResidenceController.text;
                            String motivation = motivationController.text;
                            String aboute = abouteController.text;
                            String certificate = certificateController.text;
                            String address = addressController.text;
        //       " motivation": motivation,
        // "certificate" : certificate,
        // "aboute" : aboute,

                            RegModel data =
                                await submitData(address, firstname, lastName, email, phone, stateResidence, stateOrigin,  motivation, aboute, certificate );

                            setState(() {
                              _regModel = data;
                                
                              
                            });
                           
                    
                        
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.green, fontSize: 25),
                        ),
                      shape: RoundedRectangleBorder(

                     borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.green)
                 ),
                        
                      ),
                    ),
                  ),
                   
//SizedBox(height:15),


                 Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                       decoration: BoxDecoration(
  
                                         color: Colors.white,
  
                                           borderRadius: BorderRadius.circular(10.0),
  
                                         
  
                                        ),
                       
                      height: 100,
                      
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                           Image.asset("lib/Assets/prize.png",
                                                width: 45,
                                                height: 45,
                                                fit: BoxFit.fill),

                           
                              Text(
                                                      "The prize is presented annually after a \ncareful metuculous and rigorous process\nthat begins with technical team of expert",
                                                      style:
                                                          TextStyle(color: Colors.black, fontSize: 15)),                           //         TextStyle(color: Colors.black)),
                        ],
                        ),
                      ),
                            



                 )
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
   // String name, 
    String email, 
    String phone, 
     String firstName,
    String lastName,
    String stateOrigin,
    String stateResidence,
   String certificate,
    String motivation,
    String aboute,
    String address
    ) async {

    String token = Provider.of<AuthProvider>(context, listen: false).token??'';
    print(token);
    http.Response response;
    response = await http.post(
      Uri.parse("https://app.fmysdenterprisetraining.com.ng/api/user/alp_register?token=${token}"),
      body: {
        "first_name": firstName,
        "last_name" : lastName,
        "state_origin" : stateOrigin,
        "email": email,
        "phone": phone,
        "state_residence": stateResidence,
        " motivation": motivation,
        "certificate" : certificate,
        "aboute" : aboute,
        "address" : address,
        

      });

  var data = response.body;
  print(data);
  
String responseString;
  
  if (response.statusCode == 200) {
    responseString = response.body;
    regModelFromJson(responseString);

// Fluttertoast.showToast(
//         msg:data,
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 10,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 70.0
//     );

showDialog(

                    context: context,
                    builder: (context) {

                      Widget okButton = TextButton(
                      child: Text("OK", style: TextStyle(color: Colors.black),),
                      onPressed: () {
                      Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AmbThree()));
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
