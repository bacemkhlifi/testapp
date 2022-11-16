import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Model/user_model.dart';

class UserRepository {
  final http.Client _client;
  UserRepository(this._client);

  Future<List<User>> getUser(String url) async {
    final http.Response response = await _client.get(Uri.parse(url));
    final Iterable parsed = jsonDecode(response.body);
    final users = parsed.map((user) => User.fromJson(user)).toList();
    // final user = User.fromJson(parsed);
    return users;
  }
}