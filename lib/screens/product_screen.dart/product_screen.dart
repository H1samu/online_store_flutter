import 'package:flutter/material.dart';

import 'package:online_store_flutter/screens/common_widgets/app_bar/app_bar.dart';
import 'package:online_store_flutter/screens/product_screen.dart/product_screen_widgets/product_card.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ShopAppBar(),
      body: ProductCardInside(),
    );
  }
}
