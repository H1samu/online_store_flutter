import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_store_flutter/screens/common_widgets/model/product_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:online_store_flutter/screens/common_widgets/provider/rating_provider.dart';
import 'package:provider/provider.dart';

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
          decoration: const BoxDecoration(color: Color(0xffE1E1E1)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: FaIcon(
                      FontAwesomeIcons.frog,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        widget.product.title,
                        style: const TextStyle(fontSize: 20),
                        overflow: TextOverflow.fade,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.product.category,
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 2, color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: GestureDetector(
                        onTap: () {
                          const snackBar = SnackBar(
                              content: Text('Товар добавлен в желаемое'),
                              duration: Duration(seconds: 2));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Text('Добавить в Желаемое'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      const snackBar = SnackBar(
                          content: Text('Товар добавлен в корзину'),
                          duration: Duration(seconds: 2));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 2, color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        child: Text(
                          'Купить ${widget.product.price} \$',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                ],
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
            decoration: const BoxDecoration(color: Color(0xffE1E1E1)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Описание товара',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Общий рейтинг',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 10),
                  FaIcon(
                    FontAwesomeIcons.circleQuestion,
                    size: 16,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<RatingProvider>(
                    builder: (context, ratingProvider, child) {
                      double rating =
                          ratingProvider.getRating(widget.product.id);
                      return Text(
                        rating.toString(),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w300,
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 20),
                  Consumer<RatingProvider>(
                      builder: (context, ratingProvider, child) {
                    return RatingBar.builder(
                      initialRating:
                          ratingProvider.getRating(widget.product.id),
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        ratingProvider.updateRating(widget.product.id, rating);
                      },
                    );
                  }),
                ],
              ),
              const SizedBox(height: 10),
            ],
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
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.contain,
          placeholder: (context, url) => const SizedBox(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
