import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as root_bundle;

class ProductCardInside extends StatefulWidget {
  const ProductCardInside({
    super.key,
  });

  @override
  State<ProductCardInside> createState() => _ProductCardInsideState();
}

class _ProductCardInsideState extends State<ProductCardInside> {
  List<dynamic>? products;

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  Future<void> fetchProduct() async {
    // Загрузка файла product.json
    final String response =
        await root_bundle.rootBundle.loadString('assets/product.json');
    final data = await json.decode(response);

    // Преобразование json строки в карту (Map)
    setState(() {
      products = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 25,
      ),
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
    const emptyText = Text('');
    return Column(
      children: [
        Row(
          children: [
            products != null ? Text(products![0]["catalog"]) : emptyText,
            const SizedBox(width: 10),
            Container(
              width: 20,
              height: 1,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            products != null ? Text(products![0]["category"]) : emptyText,
            const SizedBox(width: 10),
            Container(
              width: 20,
              height: 1,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            products != null ? Text(products![0]["title"]) : emptyText,
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
                  products != null ? Text(products![0]["title"]) : emptyText,
                  const SizedBox(height: 10),
                  products != null ? Text(products![0]["category"]) : emptyText,
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
                child: products != null
                    ? Text('Купить ${products![0]["price"]} ₽')
                    : emptyText,
              )
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
          child: productImageCard(),
        ),
        StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 2,
            child: productImageCard()),
        StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 2,
            child: productImageCard()),
        StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 2,
            child: productImageCard()),
        StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 2,
            child: productImageCard()),
        StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 2,
            child: productImageCard()),
        StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 2,
            child: productImageCard()),
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
                  const Text('Описание товара <Заголовок>'),
                  const SizedBox(height: 10),
                  products != null
                      ? Text(products![0]["description"])
                      : const Text('')
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

  Widget productImageCard() {
    if (products == null || products!.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return FutureBuilder<void>(
      future: Future.delayed(
          const Duration(seconds: 1)), // Задержка для изображения
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.grey),
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(products![0]["image"]),
              ),
            ),
          );
        }
      },
    );
  }
}
