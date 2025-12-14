import 'package:shared_preferences/shared_preferences.dart';

class SharedPre {
 static Future saveStringData(String key, String value) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }

 static Future saveIntData(String key, int value) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setInt(key, value);
  }

 static Future getString(String key) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.getString(key);
  }

 static Future getInt(String key) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.getInt(key);
  }

 static Future removeData(String key) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }
}
