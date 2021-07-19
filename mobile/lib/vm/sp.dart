import 'package:shared_preferences/shared_preferences.dart';

class SP {
  // Save To Key
  static Future save(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    //print('Saved : ' + key + " Value : " + value);
  }

  // Get Current Token
  static Future getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    return token;
  }

  // Get Current Others
  static Future getOthers(other) async {
    final prefs = await SharedPreferences.getInstance();
    String x = prefs.getString(other);
    return x;
  }
}
