import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:shopping_app/layout.dart';

import 'cart.dart';
import 'catalog.dart';
import 'wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var activeBottomTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    var tabIndexWidgetMap = HashMap<int, Widget>.from({
      0: const Catalog(),
      1: const Cart(),
      2: const Wishlist(),
    });

    return Layout(
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
      ),
      child: tabIndexWidgetMap[activeBottomTabIndex]!,
    );
  }
}
