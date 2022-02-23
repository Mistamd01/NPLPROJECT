import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:npl/camp.dart';
import 'package:npl/myfunding.dart';
import 'Album.dart';
import 'homescreen.dart';
import 'next.dart';
import 'package:carousel_slider/carousel_slider.dart';




class Campaign extends StatefulWidget {
  //const Campaign({Key? key}) : super(key: key);

// Map? mapResponse;
// List? listResponse;
   
  @override
  _CampaignState createState() => _CampaignState();
} 

class _CampaignState extends State<Campaign> {

// Future fetchPost() async {
//     http.Response response;
//     response = await http.get(Uri.parse(
//         "http://143.244.191.77/api/campaigns?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xNDMuMjQ0LjE5MS43N1wvYXBpXC9sb2dpbiIsImlhdCI6MTY0MTA1NzA4MywiZXhwIjoxNjQxMDYwNjgzLCJuYmYiOjE2NDEwNTcwODMsImp0aSI6IjNSSkNQRjRHTTlTVUhQeGsiLCJzdWIiOjEsInBydiI6ImViMzViMjUwYmMyNmVmOGFmODYyYWM3Yjg0NDU5OWQ1NzVlMTdlNWQifQ.3MwKjOce4G6uvMQTFruX98br7fAY-ia1SnuV0Pp0Eu8"));

//     if (response.statusCode == 200) {
//       setState(() {
//         //stringResponse = response.body;
//         mapResponse = json.decode(response.body);
//         listResponse = mapResponse!["data"];
//       });
//     }
//   }



   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20, right: 16, top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // SvgPicture.asset("lib/Assets/dicon.svg"),
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        }),

                    GestureDetector(
                      onTap: () {},
                      child: Image.asset("lib/Assets/what.png", width:100, height: 100,
                 ),
                  ),

           Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.notification_add),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    // ),
                  ]),
            ),
            //SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 20, right: 16, top: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                    Text("Search LeadNG"),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            //SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: 160,
                child: Stack(
                  children: [
                    Positioned(
                        left: 40,
                        top: 10,
                        bottom: 10,
                        width: 300,
                        child: Card(
                          elevation: 10.0,
                          shadowColor: Colors.white.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: Text("A fundraising for Leading without the I", style: TextStyle(color: Colors.white)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: TextButton(
                                    onPressed: () {
                                      //fetchPost();
                                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Fetch()));
                                    },
                                    child: Text(
                                      "View Campaign", style: TextStyle(
                                        color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          style: TextButton.styleFrom(
                                              backgroundColor: Colors.green),
                                        ),
                                      )
                              ],
                            ),
                            height: 55,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Color(0xFF66BB6A),
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  "lib/Assets/new.jpg",
                                ),
                              ),
                            ),

                            //child: Center(child: Text("Crowd Funding", style: TextStyle(fontSize: 20, ),)),
                          ),
                        )),
                  ],
                ),
              ),
            ),
           // SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 46, right: 46, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Trending Campaigns",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Container(
                    margin: EdgeInsets.only(right: 18),
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {
                               Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Fetch()));
                            },
                            child: Text("View all->>",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 17))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
           // SizedBox(height: 10),
            // Container(
            //     alignment: Alignment.centerLeft,
            //     margin: EdgeInsets.only(left: 16, right: 16),
            //     width: MediaQuery.of(context).size.width,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Container(
            //           width: MediaQuery.of(context).size.width,
            //           height: 180,
            //           child: Swiper(
            //             onIndexChanged: (index) {
            //             setState(() {
            //               _current = index;
            //             });
            //           },
            //           autoplay: true,
            //           layout: SwiperLayout.DEFAULT,
            //           itemCount: carousels.length,
            //           ),
            //         )
            //       ],
            //     ))
  CarouselSlider(
    
 items: [
                  
                //1st Image of Slider
                
                Container(
                
                  height: 200,
                  
                   child: Column(

                   children: <Widget>[
                  GestureDetector(
                    onTap: (){
                       Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Fetch()));
                    },
                   
                  
                       child: Image.network("https://app.fmysdenterprisetraining.com.ng/uploads/1642216326260333514_3179327902340968_3143238498126570560_n.jpeg", height: 120, ),
                 
                   ),
                   Text("Protege Leadership Program",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                   ]),
                
                ), 
                //2nd Image of Slider
           
            //  Container(
            //       margin: EdgeInsets.all(6.0),
            //       child: GestureDetector(
            //         onTap: (){
            //            Navigator.push(
            //                               context,
            //                               MaterialPageRoute(
            //                                   builder: (context) => Fetch()));
            //         },
                   
                  
            //            child: Image.network("https://app.fmysdenterprisetraining.com.ng/uploads/1642235324NPL logo.jpeg", fit:BoxFit.fill),
                 
            //     ),
            //     ), 
                Container(
                
                  height: 200,
                  
                   child: Column(

                   children: <Widget>[
                  GestureDetector(
                    onTap: (){
                       Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Fetch()));
                    },
                   
                  
                       child: Image.network("https://app.fmysdenterprisetraining.com.ng/uploads/1642235324NPL logo.jpeg", height: 120, ),
                 
                   ),
                   Text("NPL Endowment Fund for Leadership",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                   ]),
                
                ), 
                  
                //3rd Image of Slider
                
                //  Container(
                //   margin: EdgeInsets.all(6.0),
                //   child: GestureDetector(
                //     onTap: (){
                //        Navigator.push(
                //                           context,
                //                           MaterialPageRoute(
                //                               builder: (context) => Fetch()));
                //     },
                   
                  
                //        child: Image.network("https://app.fmysdenterprisetraining.com.ng/uploads/1642353014WhatsApp Image 2022-01-11 at 10.14.39 (1).jpeg", fit:BoxFit.contain),
                 
                // ),
                // ), 

                Container(
                
                  height: 200,
                  
                   child: Column(

                   children: <Widget>[
                  GestureDetector(
                    onTap: (){
                       Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Fetch()));
                    },
                   
                  
                       child: Image.network("https://app.fmysdenterprisetraining.com.ng/uploads/1642353014WhatsApp Image 2022-01-11 at 10.14.39 (1).jpeg", height: 120, ),
                 
                   ),
                   Text("Excellence in Leadership Lecture",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                   ]),
                
                ), 
            //  Container(
            //       margin: EdgeInsets.all(6.0),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(8.0),
            //         image: DecorationImage(
            //           image: NetworkImage("ADD IMAGE URL HERE"),
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ),
                  
            //     //5th Image of Slider
            //     Container(
            //       margin: EdgeInsets.all(6.0),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(8.0),
            //         image: DecorationImage(
            //           image: NetworkImage("ADD IMAGE URL HERE"),
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ),
            ],
              
            //Slider Container properties
              options: CarouselOptions(
                height: 160.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
          ),
       




       Container(
              margin: EdgeInsets.only(left: 46, right: 46, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("New Campaigns",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Container(
                    margin: EdgeInsets.only(right: 18),
                    child: Column(
                      children: [
                               TextButton(
                            onPressed: () {
                               Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Fetch()));
                            },
                            child: Text("View all->>",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 17))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(height: 10),


Padding(
                padding: const EdgeInsets.all(23.0),
                child: Container(
                  height: 140,
                  //color: Color(0xFFFFF59D),
                  //width: 300,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 15,
                          bottom: 20,
                          child: Material(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFF59D),
                                borderRadius: BorderRadius.circular(10.0),
                                // new BoxShadow(
                                //   color: Colors.grey.withOpacity(0.3)
                                // )
                              ),
                            ),
                          )),
                      Positioned(
                          left: 30,
                          top: 10,
                          bottom: 10,
                          child: Card(
                            elevation: 10.0,
                            shadowColor: Colors.white.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              height: 155,
                              width: 150,
                              decoration: BoxDecoration(
                                //color: Color(0xFFFFF59D),
                                borderRadius: BorderRadius.circular(10.0),
                                 image: DecorationImage(
                               image: NetworkImage("https://app.fmysdenterprisetraining.com.ng/uploads/1642353014WhatsApp Image 2022-01-11 at 10.14.39 (1).jpeg"),
                               fit: BoxFit.cover,
                    ),
                              ),
                            ),
                          )),
                      Positioned(
                          top: 4,
                          left: 200,
                          child: Container(
                            child: Column(
                              children: [
                                Text("Leadership Programme", 
                                    style: TextStyle(
                                        color: Colors.black,
                                        height: 5,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Text("International",
                                    style: TextStyle(
                                        color: Colors.black,
                                        height: 1,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                // TextButton(
                                //   onPressed: () {},
                                //   child: Text(
                                //     "Apply now",
                                //     style: TextStyle(color: Colors.white),
                                //   ),
                                //   style: TextButton.styleFrom(
                                //       backgroundColor: Colors.black),
                                // )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),






          ],
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
                  offset: Offset(0, -15),
                  blurRadius: 20,
                  color: Colors.white,
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
                      iconSize: 22,
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
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                      
                ],
              ),
            


             Column(
                mainAxisSize: MainAxisSize.min,
               children: [
                 IconButton(
                          iconSize: 22,
                          onPressed: () {
                              Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyFunding()));
                          },
                          icon: Icon(Icons.money),
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
                          iconSize: 22,
                          onPressed: () {
                             Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomeScreen()));
                          },
                          icon: Icon(Icons.person),
                          color: Colors.white,
                          tooltip: 'Profile'),
              
                  Text('Profile',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                       ],
             ),
            ],
          )
          ),
        )
    );
  }
}
