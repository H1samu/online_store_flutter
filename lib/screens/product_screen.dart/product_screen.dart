import 'package:flutter/material.dart';
import 'package:frog_go_shop/screens/common_widgets/model/product_model.dart';

import 'package:frog_go_shop/screens/common_widgets/app_bar/app_bar.dart';
import 'package:frog_go_shop/screens/product_screen.dart/product_screen_widgets/product_card.dart';

class ProductScreen extends StatelessWidget {
  final ProductModel product;
  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ShopAppBar(),
      body: ProductCardInside(
        product: product,
      ),
    );
  }
}
