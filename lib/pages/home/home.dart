import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:shopping_app/layout.dart';

import 'cart.dart';
import 'catalog.dart';
import 'wishlist.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DrawerHeader(
            child: CircleAvatar(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              child: Text(
                "U",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          ListTile(
            title: const Text("Account"),
            onTap: () {
              Navigator.pushNamed(context, '/account');
            },
          ),
          ListTile(
            title: const Text("Orders"),
            onTap: () {
              Navigator.pushNamed(context, '/orders');
            },
          ),
          ListTile(
            title: const Text("Settings"),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          Expanded(
            child: Container(),
          ),
          ListTile(
            title: const Text("Logout"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

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
