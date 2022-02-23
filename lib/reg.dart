import 'package:flutter/material.dart';
import 'package:npl/login.dart';
import 'package:http/http.dart' as http;
import 'package:npl/verifyemail.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

//import 'DataModel.dart';
import 'data_model.dart';

class Reg extends StatefulWidget {
  const Reg({
    Key? key,
  }) : super(key: key);

  @override
  _RegState createState() => _RegState();
}



class _RegState extends State<Reg> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validate() {
    if (formkey.currentState!.validate()) {
      print("object");
    } else {
      print("not val");
    }
  }

  late DataModel _dataModel;

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  //final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[900],
        // appBar: AppBar(
        //   backgroundColor: Colors.green[900],
        //   centerTitle: true,
        //   title: Text("Register"),
        // ),
        body: SingleChildScrollView(
          
        child: Center(
          
        child: Form(
          key: formkey,
          child: Column(
            
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
              SizedBox(
                height: 100,
              ),

              Container(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Container(
                       

                        color: Colors.white,
                        child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 18),
                                  child: Icon(
                                    Icons.account_circle,
                                    size: 25,
                                    color: Colors.green[900],
                                  )),
                              contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              border: OutlineInputBorder(),
                              hintText: "Enter name",
                              hintStyle: TextStyle(
                                color: Colors.green[900],
                                //fontStyle: FontStyle.italic,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              errorStyle: TextStyle(color: Colors.green),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Name field required";
                              } else {
                                return null;
                              }
                            },
                            controller: nameController),
                      ),
                      SizedBox(height: 20),
                      Container(
                        color: Colors.white,
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.mail,
                                  size: 28,
                                  color: Colors.green[900],
                                )),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            border: OutlineInputBorder(),
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Colors.green[900],
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                            errorStyle: TextStyle(color: Colors.green),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email field required";
                            } else {
                              return null;
                            }
                          },
                          controller: emailController,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        color: Colors.white,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.call,
                                  size: 28,
                                  color: Colors.green[900],
                                )),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            border: OutlineInputBorder(),
                            hintText: "phone number",
                            hintStyle: TextStyle(
                              color: Colors.green[900],
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                            errorStyle: TextStyle(color: Colors.green),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "PhoneNo field required";
                            } else {
                              return null;
                            }
                          },
                          controller: phoneController,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        color: Colors.white,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.lock,
                                  size: 28,
                                  color: Colors.green[900],
                                )),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            border: OutlineInputBorder(),
                            hintText: "password",
                            hintStyle: TextStyle(
                              color: Colors.green[900],
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                            errorStyle: TextStyle(color: Colors.green),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Passwoed field required";
                            } else {
                              return null;
                            }
                          },
                          controller: passwordController,
                        ),
                      ),
                      SizedBox(height: 13),
                      Container(
                        child: ElevatedButton(
                          child: Text(
                            "Register" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)
                          ),
                          onPressed: () async {
                            validate();
                            String name = nameController.text;
                            String email = emailController.text;
                            String phone = phoneController.text;
                            String password = passwordController.text;
                           

                            DataModel data =
                                await submitData(name, email, phone, password);

                            setState(() {
                              _dataModel = data;
                                
                              
                            });
                           
                     
                          },
                          style: ElevatedButton.styleFrom(
                            // padding: EdgeInsets.symmetric(
                            //     horizontal: 70.0, vertical: 15),
                            primary: Colors.lightGreen,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                          "By registering, you confirm that you accept our terms of use and privacy policy",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          )),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Have an Account? ",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
        )
        )
        );
  }
  Future submitData(
    String name, String email, String phone, String password) async {
  var response = await http.post(
      Uri.parse("https://app.fmysdenterprisetraining.com.ng/api/register"),
      body: {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password
      });

  var data = response.body;
  print(data);
  
String responseString;
  
  if (response.statusCode == 200) {
    responseString = response.body;
    dataModelFromJson(responseString);


    // Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => Verifyemail()));
                      
    //  Fluttertoast.showToast(
    //     msg: "Account created successfully",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.SNACKBAR,
    //     timeInSecForIosWeb: 10,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 30.0,);

        
    showDialog(

                    context: context,
                    builder: (context) {

                      Widget okButton = TextButton(
                      child: Text("OK", style: TextStyle(color: Colors.black),),
                      onPressed: () {
                      Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Verifyemail()));
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
showDialog(

                    context: context,
                    builder: (context) {

                      Widget okButton = TextButton(
                      child: Text("OK", style: TextStyle(color: Colors.black),),
                      onPressed: () {
                      Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Reg()));
                      },
                      );
                      return AlertDialog(
                       content: Text("Email Already Exist"),
                       // title: Text("updated successfully"),
                        
                         actions: [
                      okButton,
                     ],
                      );
                     });
        
    
   //return null;
  //  Fluttertoast.showToast(
  //       msg:data,
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 10,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 70.0
  //   );}
    
}}}