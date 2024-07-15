import 'package:flutter/material.dart';
import 'package:online_store_flutter/screens/common_widgets/app_bar/app_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({
    super.key,
  });

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ShopAppBar(),
      body: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text('Хиты продаж'),
                  Text('Смотреть все'),
                ],
              ),
              const SizedBox(height: 20),
              StaggeredGrid.count(
                crossAxisCount: 6,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: const [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: ProductCardOutside(),
                  ),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: ProductCardOutside()),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: ProductCardOutside()),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: ProductCardOutside()),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: ProductCardOutside()),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: ProductCardOutside()),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: ProductCardOutside()),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: ProductCardOutside()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductCardOutside extends StatelessWidget {
  const ProductCardOutside({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/product');
      },
      child: const DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.grey,
          image: DecorationImage(
            image: AssetImage('assets/images/pic3.jpg'),
          ),
        ),
        child: Column(
          children: [
            Text('4.5'),
            Spacer(),
            Text('Название товара'),
            Text('Категория'),
            Text('50 Р'),
          ],
        ),
      ),
    );
  }
}




/*
точные цифры

final screenWidth = MediaQuery.sizeOf(context).width - 40 - 40;

    final bigImageWidth = screenWidth / 3.09;
    final bigImageHeight = bigImageWidth / 0.827;

    final smallImageHeight = (bigImageHeight - 20) / 2;
    final smallImageWidth = smallImageHeight * 0.82;

    final midImageWidth = 2 * smallImageWidth + 20;
    final midImageHeight = smallImageHeight;
*/