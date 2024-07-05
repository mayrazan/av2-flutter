import 'dart:convert';
import 'package:imake/tasks/data/local/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static const String _keyUser = 'user';

  Future<void> saveUser(email, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    User user = User(email: email, password: password);
    String userJson = jsonEncode(user.toJson());
    await prefs.setString(_keyUser, userJson);
  }

  Future<User?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(_keyUser);
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return User.fromJson(userMap);
    } else {
      return null;
    }
  }

  Future<bool> checkEmailExists(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(_keyUser);
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return userMap['email'] == email;
    } else {
      return false;
    }
  }
}
