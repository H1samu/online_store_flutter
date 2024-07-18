import 'package:flutter/material.dart';
import 'package:online_store_flutter/screens/menu_screen.dart/menu_screen.dart';
import 'package:online_store_flutter/screens/product_screen.dart/product_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      routes: {
        '/product': (context) => const ProductScreen(),
      },
      home: const MenuScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
