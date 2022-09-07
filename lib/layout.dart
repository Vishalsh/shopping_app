import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shopping_app/pages/wishlist.dart';

import 'pages/cart.dart';
import 'pages/catalog.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  var activeBottomTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    var tabIndexWidgetMap = HashMap<int, Widget>.from({
      0: const Catalog(),
      1: const Cart(),
      2: const Wishlist(),
    });
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          elevation: 0,
          title: const Text("Shopping App"),
        ),
        body: tabIndexWidgetMap[activeBottomTabIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: activeBottomTabIndex,
          onTap: (index) {
            setState(() {
              activeBottomTabIndex = index;
            });
          },
          backgroundColor: Colors.white,
          selectedItemColor: Colors.orange,
          items: const [
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.home_rounded),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.shopping_cart),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.monitor_heart_rounded),
            ),
          ],
        ));
  }
}
