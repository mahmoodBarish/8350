import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/high_fidelity_onboarding_screen.dart';
import 'screens/home_page.dart';
import 'screens/detail_item_screen.dart';
import 'screens/order_screen.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/high_fidelity_onboarding',
  routes: <RouteBase>[
    GoRoute(
      path: '/high_fidelity_onboarding',
      builder: (BuildContext context, GoRouterState state) {
        return const HighFidelityOnboardingScreen();
      },
    ),
    GoRoute(
      path: '/home_page',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/detail_item',
      builder: (BuildContext context, GoRouterState state) {
        return const DetailItemScreen();
      },
    ),
    GoRoute(
      path: '/order',
      builder: (BuildContext context, GoRouterState state) {
        return const OrderScreen();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Coffee App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}