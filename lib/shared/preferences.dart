import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;
  static String _name = '';
  static String _email = '';
  static String _numberPhone = '';
  static String _direction = '';
  static String _siteweb = '';

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

  static String get email {
    return _prefs.getString('email') ?? _email;
  }

  static set email(String email) {
    _email = email;
    _prefs.setString('email', email);
  }

  static String get numberPhone {
    return _prefs.getString('numberPhone') ?? _numberPhone;
  }

  static set numberPhone(String numberPhone) {
    _numberPhone = numberPhone;
    _prefs.setString('numberPhone', numberPhone);
  }

  static String get direction {
    return _prefs.getString('direction') ?? _direction;
  }

  static set direction(String direction) {
    _direction = direction;
    _prefs.setString('direction', direction);
  }

  static String get siteweb {
    return _prefs.getString('siteweb') ?? _siteweb;
  }

  static set siteweb(String siteweb) {
    _siteweb = siteweb;
    _prefs.setString('siteweb', siteweb);
  }
}
