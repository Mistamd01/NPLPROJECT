import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Homescareen2.dart';
import 'donate.dart';

class Campaigndetails extends StatefulWidget {
  Map<dynamic, dynamic>? campaign;
  Campaigndetails({Key? key, this.campaign});

  //const Campaigndetails({Key? key}) : super(key: key);

  @override
  _CampaigndetailsState createState() => _CampaigndetailsState();
}

Map? mapResponse;
List? listResponse;

//String? length;

class _CampaigndetailsState extends State<Campaigndetails> {
  bool isLoading = true;
  Future fetchPost() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://app.fmysdenterprisetraining.com.ng/api/viewcampaign"));

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(

       appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30,),
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
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment : CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network('https://app.fmysdenterprisetraining.com.ng/${widget.campaign!["image"]}'),
                  ),

                  Text(widget.campaign!["title"],  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25.0,
                    //fontStyle: FontStyle.values[1],
                  ),
                  ),
                  const SizedBox(height:15),

                 Row(
                    children: [
                      Container(
                        child: const Text("Category: ", style: TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 10.0),),

                      Text(widget.campaign!["category"], style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        //fontStyle: FontStyle.values[1],
                      ),
                      )
                    ],
                  ),

                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        child: const Text("Created: ", style: TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 10.0),),

                      Text(widget.campaign!["created_at"], style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        //fontStyle: FontStyle.values[1],
                      ),
                      )
                    ],
                  ),

                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        child: const Text("Campaign date: ", style: TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 10.0),),

                      Text(widget.campaign!["campaign_date"], style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        //fontStyle: FontStyle.values[1],
                      ),
                      )
                    ],
                  ),

                  // //  Container(
                  // const Text("Merited category", style: TextStyle(color: Colors.black45)),
                  // //  ),
                 // const SizedBox(height:20),
                
                  const SizedBox(height: 30),
                  const Divider(

                    color: Colors.green,
                    thickness: 2,
                  ),

                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        child: const Text("Targeted Price:", style: TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 10.0),),

                      Text(widget.campaign!["amount"], style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        //fontStyle: FontStyle.values[1],
                      ),
                      )
                    ],
                  ),

                  //  const SizedBox(height: 15),
                  // Row(
                  //   children: [
                  //     Container(
                  //       child: const Text("Targeted Price:", style: TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                  //     ),
                  //     const Padding(padding: EdgeInsets.only(right: 10.0),),

                  //     Text(widget.campaign!["data"]["totalamount"], style: const TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 15.0,
                  //       //fontStyle: FontStyle.values[1],
                  //     ),
                  //     )
                  //   ],
                  // ),

                  const SizedBox(height: 33),

              
                  const SizedBox(height: 15),
                  Center(
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(

                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            primary: Colors.lightGreen, // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Donate(campaign: widget.campaign)));
                            
                          },
                          child: const Text('Support campaign' , style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold) ),
                        ),


                        // ElevatedButton(
                        //   style: ElevatedButton.styleFrom(

                        //     padding: const EdgeInsets.symmetric(horizontal: 70.0),
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(15.0)

                        //     ),

                        //     side: const BorderSide(width: 1.0, color: Colors.green),
                        //     primary: Colors.white, // background
                        //     onPrimary: Colors.green, // foreground
                        //   ),
                        //   onPressed: () {

                        //   },
                        //   child: const Text('Share'),
                        // )

                      ],
                    ),
                  ),

                  const SizedBox(height: 55),
// Container(
//    color: Colors.black,
               
// child: TabBar(
//   indicator: BoxDecoration(
//   color: Colors.green,),
//   tabs: <Widget>[
//     Tab(text: "Story"),
//     Tab(text: "Donations",)
//   ]
  
//   )
// ),

// TabBarView(children: [
//   FistScreen();
//   SecondScreen();
// ])
                //   Container(
                //     color: Colors.black,
                //     child: TabBar(
                //     indicator: BoxDecoration(
                //       color: Colors.green,
                //     ),
                //       tabs: [
                //  Tab(text: "Story"),
                //  Tab(text: "Donations",)
                //     ],),
                //   ),


                  // SizedBox(height: 20),
                  // TabBarView(children: [
                  //   Container(
                  //     child: Column(children: [
                  //        Container(
                  //       child: const Text("Targeted Price:", style: TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                  //     ),
                  //     const Padding(padding: EdgeInsets.only(right: 10.0),),

                  //     Text(widget.campaign!["description"], style: const TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 15.0,
                  //       //fontStyle: FontStyle.values[1],
                  //     ),
                  //     )
                  //     ],),
                  //   ),
                  //   Container(),
                  // ])
                ],
              ),
            ),
          ],

        )
        )
        );
  }
}


