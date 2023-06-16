import 'package:go_router/go_router.dart';
import 'package:souq/screens/layout.dart';
import 'package:souq/screens/login.dart';
import 'package:souq/screens/product_detail.dart';

class Routes {
  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const Layout(),
        routes: [
          GoRoute(
            path: 'product-detail',
            builder: (context, state) {
              final data = state.extra;
              return ProductDetailScreen(data: data);
            },
          ),
        ],
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );

  GoRouter get getRouter => _router;
}
