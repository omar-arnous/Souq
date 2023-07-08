import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:souq/services/cahce_storage.dart';
import 'package:souq/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      appStart();
    });
    super.initState();
  }

  void appStart() {
    if (CacheStorage.getCache(kToken) == "") {
      context.pushReplacement('/login');
    } else {
      context.pushReplacement('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/souq.png'),
          fit: BoxFit.contain,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
