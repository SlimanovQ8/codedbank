import 'package:json_annotation/json_annotation.dart';

part "user.g.dart";

@JsonSerializable()
class User {
  int? id;
  String UserName;
  String? password;
  String image;


factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

//<editor-fold desc="Data Methods">

  User({
    this.id,
    required this.UserName,
    password,
    required this.image,
  });

  
 
//</editor-fold>
}
