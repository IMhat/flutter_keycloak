import 'dart:convert';

import 'package:http/http.dart' as http;

// String apiKey = "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";
String apiKey = "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";

class ApiServices {
  static String baseUrl = "https://api.openai.com/v1/completions";

  static Map<String, String> header = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept-Language': 'es-419',
    'Authorization': 'Bearer $apiKey',
  };

  static sendMessage(String? message) async {
    var res = await http.post(
      Uri.parse(baseUrl),
      headers: header,
      body: jsonEncode({
        "model": "text-davinci-003",
        "prompt": '$message',
        "temperature": 0,
        "max_tokens": 100,
        "top_p": 1,
        "frequency_penalty": 0.0,
        "presence_penalty": 0.0,
        "stop": [" Human:", " AI:"],
      }),
    );

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body.toString()

          //data = utf8.decode(resp.bodyBytes)

          );

      var msg = data['choices'][0]['text'];
      return msg;
    } else {
      print("Failed to fetch data");
    }
  }
}
