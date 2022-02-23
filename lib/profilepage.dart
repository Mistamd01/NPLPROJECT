import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:npl/homescreen.dart';
import 'package:npl/myfunding.dart';
import 'package:npl/provider/auth_provider.dart';
import 'dart:convert';

import 'package:provider/provider.dart';



class Fetch extends StatefulWidget {
  const Fetch({Key? key}) : super(key: key);

  @override
  _FetchState createState() => _FetchState();
}


Map? mapResponse;
Map? listResponse;



class _FetchState extends State<Fetch> {
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

  /*
  {"id":1,
  "full_name":"Ayomide Oloyede",
  "state":"Suleja",
  "country":"Nigeria",
  "email":"dev.ayomide@gmail.com","token":"******",
  "referral_code":"1F8934",
  "address":"suleja Niger State",
  "phone":"07016195980",
  "balance":"100",
  "verfied":true,
  "createdAt":"2021-12-15T15:31:15.000Z",
  "updatedAt":"2022-01-28T21:09:14.000Z"}
   */

  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(
         centerTitle: true,
         title: Text("Profile", style: TextStyle(color: Colors.black),),
         
                backgroundColor: Colors.white,
                leading: IconButton(
                  
                    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30,),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    })),
         
                 body: Container(
                 child: isLoading?const Center(child: CircularProgressIndicator())
                            :ListView(children: [
                              
                              Container(height: MediaQuery.of(context).size.height/3, width: MediaQuery.of(context).size.width, color: Colors.green[900],
                              
  //                             Container(
  
  // height: 135,
  
  // color: Colors.white,
  
  // child: Center(
  
  //   child: Image.asset('lib/Assets/what.png',height: 120),
  
  //   )
  
  // ),
                              child: Center(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 90),
                                      child: Container(
                                        height: 100,
                                        width: 1000,
                                        color: Colors.white,
                                        child: Center(
  
                                child: Image.asset('lib/Assets/what.png',height: 150),
  
    )
                                      ),
                                    )
                                  ],
                                ),
                                // child: Text("Welcome to your\nProfile Page", style: TextStyle(color: Colors.white, fontSize: 25),),
                                // child: Image.asset('lib/Assets/what.png',height: 120),
                              ),
                              ),
                              SizedBox(height: 65),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
                     child: Card(child: ListTile(leading: Icon(Icons.person),title: Text('First Name'), subtitle: Text(listResponse!["name"]), trailing: Icon(Icons.edit),),),
                   ),
                  //  Padding(
                  //    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  //    child: Card(child: ListTile(leading: Icon(Icons.person),title: Text('Last Name'), subtitle: Text(listResponse!["full_name"]), trailing: Icon(Icons.edit)),),
                  //  ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
                     child: Card(child: ListTile(leading: Icon(Icons.email),title: Text('Email Address'), subtitle: Text(listResponse!["email"]),),),
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
                     child: Card(child: ListTile(leading: Icon(Icons.phone),title: Text('Phone Number'), subtitle: Text(listResponse!["phone"]), trailing: Icon(Icons.edit)),),
                   ),
                  //  Padding(
                  //    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  //    child: Card(child: ListTile(leading: Icon(Icons.map),title: Text('Address'), subtitle: Text(listResponse!["address"]), trailing: Icon(Icons.edit)),),
                  //  ),
                 ],),
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
                      color: Colors.white,
                      tooltip: 'Home'),
                  Text('Home',
                      style: TextStyle(color:  Colors.white, fontSize: 15)),
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
                      iconSize: 25,
                      onPressed: () {
                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Fetch()));
                      },
                      icon: Icon(Icons.person),
                      color: Colors.white,
                      tooltip: 'Profile'),
                  Text('My Profile',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ],
              ),
            ],
          )),
        ));
  }
}
     