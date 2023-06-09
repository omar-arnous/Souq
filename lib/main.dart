import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:souq/screens/layout.dart';
import 'package:souq/services/api_client.dart';
import 'package:souq/theme.dart';

void main() {
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
    return MaterialApp(
      color: const Color(0xff1DE9B6),
      title: 'Souq',
      theme: SouqTheme.theme(),
      home: const Layout(),
    );
  }
}
