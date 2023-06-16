import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 48,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'username:',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(width: 18),
              Text(
                'Omar Arnous',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
          const SizedBox(height: 36),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
