import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:npl/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import 'Homescareen2.dart';
import 'Campaigndetails.dart';
import 'donate.dart';
import 'homescreen.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

// late String stringResponse;
//   late Map mapResponse;
//String? stringResponse;
Map? mapResponse;
List? listResponse;

//String? length;

class _ResultState extends State<Result> {
  bool isLoading = true;
  Future fetchPost() async {
     String token = Provider.of<AuthProvider>(context, listen: false).token??'';
    print(token);
    http.Response response;
   
    response = await http.get(Uri.parse(
        "https://app.fmysdenterprisetraining.com.ng/api/user/check_result?token=${token}"));

    if (response.statusCode == 200) {
      setState(() {
        //stringResponse = response.body;
        print('-----------');
        print(response.body);
        isLoading=false;
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!["data"];
      });
    }else{
      showDialog(

                    context: context,
                    builder: (context) {

                      Widget okButton = TextButton(
                      child: Text("OK", style: TextStyle(color: Colors.black),),
                      onPressed: () {
                      Navigator.push(
                      context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      );
                      return AlertDialog(
                       content: Text( "You do not have any Result yet. Thanks", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                       // title: Text("updated successfully"),
                        
                         actions: [
                      okButton,
                     ],
                      );
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

      //  appBar: AppBar(
      //           backgroundColor: Colors.white,
      //           leading: IconButton(
      //               icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30,),
      //               onPressed: () {
      //                 Navigator.push(context,
      //                     MaterialPageRoute(builder: (context) => Campaign()));
      //               })),
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

                                     
                                     
                                     

                                      const SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Container(
                                            child: const Text("leadership_and_national:", style: const TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                                          ),
                                          const Padding(padding: const EdgeInsets.only(right: 10.0),),

                                          Container(
                                              child: Text(listResponse![index]["leadership_and_national"], style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0,
                                                //fontStyle: FontStyle.values[1],
                                              ),
                                              )
                                          )
                                        ],
                                      ),
                                      //const SizedBox(height: 33),
                                       Row(
                                        children: [
                                          Container(
                                            child: const Text("understanding_the_complexitlies:", style: const TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                                          ),
                                          const Padding(padding: const EdgeInsets.only(right: 10.0),),

                                          Container(
                                              child: Text(listResponse![index]["understanding_the_complexities"], style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0,
                                                //fontStyle: FontStyle.values[1],
                                              ),
                                              )
                                          )
                                        ],
                                      ),


                                       Row(
                                        children: [
                                          Container(
                                            child: const Text("the_rule_of_law:", style: const TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                                          ),
                                          const Padding(padding: const EdgeInsets.only(right: 10.0),),

                                          Container(
                                              child: Text(listResponse![index]["the_rule_of_law"], style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0,
                                                //fontStyle: FontStyle.values[1],
                                              ),
                                              )
                                          )
                                        ],
                                      ),


                                      Row(
                                        children: [
                                          Container(
                                            child: const Text("the_stockdale:", style: const TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                                          ),
                                          const Padding(padding: const EdgeInsets.only(right: 10.0),),

                                          Container(
                                              child: Text(listResponse![index]["the_stockdale"], style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0,
                                                //fontStyle: FontStyle.values[1],
                                              ),
                                              )
                                          )
                                        ],
                                      ),

                                       Row(
                                        children: [
                                          Container(
                                            child: const Text("the_ambassador_carriage:", style: const TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                                          ),
                                          const Padding(padding: const EdgeInsets.only(right: 10.0),),

                                          Container(
                                              child: Text(listResponse![index]["the_ambassador_carriage"], style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0,
                                                //fontStyle: FontStyle.values[1],
                                              ),
                                              )
                                          )
                                        ],
                                      ),

                                     
                                      const SizedBox(height: 55),
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


