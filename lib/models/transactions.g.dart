// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transctions _$TransctionsFromJson(Map<String, dynamic> json) => Transctions(
      id: json['id'] as int?,
      senderId: json['senderId'] as int,
      receiverId: json['receiverId'] as int,
      amount: json['amount'] as int,
      type: json['type'] as String,
    );

Map<String, dynamic> _$TransctionsToJson(Transctions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'amount': instance.amount,
      'type': instance.type,
    };
