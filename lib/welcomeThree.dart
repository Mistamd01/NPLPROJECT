import 'package:flutter/material.dart';
import 'package:npl/fetch.dart';
import 'package:npl/reg.dart';
import 'package:npl/register.dart';
import 'package:npl/welcome.dart';


import 'donateThree.dart';
import 'donate_two.dart';
import 'login.dart';


class WelcomeThree extends StatefulWidget {
  const WelcomeThree({Key? key}) : super(key: key);

  @override
  _WelcomeThreeState createState() => _WelcomeThreeState();
}

class _WelcomeThreeState extends State<WelcomeThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
    //  appBar: AppBar(
    //             backgroundColor: Colors.green[900],
    //             leading: IconButton(
    //                 icon: Icon(Icons.arrow_back, color: Colors.white,),
    //                 onPressed: () {
    //                   Navigator.push(context,
    //                       MaterialPageRoute(builder: (context) => Welcome()));
    //                 })),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables

        children: [
//  IconButton(
//                     icon: Icon(Icons.arrow_back, color: Colors.white, ),
//                     onPressed: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => Welcome()));
//                     }),

SizedBox(height: 50),
//             Stack(
            
//             children: <Widget>[
//             Container(child: Image.asset('lib/Assets/what1.png', width: 1000, fit: BoxFit.fitWidth,)),
//          Row(
//     children: <Widget>[
      
//       Padding(
//         padding: const EdgeInsets.fromLTRB(120, 50, 20, 0),
//         child: Expanded(
//           child: ClipRRect(
//               borderRadius: new BorderRadius.circular(0.0),
//               child: Image.asset('lib/Assets/what.png',height: 165,
//     width: 165,)),
          
//         ),
//       ),
//       Expanded(child: Text(''), flex: 9)
//     ],
//   ),
// ]),


Padding(
  padding: const EdgeInsets.only(top: 50),
  child:   Container(
  
  height: 135,
  
  color: Colors.white,
  
  child: Center(
  
    child: Image.asset('lib/Assets/what.png',height: 120),
  
    )
  
  ),
),
          SizedBox(height:200),
          ButtonTheme(
            minWidth: 200.0,
            height: 40.0,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => FetchTwo()));
              },
              child: Text(
                "Crowd Funding",
                style: TextStyle(color: Colors.green[900], fontSize: 20),
              ),
              color: Colors.white,
            ),
          ),
           SizedBox(height:10),
          ButtonTheme(
            minWidth: 200.0,
            height: 40.0,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Donatethree()));
              },
              child: Text(
                "Donate",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              color: Colors.green,
            ),
          ),
 SizedBox(height:10),
           ButtonTheme(
            minWidth: 200.0,
            height: 40.0,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Register()));
              },
              child: Text(
                "Register",
                style: TextStyle(color: Colors.green[900], fontSize: 20),
              ),
              color: Colors.white,
            ),
          ),
          SizedBox(height: 230),
        ],
      )),
    );
  }
}
