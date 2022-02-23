import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

import 'campaign.dart';
import 'donate.dart';

class Fetch extends StatefulWidget {
  const Fetch({Key? key}) : super(key: key);

  @override
  _FetchState createState() => _FetchState();
}

// late String stringResponse;
//   late Map mapResponse;
//String? stringResponse;
Map? mapResponse;
List? listResponse;

//String? length;

class _FetchState extends State<Fetch> {
  Future fetchPost() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://app.fmysdenterprisetraining.com.ng/api/campaigns?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xNDMuMjQ0LjE5MS43N1wvYXBpXC9sb2dpbiIsImlhdCI6MTY0MTA1NzA4MywiZXhwIjoxNjQxMDYwNjgzLCJuYmYiOjE2NDEwNTcwODMsImp0aSI6IjNSSkNQRjRHTTlTVUhQeGsiLCJzdWIiOjEsInBydiI6ImViMzViMjUwYmMyNmVmOGFmODYyYWM3Yjg0NDU5OWQ1NzVlMTdlNWQifQ.3MwKjOce4G6uvMQTFruX98br7fAY-ia1SnuV0Pp0Eu8"));

    if (response.statusCode == 200) {
      setState(() {
        //stringResponse = response.body;
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!["id"];
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
                backgroundColor: Colors.white,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black, size: 30,),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Campaign()));
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
            child: ListView.builder(
      itemBuilder: (context, index) {
            return Container(
              child: Column(
                 crossAxisAlignment : CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Image.network(listResponse![index]["http://143.244.191.77+mapResponse.image"]),
                  // ),

                

                

                 
                  Text(listResponse![index]["title"],  style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 25.0,
                  //fontStyle: FontStyle.values[1],
                  ),
                  ),
               SizedBox(height:10),
                //  Container(
                Text("Merited category", style: TextStyle(color: Colors.black45)),
                //  ),
             SizedBox(height:20),
                         Row(
                            children: <Widget>[
                              Container(
                                height: 30,
                                width:80,
                                color: Colors.lightGreen,
                                child: Center(
                                  child: Text(
                                    "Leaders",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(right: 10.0),),
                              Container(
                                 height: 30,
                                width:80,
                                color: Colors.lightGreen,
                                child: Center(
                                  child: Text(
                                    "Africa",
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                               Padding(padding: EdgeInsets.only(right: 10.0),),
                              Container(
                                height: 30,
                                width:80,
                                color: Colors.lightGreen,
                                child: Center(
                                  child: Text(
                                    "Politics",
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )

                            ],
                          ),

                          SizedBox(height: 30),
                       Divider(
                  
                    color: Colors.green,
                   thickness: 2,
                 ),

                  SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        child: Text("Targeted Price:", style: TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0),),

                      Container(
                      child: Text(listResponse![0]["amount"], style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  //fontStyle: FontStyle.values[1],
                  ),
                  )
                      )
                    ],
                  ),
                   SizedBox(height: 33),
                   
                   Text("Campaign Details", style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 23.0,
                  //fontStyle: FontStyle.values[1],
                  )),
                  SizedBox(height: 25),

                  // Text(listResponse![index]["campaign_date"]),
                  // Text(listResponse![index]["created_at"]),
                  
                  Text(listResponse![0]["description"], style: TextStyle(
                  //fontWeight: FontWeight.bl,
                  color: Colors.black45,
                  fontSize: 13.0,
                  //fontStyle: FontStyle.values[1],
                  )),
SizedBox(height: 15),
            Center(
            child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             ElevatedButton(
            style: ElevatedButton.styleFrom(

               padding: EdgeInsets.symmetric(horizontal: 30.0),
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
            primary: Colors.lightGreen, // background
            onPrimary: Colors.white, // foreground
            ),
            onPressed: () {
              Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Donate()));
            },
            child: Text('Donate to Campaign' , style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold) ),
             ),


             ElevatedButton(
            style: ElevatedButton.styleFrom(

               padding: EdgeInsets.symmetric(horizontal: 70.0),
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
            
        ),

        side: BorderSide(width: 1.0, color: Colors.green),
            primary: Colors.white, // background
            onPrimary: Colors.green, // foreground
            ),
            onPressed: () {
              
            },
            child: Text('Share'),
             )
          
    ],
  ),
),

SizedBox(height: 55),
                ],
              ),          
            );
      },
      itemCount: listResponse == null ? 0 : listResponse!.length,
    ),
          ),
        )
        );
  }
}


