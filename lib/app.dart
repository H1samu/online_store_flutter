import 'package:flutter/material.dart';
import 'package:online_store_flutter/model/product_model.dart';
import 'package:online_store_flutter/screens/menu_screen.dart/menu_screen.dart';
import 'package:online_store_flutter/screens/product_screen.dart/product_screen.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => (),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => MenuScreen(),
          '/product': (context) {
            final product =
                ModalRoute.of(context)!.settings.arguments as ProductModel;
            return ProductScreen(product: product);
          },
        },
        home: const MenuScreen(),
      ),
    );
  }
}
