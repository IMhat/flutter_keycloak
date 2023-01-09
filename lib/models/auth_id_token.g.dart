// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_id_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthIdToken _$AuthIdTokenFromJson(Map<String, dynamic> json) => AuthIdToken(
      email: json['email'] as String,
      exp: json['exp'] as int,
      iat: json['iat'] as int,
      iss: json['iss'] as String,
      sub: json['sub'] as String,
      aud: json['aud'] as String,
      authTime: json['auth_time'] as int?,
    );

Map<String, dynamic> _$AuthIdTokenToJson(AuthIdToken instance) =>
    <String, dynamic>{
      'email': instance.email,
      'iss': instance.iss,
      'sub': instance.sub,
      'aud': instance.aud,
      'exp': instance.exp,
      'iat': instance.iat,
      'auth_time': instance.authTime,
    };
