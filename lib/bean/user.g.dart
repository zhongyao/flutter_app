// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, String> json) {
  return User(json['firstName'] as String, json['address'] as String);
}

Map<String, String> _$UserToJson(User instance) => <String, String>{
      'firstName': instance.firstName,
      'address': instance.address,
    };
