import 'package:flutter/material.dart';
import 'package:shopping_app/pages/account.dart';
import 'package:shopping_app/pages/home/home.dart';
import 'package:shopping_app/pages/orders.dart';
import 'package:shopping_app/pages/settings.dart';

class SideDrawer extends StatelessWidget {
  final NavigatorState navigatorState;

  const SideDrawer({
    super.key,
    required this.navigatorState,
  });

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
              navigatorState.push(
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Account"),
            onTap: () {
              navigatorState.push(
                MaterialPageRoute(
                  builder: (context) => const Account(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Orders"),
            onTap: () {
              navigatorState.push(
                MaterialPageRoute(
                  builder: (context) => const Orders(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Settings"),
            onTap: () {
              navigatorState.push(
                MaterialPageRoute(
                  builder: (context) => const Settings(),
                ),
              );
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
  final NavigatorState? navigatorState;
  const Layout(
      {super.key,
      required this.child,
      this.bottomNavigationBar,
      this.navigatorState});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  var activeBottomTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('app-scaffold'),
      drawer: SideDrawer(
        navigatorState: widget.navigatorState ?? Navigator.of(context),
      ),
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: const Text("Shopping App"),
      ),
      body: widget.child,
      bottomNavigationBar: widget.bottomNavigationBar ?? null,
    );
  }
}
