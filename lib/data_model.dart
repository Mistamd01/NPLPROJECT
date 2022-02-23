// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
    DataModel({
        required this.name,
        required this.email,
        required this.phone,
        required this.password,
    });

    String name;
    String email;
    String phone;
    String password;

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
    };
}
