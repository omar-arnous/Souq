import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppNotifier extends StateNotifier<Map<String, dynamic>> {
  AppNotifier()
      : super({
          "loggedIn": false,
          "onBoardingComplete": false,
          "selectedTab": 0,
        });

  void toggleSelectedTab(int index) {
    state = {
      ...state,
      "selectedTab": index,
    };
  }
}

final appProvider = StateNotifierProvider<AppNotifier, Map<String, dynamic>>(
    (ref) => AppNotifier());
