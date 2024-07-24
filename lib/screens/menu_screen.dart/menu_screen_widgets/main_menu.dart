import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_store_flutter/model/product_model.dart';
import 'package:online_store_flutter/provider/rating_provider.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({
    super.key,
  });

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final ScrollController _scrollController = ScrollController();
  List<dynamic> items = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/product.json');
    final jsonResponse = json.decode(jsonString);
    setState(() {
      items = jsonResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 25,
        ),
        child: Column(
          children: [
            buildSalesHit(),
            const SizedBox(height: 50),
            buildBestNovelties(),
          ],
        ),
      ),
    );
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 200, // количество пикселей для прокрутки влево
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset +
          200, // количество пикселей для прокрутки вправо
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
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
            } else if (snapshot.hasError) {
              return const Center(child: Text('Ошибка загрузки данных'));
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

  Column buildBestNovelties() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Лучшие новинки',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
            ),
            const SizedBox(width: 20),
            const Text(
              'Смотреть все',
              style: TextStyle(fontSize: 18),
            ),
            const Spacer(),
            Row(
              children: [
                IconButton(
                  icon:
                      const FaIcon(FontAwesomeIcons.squareCaretLeft, size: 30),
                  onPressed: () => _scrollLeft(),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon:
                      const FaIcon(FontAwesomeIcons.squareCaretRight, size: 30),
                  onPressed: () => _scrollRight(),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 350,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  width: 300,
                  child: ProductCardOutside(
                    product: ProductModel.fromJson(items[index]),
                  ),
                ),
              );
            },
          ),
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

// Пробовал размещение изображения разными способами, пока нет идей как сделать правильно
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
          image: DecorationImage(
            alignment: Alignment.center,
            fit: BoxFit.contain,
            image: NetworkImage(
              product.images.isNotEmpty
                  ? product.images.first
                  : 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg',
            ),
          ),
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
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Consumer<RatingProvider>(
                          builder: (context, ratingProvider, child) {
                            return Text(ratingProvider
                                .getRating(product.id)
                                .toString());
                          },
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.star,
                          size: 17,
                        )
                      ],
                    ),
                  ),
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
