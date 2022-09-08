import 'package:flutter/material.dart';

import 'package:shopping_app/pages/account.dart';
import 'package:shopping_app/pages/home/home.dart';
import 'package:shopping_app/pages/orders.dart';
import 'package:shopping_app/pages/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/account': (context) => const Account(),
        '/orders': (context) => const Orders(),
        '/settings': (context) => const Settings(),
      },
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
    );
  }
}
