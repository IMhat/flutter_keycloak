import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../helper/constants.dart';
import '../models/auth_id_token.dart';
import '../models/auth_user.dart';

typedef AsyncCallBackString = Future<String> Function();

class _LoginInfo extends ChangeNotifier {
  var _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }
}

class AuthService {
  static final AuthService instance = AuthService._internal();

  factory AuthService() {
    return instance;
  }

  AuthService._internal();

  final _loginInfo = _LoginInfo();

  String? accessToken;
  AuthIdToken? authIdToken;
  String? idTokenRaw;
  AuthUser? profile;

  get logininfo => _loginInfo;

  /// ---------------------------------------
  ///   1 -instantiate appauth
  /// ---------------------------------------

  final appAuth = FlutterAppAuth();

  /// ---------------------------------------
  ///   2 - instantiate secure storage
  /// ---------------------------------------

  final secureStoreage = FlutterSecureStorage();

  /// ---------------------------------------
  ///   3 - init
  /// ---------------------------------------

  Future<String> init() async {
    return errorHandler(() async {
      final securedRefreshToken =
          await secureStoreage.read(key: AUTH_REFRESH_TOKEN_KEY);

      if (securedRefreshToken == null) {
        return 'You need to login!';
      }

      final response = await appAuth.token(
        TokenRequest(AUTH_CLIENT_ID, AUTH_REDIRECT_URI,
            issuer: AUTH_ISSUER, refreshToken: securedRefreshToken),
      );

      return await _setLocalVariables(response);
    });
  }

  /// ---------------------------------------
  ///   4 - login
  /// ---------------------------------------

  bool isAuthResultValide(TokenResponse? response) {
    return response?.accessToken != null && response?.idToken != null;
  }

  Future<String> _setLocalVariables(TokenResponse? result) async {
    if (this.isAuthResultValide(result)) {
      accessToken = result!.accessToken!;
      idTokenRaw = result.idToken!;
      authIdToken = parseIdToken(idTokenRaw!);

      profile = await getUserDetails(accessToken!);

      if (result.refreshToken != null) {
        await secureStoreage.write(
            key: AUTH_REFRESH_TOKEN_KEY, value: result.refreshToken);
      }

      _loginInfo.isLoggedIn = true;

      return 'SUCCESS';
    }

    return 'Passing Token went wrong';
  }

  Future<String> errorHandler(AsyncCallBackString callback) async {
    try {
      return callback();
    } on TimeoutException catch (e) {
      return e.message ?? 'Timeout Error!';
    } on FormatException catch (e) {
      return e.message;
    } on SocketException catch (e) {
      return e.message;
    } on PlatformException catch (e) {
      return e.message ?? 'Something is Wrong!';
    } catch (e) {
      return 'Unknown Error ${e.runtimeType}';
    }
  }

  Future<String> login() async {
    // try {
    // Create Request
    final authorizationTokenRequest = AuthorizationTokenRequest(
        AUTH_CLIENT_ID, AUTH_REDIRECT_URI,
        issuer: AUTH_ISSUER,
        scopes: ['openid', 'profile', 'email', 'offline_access'],
        promptValues: ['login'],
        allowInsecureConnections: true // <-- add this
        );

    // Call Keycloak for authorize and exchange code
    final result =
        await appAuth.authorizeAndExchangeCode(authorizationTokenRequest);

    return _setLocalVariables(result);
    // } catch (e, s) {
    //   print('login error: $e - stack: $s');

    //   // setState(() {
    //   //   isBusy = false;
    //   //   isLoggedIn = false;
    //   //   errorMessage = e.toString();
    //   // });
    // }
  }

  // Future<void> login() async {
  //   // setState(() {
  //   //   isBusy = true;
  //   //   errorMessage = '';
  //   // });

  //   try {
  //     // final AuthorizationTokenResponse result =
  //     //     await appAuth.authorizeAndExchangeCode(
  //     //   AuthorizationTokenRequest(
  //     //     AUTH0_CLIENT_ID,
  //     //     AUTH0_REDIRECT_URI,
  //     //     allowInsecureConnections: true,
  //     //     issuer: 'http://$AUTH0_DOMAIN/realms/smiley',
  //     //     scopes: ['openid', 'profile', 'email', 'offline_access'],
  //     //     promptValues: ['login'],
  //     //   ),
  //     // );

  //     // Create Request
  //     final authorizationTokenRequest = AuthorizationTokenRequest(
  //         AUTH_CLIENT_ID, AUTH_REDIRECT_URI,
  //         issuer: AUTH_ISSUER,
  //         scopes: ['openid', 'profile', 'email', 'offline_access'],
  //         promptValues: ['login'],
  //         allowInsecureConnections: true // <-- add this
  //         );

  //     // Call Keycloak for authorize and exchange code
  //     final result =
  //         await appAuth.authorizeAndExchangeCode(authorizationTokenRequest);

  //     // final idToken = parseIdToken(result?.idToken);
  //     // final profile = await getUserDetails(result?.accessToken);

  //     accessToken = result!.accessToken!;
  //     idTokenRaw = result.idToken!;
  //     authIdToken = parseIdToken(idTokenRaw!);

  //     profile = await getUserDetails(accessToken!);

  //     if (result.refreshToken != null) {
  //       await secureStoreage.write(
  //           key: AUTH_REFRESH_TOKEN_KEY, value: result.refreshToken);
  //     }

  //     _loginInfo.isLoggedIn = true;

  //     await secureStoreage.write(
  //         key: 'refresh_token', value: result.refreshToken);

  //     // setState(() {
  //     //   isBusy = false;
  //     //   isLoggedIn = true;
  //     //   name = idToken['name'];
  //     //   picture = profile['picture'];
  //     // });
  //   } catch (e, s) {
  //     print('login error: $e - stack: $s');

  //     // setState(() {
  //     //   isBusy = false;
  //     //   isLoggedIn = false;
  //     //   errorMessage = e.toString();
  //     // });
  //   }
  // }

  /// ---------------------------------------
  ///   5 - logout
  /// ---------------------------------------

  logout() async {
    await secureStoreage.delete(key: AUTH_REFRESH_TOKEN_KEY);

    final request = EndSessionRequest(
        idTokenHint: idTokenRaw!,
        issuer: AUTH_ISSUER,
        postLogoutRedirectUrl: AUTH_REDIRECT_URI);

    await appAuth.endSession(request);
    _loginInfo.isLoggedIn = false;
  }

  /// ---------------------------------------
  ///   6 - parseIdToken
  /// ---------------------------------------

  AuthIdToken parseIdToken(String idToken) {
    final parts = idToken.split(r'.');

    final Map<String, dynamic> json = jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));

    return AuthIdToken.fromJson(json);
  }

  /// ---------------------------------------
  ///   7 - getUserDetails
  /// ---------------------------------------

  Future<AuthUser> getUserDetails(String accessToken) async {
    final url = Uri.http(
        AUTH_DOMAIN, '/realms/${AUTH_REALMS}/protocol/openid-connect/userinfo'
        // '/auth/realms/${AUTH_REALMS}/protocol/openid-connect/userinfo'
        );

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return AuthUser.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get user details!');
    }
  }
}
