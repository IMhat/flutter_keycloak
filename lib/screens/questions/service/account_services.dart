import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:keycloakflutter/helper/constants/utils.dart';
import 'package:keycloakflutter/models/accounts.dart';
import 'package:keycloakflutter/models/question.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../../../helper/constants/error_handling.dart';
import '../../../helper/constants/global_variables.dart';
import '../../../providers/user_provider.dart';

class AccountServices {
  //Questionss accounts connect!!
  Future<List<AccountsConnect>> fetchAccounts({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<AccountsConnect> accountsList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get-accounts'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            accountsList.add(
              AccountsConnect.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return accountsList;
  }

//Questionss!!
  Future<List<Question>> fetchQuestions({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Question> questionList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get-questions'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            questionList.add(
              Question.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return questionList;
  }
}
