import 'dart:ui';
import 'package:npl/ambassadorone.dart';
import 'package:npl/elearning1.dart';
import 'package:npl/myfunding.dart';
import 'package:npl/profilepage.dart';
import 'package:npl/provider/auth_provider.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:npl/Homescareen2.dart';
import 'package:npl/donate_two.dart';
import 'package:npl/login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';

import 'donate.dart';

class HomeScreen extends StatefulWidget {
  
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
Map? mapResponse;
Map? listResponse;
class _HomeScreenState extends State<HomeScreen> {
bool isLoading = true;
  Future fetchPost() async {
    String token = Provider.of<AuthProvider>(context, listen: false).token??'';
    print(token);
    http.Response response;
    response = await http.get(Uri.parse(
        'https://app.fmysdenterprisetraining.com.ng/api/user/me?token=${token}'));

    if (response.statusCode == 200) {
      setState(() {
        //stringResponse = response.body;
        print('-----------');
        print(response.body);
        isLoading=false;
        mapResponse = json.decode(response.body);
        print('---------');
        print(mapResponse!['user']);
        listResponse = mapResponse!["user"];
      });
    }
  }

  
  @override
  void initState() {
    fetchPost();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
        // appBar: AppBar(
        //     backgroundColor: Colors.white,
        //     leading: IconButton(
        //         icon: Icon(Icons.arrow_back, color: Colors.black),
        //         onPressed: () {
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (context) => LoginScreen()));
        //         })),
        
          body: Container(     
            
         height: double.infinity,
         width: double.infinity,
         decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/Assets/splash1.png"),
            fit: BoxFit.cover,
             colorFilter: ColorFilter.mode(
               Color(0XFF161900).withOpacity(0.9), 
               BlendMode.darken
               )   
          ),
        ),



        
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: <Widget>[
              SizedBox(height: 50),

          
                  Container(
                   margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello",
                            style: TextStyle(fontSize: 25, color: Colors.white)),
                      ],
                    )),
                    SizedBox(height: 30),
                Container(
                 height: 50,
                 
                 decoration: BoxDecoration(
                                 color: Colors.white,
                                   borderRadius: BorderRadius.circular(60.0),
                                 
                                ),
                margin: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.search),
                          color: Colors.black,
                          iconSize: 25,
                          onPressed: () {},
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.menu),
                                 color: Colors.black,
                          iconSize: 25,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
SizedBox(height: 30),
              

             // margin: EdgeInsets.all(10),
               

                                      Row(
                                      
                                        children: [
                                          Container(
                                            height: 180,
                                            width: 170,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                               image: DecorationImage(
                                    fit: BoxFit.cover,
                                    
                                    image: AssetImage("lib/Assets/dsc1.jpg"),
                                  ),
                                            ),
                                          ),
                                          Container(
                                                         color: Color(0xFF90491D),
                                                        height: 180,
                                                        width: 210,
                                                        child: Center(
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(top:25),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                              
                                                             Text("2022",
                                      style: TextStyle(
                                          color: Colors.white,
                                         // height: 2,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                            Text("Ambassadors",
                                      style: TextStyle(
                                          color: Colors.white,
                                         // height: 4,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text("Leadership Fellow",
                                      style: TextStyle(
                                          color: Colors.white,
                                         // height: 4,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold)),

                                           
                                        //                     Container(
                                        // width: 100,
                                        TextButton(
                                          onPressed: () {
                                             Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => AmbOne()));
                                          },
                                          child: Text(
                                                            "Apply now",
                                                            style: TextStyle(color:  Color(0xFF90491D),),
                                          ),
                                          style: TextButton.styleFrom(
                                                            
                                                              backgroundColor: Colors.white,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(18),
                                                                                                          )
                                                              ),
                                        ),
                                      
                                            
                                    
                                 
                                
                                                            ],
                                                      ),
                                                          ),
                                                        ),
                                                    ),
                                                  
                                                
                                              

                                                                    
                                ],
                              ),
  
                                       
                 
                
