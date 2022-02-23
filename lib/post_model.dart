// // To parse this JSON data, do
// //
// //     final campaignModel = campaignModelFromJson(jsonString);

// import 'dart:convert';

// CampaignModel campaignModelFromJson(String str) =>
//     CampaignModel.fromJson(json.decode(str));

// String campaignModelToJson(CampaignModel data) => json.encode(data.toJson());

// class CampaignModel {
//   CampaignModel({
//     required this.id,
//     required this.body,
//   });

//   String id;
//   String body;

//   factory CampaignModel.fromJson(Map<String, dynamic> json) => CampaignModel(
//         id: json["id"],
//          body: json["body"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//          "body": body,
//       };

//   static fromMap(json) {}
// }
