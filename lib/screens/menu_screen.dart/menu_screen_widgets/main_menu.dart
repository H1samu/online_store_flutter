import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
        StaggeredGrid.count(
          crossAxisCount: 18,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: const [
            StaggeredGridTile.count(
              crossAxisCellCount: 6,
              mainAxisCellCount: 8,
              child: ProductCardOutside(),
            ),
            StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 4,
                child: ProductCardOutside()),
            StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 4,
                child: ProductCardOutside()),
            StaggeredGridTile.count(
                crossAxisCellCount: 6,
                mainAxisCellCount: 4,
                child: ProductCardOutside()),
            StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 4,
                child: ProductCardOutside()),
            StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 4,
                child: ProductCardOutside()),
            StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 4,
                child: ProductCardOutside()),
            StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 4,
                child: ProductCardOutside()),
          ],
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
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color(0xffe1e1e1),
          image: DecorationImage(
            image: AssetImage('assets/images/pic3.jpg'),
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
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Название товара',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
                  ),
                  Text(
                    'Категория',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    '50 Р',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Column buildBestNovelties() => const Column();
