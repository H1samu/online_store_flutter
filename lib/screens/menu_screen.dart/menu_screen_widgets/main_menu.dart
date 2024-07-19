import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:online_store_flutter/product_model/product_model.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 25,
      ),
      child: ListView(
        children: [
          buildSalesHit(),
          buildBestNovelties(),
        ],
      ),
    );
  }

  Column buildSalesHit() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Хиты продаж',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
            ),
            SizedBox(width: 20),
            Text(
              'Смотреть все',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        const SizedBox(height: 20),
        FutureBuilder<List<ProductModel>>(
          future: loadProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              final products = snapshot.data!;
              return StaggeredGrid.count(
                crossAxisCount: 12,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 4,
                    mainAxisCellCount: 6,
                    child: ProductCardOutside(product: products[0]),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 3,
                    child: ProductCardOutside(product: products[1]),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 3,
                    child: ProductCardOutside(product: products[2]),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 4,
                    mainAxisCellCount: 3,
                    child: ProductCardOutside(product: products[3]),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 3,
                    child: ProductCardOutside(product: products[4]),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 3,
                    child: ProductCardOutside(product: products[5]),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 3,
                    child: ProductCardOutside(product: products[6]),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 3,
                    child: ProductCardOutside(product: products[7]),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Future<List<ProductModel>> loadProducts() async {
    final jsonString = await rootBundle.loadString('assets/product.json');
    final jsonResponse = json.decode(jsonString) as List;
    return jsonResponse
        .map((product) => ProductModel.fromJson(product))
        .toList();
  }
}

class ProductCardOutside extends StatelessWidget {
  final ProductModel product;
  const ProductCardOutside({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/product', arguments: product);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: 55,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      border: Border.all(color: const Color(0xffa6a4a4))),
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('4.5'),
                        SizedBox(width: 5),
                        Icon(
                          Icons.star,
                          size: 17,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 16 / 10,
                child: Image.network(
                  product.images.isNotEmpty
                      ? product.images.first
                      : 'assets/images/pic3.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      product.title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      product.category,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${product.price.toString()} \$',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Column buildBestNovelties() => const Column();
