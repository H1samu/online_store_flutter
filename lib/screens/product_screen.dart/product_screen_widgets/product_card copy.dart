import 'package:flutter/material.dart';
import 'package:online_store_flutter/model/product_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductCardInside extends StatefulWidget {
  final ProductModel product;
  const ProductCardInside({
    super.key,
    required this.product,
  });

  @override
  State<ProductCardInside> createState() => _ProductCardInsideState();
}

class _ProductCardInsideState extends State<ProductCardInside> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
      child: ListView(
        children: [
          buildHeader(),
          const SizedBox(height: 20),
          buildStaggeredGrid(),
          const SizedBox(height: 46),
          buildDescription(),
        ],
      ),
    );
  }

  Column buildHeader() {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 10),
            Text(widget.product.catalog),
            const SizedBox(width: 10),
            Container(
              width: 20,
              height: 1,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            Text(widget.product.category),
            const SizedBox(width: 10),
            Container(
              width: 20,
              height: 1,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            Text(widget.product.title),
          ],
        ),
        const SizedBox(height: 20),
        DecoratedBox(
          decoration: const BoxDecoration(color: Colors.grey),
          child: Row(
            children: [
              const Icon(Icons.face),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.title),
                  const SizedBox(height: 10),
                  Text(widget.product.category),
                ],
              ),
              const Spacer(),
              const DecoratedBox(
                decoration: BoxDecoration(),
                child: Text(
                  'Добавить в Желаемое',
                ),
              ),
              const SizedBox(width: 20),
              DecoratedBox(
                decoration: const BoxDecoration(),
                child: Text('Купить ${widget.product.price} ₽'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  StaggeredGrid buildStaggeredGrid() {
    return StaggeredGrid.count(
      crossAxisCount: 18,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 12,
          mainAxisCellCount: 6,
          child: productImageCard(
              widget.product.images.isNotEmpty ? widget.product.images[0] : ''),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 3,
          mainAxisCellCount: 2,
          child: productImageCard(
              widget.product.images.length > 1 ? widget.product.images[1] : ''),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 3,
          mainAxisCellCount: 2,
          child: productImageCard(
              widget.product.images.length > 2 ? widget.product.images[2] : ''),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 3,
          mainAxisCellCount: 2,
          child: productImageCard(
              widget.product.images.length > 3 ? widget.product.images[3] : ''),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 3,
          mainAxisCellCount: 2,
          child: productImageCard(
              widget.product.images.length > 4 ? widget.product.images[4] : ''),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 3,
          mainAxisCellCount: 2,
          child: productImageCard(
              widget.product.images.length > 5 ? widget.product.images[5] : ''),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 3,
          mainAxisCellCount: 2,
          child: productImageCard(
              widget.product.images.length > 6 ? widget.product.images[6] : ''),
        ),
      ],
    );
  }

  Row buildDescription() {
    // Ширина экрана без паддингов
    double screenWidth = MediaQuery.of(context).size.width - 40 - 40;
    // Ширина большой картинки. 6.7 - некая погрешность
    double screenBig = (screenWidth - 20) / 18 * 12 + 6.7;
    // Ширина двух горизонтальных картинок
    double screenSmall = screenWidth - screenBig - 20;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: screenBig,
          child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.grey),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Описание товара'),
                  const SizedBox(height: 10),
                  Text(widget.product.description),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: screenSmall,
          child: const DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey),
            child: Column(
              children: [
                Text('Общий рейтинг'),
                SizedBox(height: 10),
                Text('4.5'),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget productImageCard(String imageUrl) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.black),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
