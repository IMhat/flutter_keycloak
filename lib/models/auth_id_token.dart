import 'package:json_annotation/json_annotation.dart';

part 'auth_id_token.g.dart';

@JsonSerializable()
class AuthIdToken {
  AuthIdToken(
      {required this.email,
      required this.exp,
      required this.iat,
      required this.iss,
      required this.sub,
      required this.aud,
      this.authTime});

  final String email;

  final String iss;
  final String sub;
  final String aud;

  final int exp;
  final int iat;

  @JsonKey(name: 'auth_time')
  final int? authTime;

  factory AuthIdToken.fromJson(Map<String, dynamic> json) =>
      _$AuthIdTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AuthIdTokenToJson(this);
}
