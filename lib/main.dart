import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/app_router.dart';

void main() {
  runApp(const GoRouterApp());
}

class GoRouterApp extends StatelessWidget {
  const GoRouterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: KAppRouter.router.routerDelegate,
      routeInformationParser: KAppRouter.router.routeInformationParser,
      routeInformationProvider: KAppRouter.router.routeInformationProvider,
      title: 'Go Router Demo',
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/users', extra: 'here we go.');
            },
            child: const Text('View all users'),
          ),
        ],
      ),
    );
  }
}
