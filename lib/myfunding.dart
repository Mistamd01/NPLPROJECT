import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:npl/homescreen.dart';
import 'package:npl/profilepage.dart';
import 'package:npl/provider/auth_provider.dart';

import 'dart:convert';


import 'package:provider/provider.dart';



class MyFunding extends StatefulWidget {
  const MyFunding({Key? key}) : super(key: key);

  @override
  _MyFundingState createState() => _MyFundingState();
}



Map? mapResponse;
List? listResponse;


class _MyFundingState extends State<MyFunding> {
//  Future getData()async{

//    var response = await http.get(Uri.parse("https://app.fmysdenterprisetraining.com.ng/api/user/donations?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xNDMuMjQ0LjE5MS43N1wvYXBpXC9sb2dpbiIsImlhdCI6MTY0MTA1NzA4MywiZXhwIjoxNjQxMDYwNjgzLCJuYmYiOjE2NDEwNTcwODMsImp0aSI6IjNSSkNQRjRHTTlTVUhQeGsiLCJzdWIiOjEsInBydiI6ImViMzViMjUwYmMyNmVmOGFmODYyYWM3Yjg0NDU5OWQ1NzVlMTdlNWQifQ.3MwKjOce4G6uvMQTFruX98br7fAY-ia1SnuV0Pp0Eu8"));
//    var jsonData = jsonDecode(response.body);
//    List <User> users = [];

//    for(var u in jsonData){
//      User user = User(u["amount"], u["id"]);
//      users.add(user);
//    }
//    print(users.length);
//    return users;
//  }

 bool isLoading = true;
  Future fetchPost() async {

    String token = Provider.of<AuthProvider>(context, listen: false).token??'';
    print(token);
    http.Response response;
    response = await http.get(Uri.parse(
        "https://app.fmysdenterprisetraining.com.ng/api/user/donations?token=${token}"));

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
                       content: Text( "You have not made any donation", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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

       appBar: AppBar(
         centerTitle: true,
         title: Text("Donations",  textAlign: TextAlign.center, style: TextStyle(color: Colors.black),),
         
                backgroundColor: Colors.white,
                leading: IconButton(
                  
                    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30,),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    })),
         
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
                                 
                                          // Container(
                                          //     child: Text(listResponse![index]["amount"], style: const TextStyle(
                                          //       fontWeight: FontWeight.bold,
                                          //       fontSize: 15.0,
                                          //       //fontStyle: FontStyle.values[1],
                                          //     ),
                                          //     )
                                          // )
                                          
                   
                      
                        
                            //   Card(
                            //    child: ListTile(leading: Icon(Icons.money),title: Text('UserId'), subtitle: Text(listResponse![index]["userid"].toString()),),
                            //    ),
                            //  Card(
                            //    child: ListTile(leading: Icon(Icons.money),title: Text('Amount'), subtitle: Text(listResponse![index]["amount"]),),
                            //    ),

                            //    Card(
                            //    child: ListTile(leading: Icon(Icons.money),title: Text('Cid'), subtitle: Text(listResponse![index]["cid"].toString()),),
                            //    ),

                            //    Card(
                            //    child: ListTile(leading: Icon(Icons.money),title: Text('ref'), subtitle: Text(listResponse![index]["ref"].toString()),),
                            //    ),
                              Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network('https://app.fmysdenterprisetraining.com.ng/${listResponse![index]["cimage"]}'),
                                      ),

                                      Row(
                                        children: [
                                          Container(
                                            child: const Text("Campaign title:", style: const TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                                          ),
                                          const Padding(padding: const EdgeInsets.only(right: 10.0),),

                                          Container(
                                              child: Text(listResponse![index]["ctitle"], style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0,
                                                //fontStyle: FontStyle.values[1],
                                              ),
                                              )
                             )] ),
                             Row(
                                        children: [
                                          Container(
                                            child: const Text("Amount donated:", style: const TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                                          ),
                                          const Padding(padding: const EdgeInsets.only(right: 10.0),),

                                          Container(
                                              child: Text(listResponse![index]["amount"], style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0,
                                                //fontStyle: FontStyle.values[1],
                                              ),
                                              )
                             )] ),


                             Row(
                                        children: [
                                          Container(
                                            child: const Text("Reference number:", style: const TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                                          ),
                                          const Padding(padding: const EdgeInsets.only(right: 10.0),),

                                          Container(
                                              child: Text(listResponse![index]["ref"].toString(), style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0,
                                                //fontStyle: FontStyle.values[1],
                                              ),
                                              )
                             )] ),

                             Row(
                                        children: [
                                          Container(
                                            child: const Text("Campaign Id:", style: const TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                                          ),
                                          const Padding(padding: const EdgeInsets.only(right: 10.0),),

                                          Container(
                                              child: Text(listResponse![index]["cid"].toString(), style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0,
                                                //fontStyle: FontStyle.values[1],
                                              ),
                                              )
                             )] ),


SizedBox(height: 20),
                           
                        
                     
                   
                                        ],
                                      ),
                                );



                              },
                              itemCount: listResponse!.length,
                            ),
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
                 color: Colors.green,
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
   
        