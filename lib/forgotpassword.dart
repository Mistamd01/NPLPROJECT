import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:npl/forgetpasstwo.dart';
import 'package:npl/login.dart';
import 'package:http/http.dart' as http;


class Resetpassword extends StatefulWidget {
  const Resetpassword({Key? key}) : super(key: key);

  @override
  _ResetpasswordState createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {

Future checkUser() async{
  var response =  await http.post(
          Uri.parse("https://app.fmysdenterprisetraining.com.ng/api/validateapi"),
          body: ({
            "email": emailController.text,
            
          }));
          
}


  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState!.validate()) {
      print("object");
    } else {
      print("not val");
    }
  }

  final TextEditingController emailController = TextEditingController();
  //final TextEditingController passwordController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.green[900],
      appBar: AppBar(
          //title: Text("Login Page"),
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
                      hintText: 'Enter your email email',
                       hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      )),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field required";
                      } else {
                          Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Resetpasstwo()));
                      }
                    },
                  ),
                ),
               
                // Padding(
                //   //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                //   padding: EdgeInsets.all(20),
                //   child: TextFormField(
                //     controller: passwordController,
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       //labelText: 'Enter new password',
                //       hintText: 'Enter new password',
                //        hintStyle: TextStyle(
                //             color: Colors.white,
                //           ),
                //       enabledBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.white)),
                //       focusedBorder: OutlineInputBorder(
                //           borderSide: BorderSide(
                //         color: Colors.white,
                //       )),
                //     ),
                //     validator: (value) {
                //       if (value!.isEmpty) {
                //         return "Field required";
                //       } else {
                //         return null;
                //       }
                //     },
                //   ),
                // ),
               
                SizedBox(height: 30),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(20)),
                  child: MaterialButton(
                    onPressed: () async {
                      // final SharedPreferences sharedPreferences =
                      //     await SharedPreferences.getInstance();
                      // sharedPreferences.setString("email", emailController.text);
                      // Get.to(Profilepage());
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (_) => Resetpasstwo()));
                      validate();
                      checkUser();
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
