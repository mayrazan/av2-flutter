import 'dart:convert';
import 'package:imake/tasks/data/local/model/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenRepository {
  static const _tokenKey = 'userToken';

  Future<void> saveToken() async {
    final prefs = await SharedPreferences.getInstance();
    final effectiveToken = Token.generateDynamicToken();

    final tokenJson = json.encode(effectiveToken.toJson());
    await prefs.setString(_tokenKey, tokenJson);
  }

  Future<Token?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final tokenJson = prefs.getString(_tokenKey);
    if (tokenJson != null) {
      return Token.fromJson(json.decode(tokenJson));
    }
    return null;
  }

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  Future<bool> hasToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_tokenKey);
  }
}
