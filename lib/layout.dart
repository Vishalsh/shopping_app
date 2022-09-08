import 'package:flutter/material.dart';

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
            title: const Text("Home"),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
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

class Layout extends StatefulWidget {
  final Widget child;
  final Widget? bottomNavigationBar;
  const Layout({super.key, required this.child, this.bottomNavigationBar});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  var activeBottomTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideDrawer(),
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: const Text("Shopping App"),
      ),
      body: widget.child,
      bottomNavigationBar:
          widget.bottomNavigationBar ?? null,
    );
  }
}
