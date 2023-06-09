import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:souq/providers/app_provider.dart';
import 'package:souq/providers/cart_provider.dart';
import 'package:souq/screens/cart.dart';
import 'package:souq/screens/home.dart';
import 'package:souq/screens/orders.dart';
import 'package:souq/screens/profile.dart';

const screens = [
  HomeScreen(),
  OrdersScreen(),
  CartScreen(),
  ProfileScreen(),
];

class Layout extends ConsumerWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final app = ref.watch(appProvider);
    final cart = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('SouQ'),
      ),
      body: IndexedStack(index: app["selectedTab"]!, children: screens),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: BottomNavigationBar(
            currentIndex: app["selectedTab"]!,
            onTap: (index) {
              ref.read(appProvider.notifier).toggleSelectedTab(index);
            },
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.receipt),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: Stack(children: [
                  const Icon(Icons.shopping_cart),
                  Badge(
                    textColor: Colors.white,
                    smallSize: 15,
                    backgroundColor: const Color(0xff1DE9B6),
                    alignment: Alignment.topRight,
                    label: Text('${cart.length}'),
                  ),
                ]),
                label: 'Cart',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
