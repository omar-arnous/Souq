import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:souq/services/api_client.dart';
import 'package:souq/services/cahce_storage.dart';
import 'package:souq/utils/constants.dart';

import '../models/user.dart';

class AuthNotifier extends StateNotifier<Object> {
  AuthNotifier() : super({});

  Future<bool> login(String email, String pass) async {
    User user = User(email: email, pass: pass);
    final object = user.login();
    try {
      final response = await ApiClient.login(object);
      final data = response.data['existingUser'];
      CacheStorage.setCache(kToken, data['token']);
      CacheStorage.setCache(kName, data['name']);
      CacheStorage.setCache(kId, data['_id']);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> signup(
    String name,
    String email,
    String confirmEmail,
    String pass,
  ) async {
    User user = User(
      name: name,
      email: email,
      confirmEmail: confirmEmail,
      pass: pass,
    );
    final userCredentials = user.signin();
    try {
      final response = await ApiClient.signup(userCredentials);
      final data = response.data['enteredData'];
      CacheStorage.setCache(kToken, data['token']);
      CacheStorage.setCache(kName, data['name']);
      CacheStorage.setCache(kId, data['_id']);
      return true;
    } catch (err) {
      return false;
    }
  }

  logout() async {
    await CacheStorage.removeCache(kToken);
    await CacheStorage.removeCache(kId);
    await CacheStorage.removeCache(kName);
  }
}

final authProvider =
    StateNotifierProvider<AuthNotifier, Object>((ref) => AuthNotifier());
