import 'package:flutter/material.dart';
import 'package:frog_go_shop/screens/common_widgets/model/product_model.dart';
import 'package:frog_go_shop/screens/common_widgets/provider/rating_provider.dart';
import 'package:frog_go_shop/screens/menu_screen.dart/menu_screen.dart';
import 'package:frog_go_shop/screens/product_screen.dart/product_screen.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RatingProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => const MenuScreen(),
          '/product': (context) {
            final arguments =
                ModalRoute.of(context)!.settings.arguments as ProductModel?;
            if (arguments == null) {
              return const MenuScreen();
            }
            return ProductScreen(product: arguments);
          },
        },
        home: const MenuScreen(),
      ),
    );
  }
}
