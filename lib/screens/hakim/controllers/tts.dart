import 'dart:io';

import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  static FlutterTts tts = FlutterTts();

  static initTTS() {
    // tts.setLanguage("en-US");
   
    tts.setLanguage("bn-BD-language");
    tts.setPitch(1.0);
    tts.synthesizeToFile("Hello soy siri", Platform.isMacOS ? "tts.wav" : "tts.caf");
    tts.setVoice({"name": "Siri", "locale": "es-MX"});
  }

  static speak(String text) async {
    
    tts.setStartHandler(() {
      print('TTS IS STARTED');
    });

    tts.setCompletionHandler(() {
      print('COMPLETED');
    });

    tts.setErrorHandler((message) {
      print(message);
    });
    await tts.awaitSpeakCompletion(true);

    tts.speak(text);
  }
}
