import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:npl/homescreen.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:npl/provider/auth_provider.dart';
import 'package:npl/succpay.dart';
import 'package:npl/welcomeThree.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'Album.dart';

class Donatethree extends StatefulWidget {
  Map<dynamic, dynamic>? campaign;
 Donatethree({Key? key, this.campaign});

  @override
  _DonatethreeState createState() => _DonatethreeState();
}
Map? mapResponse;
List? listResponse;


class _DonatethreeState extends State<Donatethree> {

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
  final plugin = PaystackPlugin();
  final _donationAmountController = TextEditingController();

  @override
  void initState() {
    plugin.initialize(
        publicKey: 'pk_test_215c83c264220fefeadf4089d6b9f385d9228f15');
    super.initState();
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 70),

              Stack(children: <Widget>[
                Container(
                    child: Image.asset(
                  'lib/Assets/e.png',
                  width: 1000,
                  fit: BoxFit.fitWidth,
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 5, 0, 0),
                      child: Expanded(
                        child: ClipRRect(
                            borderRadius: new BorderRadius.circular(0.0),
                            child: Image.asset(
                              'lib/Assets/what.png',
                              height: 165,
                              width: 165,
                            )),
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        iconSize: 30,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomeThree()));
                        })
                  ],
                ),
              ]),

              SizedBox(height: 30),

              // Padding(
              //   padding: const EdgeInsets.all(30.0),
              //   child: Container(
              //       child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "National Leadership Dialogue Series",
              //         style:
              //             TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              //       ),
              //       Text("Merited Category",
              //           style: TextStyle(
              //             fontSize: 15,
              //           )),
              //     ],
              //   )),
              // ),
              // SizedBox(height: 10),

              // Container(
              //     child: Padding(
              //   padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "we recognize with profound gratitude, the tireless and herioc",
              //         style: TextStyle(color: Colors.black45),
              //       ),
              //       Text(
              //         "Sacrifices of many Nigerians to build a great and dynamic",
              //         style: TextStyle(color: Colors.black45),
              //       ),
              //       Text(
              //         "ecpnomy, within a free, democratic and noble society",
              //         style: TextStyle(color: Colors.black45),
              //       ),
              //     ],
              //   ),
              // )),

              // SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter your donation",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.green[300],
                        child: Column(
                          children: [
                            TextFormField(
                              cursorColor: Colors.white,
                              controller: _donationAmountController,
                              style: TextStyle(color: Colors.white),
                              // hintText: "Password
                              decoration: InputDecoration(
                                  hintText: "Enter amount to donate",
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.green,
                                  ))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Padding(
              //   padding: const EdgeInsets.all(30),
              //   child: Container(
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text("The NPL Leadership Crowdfund",
              //             style: TextStyle(
              //                 fontSize: 17, fontWeight: FontWeight.bold)),
              //         SizedBox(
              //           height: 6,
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(0),
              //           child: Text(
              //               "We recognize, with profound gratitude, the tireless and heroic"),
              //         ),
              //         Text(
              //             "sacrifies of many Nigerians to build a great and dynamic"),
              //       ],
              //     ),
              //   ),
              // ),

              SizedBox(height: 13),
              Container(
                padding: EdgeInsets.fromLTRB(80, 15, 80, 10),
                child: ElevatedButton(
                  child: Text("Donate to Campaign"),
                  onPressed: () async {
                    //   Navigator.push(
                    //  context,
                    //   MaterialPageRoute(builder: (context) => FlutterWave()),
                    //   );
                    int amount =
                        int.parse(_donationAmountController.text) * 100;
                    String email =
                        Provider.of<AuthProvider>(context, listen: false)
                            .profile
                            .email;
                    Charge charge = Charge()
                      ..amount = amount
                      ..reference = _getReference()
                      // or ..accessCode = _getAccessCodeFrmInitialization()
                      ..email = email;
                    CheckoutResponse response = await plugin.checkout(
                      context,
                      method: CheckoutMethod
                          .card, // Defaults to CheckoutMethod.selectable
                      charge: charge,
                    );
                    print('pppppppppppppppp');
                    print(response.status);
                    if (response.status) {
                      //Todo: Code what should happen after successful payment
                       Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Succpay()));
                    } else {
                      //Todo: Code what should happen after payment failed
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      // padding: EdgeInsets.symmetric(
                      //     horizontal: 120, vertical: 8),
                      // padding: EdgeInsets.fromLTRB(123, 11, 123, 11),
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _checkPayment(){

  // }
}