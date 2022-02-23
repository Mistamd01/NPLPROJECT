// To parse this JSON data, do
//
//     final regModel = regModelFromJson(jsonString);

import 'dart:convert';

RegModel regModelFromJson(String str) => RegModel.fromJson(json.decode(str));

String regModelToJson(RegModel data) => json.encode(data.toJson());

class RegModel {
    RegModel({
      required this.amount,
        required this.firstName,
        required this.lastName,
        required this.stateOrigin,
        required this.stateResidence,
        required this.certificate,
        required this.motivation,
        required this.aboute,
        required this.phone,
        required this.email,
        required this.address,
    });
   String amount;
    String firstName;
    String lastName;
    String stateOrigin;
    String stateResidence;
    String certificate;
    String motivation;
    String aboute;
    String phone;
    String email;
    String address;

    factory RegModel.fromJson(Map<String, dynamic> json) => RegModel(
       amount: json["amount"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        stateOrigin: json["state_origin"],
        stateResidence: json["state_residence"],
        certificate: json["certificate"],
        motivation: json["motivation"],
        aboute: json["aboute"],
        phone: json["phone"],
        email: json["email"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "state_origin": stateOrigin,
        "state_residence": stateResidence,
        "certificate": certificate,
        "motivation": motivation,
        "aboute": aboute,
        "phone": phone,
        "email": email,
        "address": address,
        "amount" : amount
    };
}