SizedBox(height:17),



  
       Container(
         width:2000,
         //color:Colors.black,
         //margin: EdgeInsets.only(left:10),
         child: Padding(
           padding: const EdgeInsets.only(left: 10),
           child: Center(
            child: Row(
            children: [     
                     Container(
  margin: EdgeInsets.all(10),
                        height: 100,
                        width: 100,
                        
                       child: Column(
                         children: [
                           
                           GestureDetector(
            onTap:(){
               Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Campaign()));
            },
            child: Image.asset("lib/Assets/group1.png", height: 80, width:80),
            
  ),
  Text("Crowd funding"),
                         ],
                       ),
                         decoration: BoxDecoration(
  
                                             color: Colors.white,
  
                                               borderRadius: BorderRadius.circular(10.0),
  
                                             
  
                                            ),
  
                      ),
                    
  
                     Container(
   margin: EdgeInsets.all(10),
                         height: 100,
  
                        width: 100,
  child: Column(
            children: [

              GestureDetector(
                onTap:(){
 Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Donatetwo()));
                },
                child: Image.asset("lib/Assets/group2.png", height: 80, width:80),
                
              ),
              Text("Donate")
            ],
  ),
                         decoration: BoxDecoration(
  
                                             color: Colors.white,
  
                                               borderRadius: BorderRadius.circular(10.0),
  
                                             
  
                                            ),
  
                      ),
                 
  
                    
                       Container(
   margin: EdgeInsets.all(10),
                         height: 100,
  
                        width: 100,
                        
  child: Column(
            children: [
              GestureDetector(
                onTap:(){
                  Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => LearnOne()));
                },
                child: Image.asset("lib/Assets/group3.png", height: 80, width:80),
                
              ),
              Text("E-learning")
            ],
  ),
                         decoration: BoxDecoration(
  
                                             color: Colors.white,
  
                                               borderRadius: BorderRadius.circular(10.0),
  
                                             
  
                                            ),
                                            
  
                      ),
                  
  
            ],
            ),
      ),
         ),
       ),
    
  



  SizedBox(height: 15),
                Container(
                  
                   margin: EdgeInsets.only(left: 10),
                    child: Text("The Prize",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
                            SizedBox(height: 10),
              
                // Padding(
                //   padding: const EdgeInsets.all(10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                       decoration: BoxDecoration(
  
                                         color: Colors.white,
  
                                           borderRadius: BorderRadius.circular(10.0),
  
                                         
  
                                        ),
                       
                      height: 125,
                      
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
                                                          TextStyle(color: Colors.black, fontSize: 15)),
                            
                                                // Text(
                                                //     "careful metuculous and rigorous process",
                                                //     style:
                                                //         TextStyle(color: Colors.black)),
                                                // Text(
                                                //     "that begins with technical team of expert",
                                                //     style:
                                                //         TextStyle(color: Colors.black)),
                        ],
                        ),
                      ),
//                     child: Stack(
//                       children: [
//                         Positioned(
//                             left: 24,
//                             top: 7,
//                             bottom: 10,
//                             width: 340,
//                             child: Card(
//                               elevation: 10.0,
//                               shadowColor: Colors.white.withOpacity(0.5),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                               ),
//                               child: Container(
                                  
//                                 margin:
//                                     EdgeInsets.only(left: 0, right: 10, top: 28),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       margin: EdgeInsets.only(
//                                           left: 12, right: 0, bottom: 26),
//                                       //margin: ,
// //                                     decoration: BoxDecoration(
// // color: Colors.grey[400],
// // borderRadius: BorderRadius.circular(50)
// //                                     ),

//                                       child: Padding(
//                                         // padding: const EdgeInsets.all(15.0),
//                                         padding: const EdgeInsets.fromLTRB(
//                                             3, 0, 12, 0),
//                                         child: Image.asset("lib/Assets/prize.png",
//                                             width: 45,
//                                             height: 45,
//                                             fit: BoxFit.fill),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.all(5.0),
//                                       child: Container(
//                                         child: Column(
//                                           children: [
//                                             Text(
//                                                 "The prize is presented annually after a",
//                                                 style:
//                                                     TextStyle(color: Colors.black)),
//                                             Text(
//                                                 "careful metuculous and rigorous process",
//                                                 style:
//                                                     TextStyle(color: Colors.black)),
//                                             Text(
//                                                 "that begins with technical team of expert",
//                                                 style:
//                                                     TextStyle(color: Colors.black)),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 width: 150,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                               ),
//                             )),
//                       ],
//                     ),
                    
                
                  ),
              ],
            ),
          ),
        
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(color: Colors.white,
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
                      color: Colors.green[900],
                      tooltip: 'Home'),
                  Text('Home',
                      style: TextStyle(color:  Colors.green[900], fontSize: 15)),
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
                                              builder: (context) => MyFunding()));
                      },
                      icon: Icon(Icons.money_sharp),
                      color: Colors.green[900],
                      tooltip: 'My Funding'),
                  Text('My Funding',
                      style: TextStyle(color: Colors.green[900], fontSize: 15)),
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
                      color: Colors.green[900],
                      tooltip: 'Profile'),
                  Text('My Profile',
                      style: TextStyle(color: Colors.green[900], fontSize: 15)),
                ],
              ),
            ],
          )),
        ));
  }
}
