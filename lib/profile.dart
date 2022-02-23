// import 'package:flutter/cupertino.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'homescreen.dart';

// class Body extends StatelessWidget {
//   const Body({Key? key, required this.text, required this.icon, required this.press}) : super(key: key);

//   final String text, icon;
//   final VoidCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         HomeScreen(), SizedBox(height: 20), 
//         ProfileMenu()
//         ],
//     );
//   }
// }

// class ProfileMenu extends StatelessWidget {
//   const ProfileMenu({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: FlatButton(
//           padding: EdgeInsets.all(20),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           color: Colors.red,
//           onPressed: () {},
//           child: Row(
//             children: [
//               SvgPicture.asset(
//                 "lib/Assets/nw2.png",
//                 width: 22,
//                 color: Colors.black,
//               ),
//               SizedBox(width: 20),
//               Expanded(
//                   child: Text("profile",
//                       style: Theme.of(context).textTheme.bodyText1)),
//               Icon(Icons.arrow_forward_ios)
//             ],
//           )),
//     );
//   }
// }
