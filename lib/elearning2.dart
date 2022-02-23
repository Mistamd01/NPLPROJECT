import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

import 'package:npl/elearning1.dart';
import 'package:npl/elearning3.dart';
import 'package:video_player/video_player.dart';
//import 'package:video_player/video_player.dart';





class LearnTwo extends StatefulWidget {
  const LearnTwo({Key? key}) : super(key: key);

  @override
  _LearnTwoState createState() => _LearnTwoState();
}

// late String stringResponse;
//   late Map mapResponse;
//String? stringResponse;
Map? mapResponse;
List? listResponse;

//String? length;

class _LearnTwoState extends State<LearnTwo> {
  bool isLoading = true;
  Future fetchPost() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://app.fmysdenterprisetraining.com.ng/api/user/courselist?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBwLmZteXNkZW50ZXJwcmlzZXRyYWluaW5nLmNvbS5uZ1wvYXBpXC9sb2dpbiIsImlhdCI6MTY0NTAxODc2MCwiZXhwIjoxNjQ1MDIyMzYwLCJuYmYiOjE2NDUwMTg3NjAsImp0aSI6Im4ydEY0QXdPaHA2MkVDamIiLCJzdWIiOjEsInBydiI6ImViMzViMjUwYmMyNmVmOGFmODYyYWM3Yjg0NDU5OWQ1NzVlMTdlNWQifQ.xRWm4hayCF2u_AIs86Qr5FHejeiqF-PmsYujPv3Kb2g"));

    if (response.statusCode == 200) {
      setState(() {
        //stringResponse = response.body;
        print('-----------');
        print(response.body);
        isLoading=false;
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!["data"];
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

       appBar: AppBar(
         centerTitle: true,
         title: Text("Selected course details", style: TextStyle(color: Colors.black),),
                backgroundColor: Colors.white,
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30,),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LearnOne()));
                    })),
        // body: Center(
        //   child: Container(
        //     height: 200,
        //     width: 300,
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(20), color: Colors.blue),
        //     child: Center(
        //       child: mapResponse==null? Container(): Text(mapResponse!['data'].toString()),
        //     ),
        //   ),
        // ),
      //backgroundColor: Colors.green[900],
        body: Container(


          
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: isLoading?const Center(child: CircularProgressIndicator())
                            :ListView.builder(
                              itemBuilder: (context, index) {
                                
                                return Container(
                                  child: Column(
                                    crossAxisAlignment : CrossAxisAlignment.start,
                                    children: [
                                      //  Padding(
                                      //   padding: const EdgeInsets.all(8.0),
                                      //   child: Image.network('https://app.fmysdenterprisetraining.com.ng/${listResponse![index]["video"].toString()}'),
                                      // ),
   SizedBox(height: 70),
                                      Text(listResponse![index]["title"],  style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 25.0,
                                        //fontStyle: FontStyle.values[1],
                                      ),
                                      ),
                                      const SizedBox(height:10),
                                      //  Container(
                                      const Text("Merited category", style: TextStyle(color: Colors.black45)),
                                      //  ),
                                      const SizedBox(height:20),
                                     
                                      

                                      const SizedBox(height: 15),
                                      

                                          Container(
                                              child: Text(listResponse![index]["description"], style: const TextStyle(
                                                color:Colors.black45,
                                                fontSize: 15.0,
                                                //fontStyle: FontStyle.values[1],
                                              ),
                                              )
                                          ),
                                       SizedBox(height: 50),
                                        Padding(
                                          
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green)
          ),
          height: 50,
          width: 1000,
          
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               GestureDetector(
                                  onTap: () {
                                   Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => Video()));
                                  },
                                  child: Padding(
                                   padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                                    child: Text(
                                      "View Course   --->",
                                      
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),

                                ),
             ],
           ),

        ),
      )
                                    ],
                                  ),
                                );
                              },
                              itemCount: listResponse!.length,
                            ),
          ),

          
        )
        );
  }
}


