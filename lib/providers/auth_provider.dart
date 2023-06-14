import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:souq/services/api_client.dart';

import '../models/user.dart';

class AuthNotifier extends StateNotifier<Object> {
  AuthNotifier() : super({});

  Future<Object> login(User user) async {
    final response = await ApiClient.login(user);
    print(response);
    return response;
  }

  Future<Object> signup(User user) async {
    final userCredentials = user.signin();
    final response = await ApiClient.login(userCredentials);
    print(response);
    return response;
  }
}

final authProvider =
    StateNotifierProvider<AuthNotifier, Object>((ref) => AuthNotifier());
