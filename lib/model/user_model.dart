class UserModel {
  int id = 0;
  String name = '';
  String email = '';
  String phone = '';
  String amount = '';
  String ctitle = '';
  String cimage = '';
  String updatedAt = '';
  String createdAt = '';

  UserModel({
    required this.name, 
  required this.amount,
   required this.email, 
   required this.phone, 
   required this.id,


        required this.createdAt,
        required this.ctitle,
        required this.cimage,
   
   });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name']??'';
    email = json['email']??'';
    phone = json['phone']??'';
    amount = json['amount']??'';
    ctitle = json['ctitle']??'';
    cimage = json['cimage']??'';
    createdAt = json['created_at']??'';
    updatedAt = json['updated_at']??'';
  }


}
