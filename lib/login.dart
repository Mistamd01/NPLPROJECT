import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:npl/api/BaseUrl.dart';
import 'package:npl/forgotpassword.dart';
import 'package:npl/homescreen.dart';
import 'package:npl/provider/auth_provider.dart';
import 'package:npl/reg.dart';
import 'package:npl/register.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //fornkey
  final _formkey = GlobalKey<FormState>();

//editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      cursorColor: Colors.white,
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      //validator:(){}
      onSaved: (value) {
        emailController.text = value!;
      },
      style: TextStyle(color: Colors.white),

      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.mail,
          color: Colors.white,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
        )),
      ),
    );

    final passwordField = TextFormField(
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      //keyboardType: TextInputType.,
      //validator:(){}
      onSaved: (value) {
        passwordController.text = value!;
      },

      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.vpn_key,
          color: Colors.white,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
        )),
      ),
    );

    final LoginButton = Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: ()  {

          login();
        },
        child: Text(
          "Login",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.lightGreen),
        ),
      ),
    );

    return Scaffold(
      // appBar: AppBar(
      //     centerTitle: true,
      //     title: Text("Login Page"),
      //     backgroundColor: Colors.green[900],
      //     leading: IconButton(
      //         icon: Icon(Icons.arrow_back),
      //         onPressed: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => Register()));
      //         })),
      backgroundColor: Colors.green[900],
      body: SingleChildScrollView(
        child: Column (
         
          children: [
            SizedBox(height: 50),
            Padding(
  padding: const EdgeInsets.only(top: 50),
  child:   Container(
  
  height: 135,
  
  color: Colors.white,
  
  child: Center(
  
    child: Image.asset('lib/Assets/what.png',height: 120),
  
    )
  
  ),
),
             
                 Form(
                  key: _formkey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 50),
                      
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(100),
                      //   child: Image.asset(
                      //     "lib/Assets/ng.png",
                      //     width: 150,
                      //     height: 145,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: emailField,
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: passwordField,
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: LoginButton,
                      ),
                      SizedBox(height: 45),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Resetpassword()));
                            },
                            child: Text(
                              "Forget password?",
                              
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),

                          ),

                          SizedBox(height:10),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                            child: Row(
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: TextStyle(color: Colors.white, fontSize: 20,  fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => Reg()));
                                  },
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              
          ]),
          ),
        
      
    );
  }

  Future<void> login() async {
    if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse(BaseUrl.Login),
          body: ({
            "email": emailController.text,
            "password": passwordController.text
          }));
      
      if (response.statusCode == 200) {
        print(response.body);
        //MA.added setuser
        await Provider.of<AuthProvider>(context, listen: false).setUser(response.body);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Invalid Login",
          style: TextStyle(fontSize: 20, color: Colors.white),
        )));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "black field not allowed",
        style: TextStyle(fontSize: 20, color: Colors.white),
      )));
    }
  }
}



