import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:npl/login.dart';




class Resetpasstwo extends StatefulWidget {
  const Resetpasstwo({Key? key}) : super(key: key);

  @override
  _ResetpasstwoState createState() => _ResetpasstwoState();
}

class _ResetpasstwoState extends State<Resetpasstwo> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState!.validate()) {
      print("object");
    } else {
      print("not val");
    }
  }

   final TextEditingController otpController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
   final TextEditingController emailController = TextEditingController();


Future ResetPassword() async{
  var response =  await http.post(
          Uri.parse("https://app.fmysdenterprisetraining.com.ng/api/resetpassapi"),
          body: ({
            "email": emailController.text,
             "otp": otpController.text,
             "password": passwordController.text,
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
                    MaterialPageRoute(builder: (context) => LoginScreen()));
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
                          Text("Reset Password",
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


                 Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //labelText: 'Email',
                      hintText: 'New password',
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
                      'Reset password',
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

