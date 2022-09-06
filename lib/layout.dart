import 'package:flutter/material.dart';

import 'pages/catalog.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Catalog"),
      ),
      body: const Catalog(),
    );
  }
}
