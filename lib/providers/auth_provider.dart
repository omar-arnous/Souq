import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:souq/services/api_client.dart';
import 'package:souq/services/cahce_storage.dart';

import '../models/user.dart';

class AuthNotifier extends StateNotifier<Object> {
  AuthNotifier() : super({});

  Future<bool> login(String email, String pass) async {
    User user = User(email: email, pass: pass);
    final object = user.login();
    try {
      final response = await ApiClient.login(object);
      print(response);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<Object> signup(User user) async {
    final userCredentials = user.signin();
    final response = await ApiClient.login(userCredentials);
    print(response);
    return response;
  }

  logout() async {
    await CacheStorage.removeCache('token');
  }
}

final authProvider =
    StateNotifierProvider<AuthNotifier, Object>((ref) => AuthNotifier());
