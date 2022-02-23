

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:npl/succpay.dart';
import 'dart:convert';

import 'campaign.dart';
import 'dart:io';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:npl/provider/auth_provider.dart';
import 'package:provider/provider.dart';



class Donate extends StatefulWidget {
  Map<dynamic, dynamic>? campaign;
  Donate({Key? key, this.campaign});

  //const Campaigndetails({Key? key}) : super(key: key);

  @override
  _DonateState createState() => _DonateState();
}

Map? mapResponse;
List? listResponse;

//String? length;

class _DonateState extends State<Donate> {

  String t_ref = '';

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
        fetchPost();
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
                        ),
                      )
                    ],
                  ),

                 // const SizedBox(height: 15),
                
                
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

                

                  const SizedBox(height: 63),
                    Container(
                      color: Colors.green[300],
                        child: Column(
                          children: [
                            TextField(
                              controller: _donationAmountController,
                              style: TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
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
                          ),
                  const SizedBox(height: 15),
                  Center(
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         ElevatedButton(
                  child: Text("Donate to campaign"),
                  onPressed: () async {
                    t_ref = _getReference();
                  int amount =
                        int.parse(_donationAmountController.text) * 100;
                        String email =
                        Provider.of<AuthProvider>(context, listen: false)
                            .profile
                            .email;
                            
                    Charge charge = Charge()
                    ..amount = amount
                    ..reference = t_ref
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
                      String token = Provider.of<AuthProvider>(context, listen: false).token!;
                       var url = Uri.parse('https://app.fmysdenterprisetraining.com.ng/api/user/donate?token=${token}');
                       var donateNowResponse = await http.post(url, body: jsonEncode({'amount': amount.toString(), 'cid': widget.campaign!['id'], 'ref':t_ref}));
                       print(donateNowResponse.statusCode);
                       print(donateNowResponse.body);
                      

                       if(donateNowResponse.statusCode == 200){
                         Navigator.push(
                             context, MaterialPageRoute(builder: (context) => Succpay()));
                       }else{
                         //show error message
                       }} else {
                      //Todo: Code what should happen after payment failed
                       }},
                      style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      // padding: EdgeInsets.symmetric(
                      //     horizontal: 120, vertical: 8),
                      // padding: EdgeInsets.fromLTRB(123, 11, 123, 11),
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
         

                       
                         )
                      ],
                    ),
                  ),

                  const SizedBox(height: 55),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ],

        )
        )
        );
  }
}



