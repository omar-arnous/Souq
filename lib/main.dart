import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:souq/routes.dart';
import 'package:souq/services/api_client.dart';
import 'package:souq/services/cahce_storage.dart';
import 'package:souq/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheStorage.init();
  ApiClient.init();
  runApp(
    const ProviderScope(
      child: Souq(),
    ),
  );
}

class Souq extends StatelessWidget {
  const Souq({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = Routes();
    return MaterialApp.router(
      color: const Color(0xff1DE9B6),
      title: 'Souq',
      theme: SouqTheme.theme(),
      routerConfig: routes.getRouter,
    );
  }
}
