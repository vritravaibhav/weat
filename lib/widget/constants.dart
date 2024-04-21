import 'package:shared_preferences/shared_preferences.dart';

String? token = "lol";

class security {
  void set() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('key', token!);
    print("$token lol");
  }

  Future<String> get() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('key');
    return token!;
  }
}
