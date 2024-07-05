import 'dart:convert';
import 'package:imake/tasks/data/local/model/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenRepository {
  static const _tokenKey = 'userToken';

  // Save the Token object to SharedPreferences
  Future<void> saveToken() async {
    final prefs = await SharedPreferences.getInstance();
    final effectiveToken = Token.generateDynamicToken();

    final tokenJson = json.encode(effectiveToken.toJson());
    await prefs.setString(_tokenKey, tokenJson);
  }

  // Retrieve the Token object from SharedPreferences
  Future<Token?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final tokenJson = prefs.getString(_tokenKey);
    if (tokenJson != null) {
      // Convert JSON string back to a Token object
      return Token.fromJson(json.decode(tokenJson));
    }
    return null;
  }

  // Remove the Token object from SharedPreferences
  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  // Check if the Token object exists in SharedPreferences
  Future<bool> hasToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_tokenKey);
  }
}
