// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:npl/login.dart';
// import 'package:pin_entry_text_field/pin_entry_text_field.dart';
// //import 'package:email_auth/email_auth.dart';

// class Verifyemail extends StatefulWidget {
//   //const Verifyemail({Key? key}) : super(key: key);

//   @override

//   _VerifyemailState createState() => _VerifyemailState();
// }

// class _VerifyemailState extends State<Verifyemail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.green[900],
//         title: Text("Enter OTP sent to your Email"),
//       ),
//       body: Center(
//       // child: Text("Enter the otp sent to your email"),
      
//         child: Container(
          
//           padding: const EdgeInsets.all(8),
          
//           child: PinEntryTextField(
            
//               showFieldAsBox: true,
//               onSubmit: (String pin) {
//                 showDialog(

//                     context: context,
//                     builder: (context) {

//                       Widget okButton = TextButton(
//                   child: Text("CLICK OK", style: TextStyle(color: Colors.black),),
//                   onPressed: () {
//                      Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => LoginScreen()));
//                   },
//                    );
//                       return AlertDialog(

//                         title: Text("Verified"),
//                         //content: Text("pin entered is $pin"),
//                          actions: [
//                       okButton,
//                      ],
//                       );
//                     });
//               }),
//         ),
//       ),
      
//     );
//   }
// }


import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:npl/login.dart';
import 'package:npl/reg.dart';




class Verifyemail extends StatefulWidget {
  const Verifyemail({Key? key}) : super(key: key);

  @override
  _VerifyemailState createState() => _VerifyemailState();
}

class _VerifyemailState extends State<Verifyemail> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState!.validate()) {
      print("object");
    } else {
      print("not val");
    }
  }

   final TextEditingController otpController = TextEditingController();
   final TextEditingController emailController = TextEditingController();


Future ResetPassword() async{
  var response =  await http.post(
          Uri.parse("http://143.244.191.77/api/verify"),
          body: ({
            "email": emailController.text,
             "otp": otpController.text,
          }));
          
        var link = json.decode(response.body);
          print(link);
          showDialog(

                    context: context,
                    builder: (context) {

                      Widget okButton = TextButton(
                      child: Text("OK", style: TextStyle(color: Colors.black),),
                      onPressed: () {
                      Navigator.push(
                      context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      );
                      return AlertDialog(
                       content: Text( link.toString()),
                       // title: Text("updated successfully"),
                        
                         actions: [
                      okButton,
                     ],
                      );
                     });
          }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.green[900],
      appBar: AppBar(
          backgroundColor: Colors.green[900],
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Reg()));
              })),


      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                      child: Column(
                        children: [
                          Text("Email Verification",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w900, color: Colors.white)),
                          SizedBox(
                            height: 10,
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
               
                SizedBox(height: 10),

                 Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //labelText: 'Email',
                      hintText: 'Enter your email',
                      //labelText: "Email",
                       hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                         color: Colors.white,
                      )),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),


                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    controller: otpController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //labelText: 'Email',
                      hintText: 'Enter otp sent to your mail',
                      //labelText: "",
                       hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                         color: Colors.white,
                      )),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),


               
               
              
               
                SizedBox(height: 30),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                       color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(20)),
                  child: MaterialButton(
                    onPressed: () async {
                      
                     ResetPassword();
                      validate();
                    },
                    child: Text(
                      'Verify',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  }

