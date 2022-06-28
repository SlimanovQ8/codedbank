// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      balance: json['balance'] as int,
      username: json['username'] as String,
     // password: json['password'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'UserName': instance.username,
      // 'password': instance.password,
      'image': instance.image,
    };
