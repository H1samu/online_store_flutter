import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductCardInside extends StatelessWidget {
  const ProductCardInside({
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
            children: [
              const Row(
                children: [
                  Text('Каталог-Категория-Название товара'),
                ],
              ),
              const SizedBox(height: 20),
              const DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey),
                child: Row(
                  children: [
                    Icon(Icons.face),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text('Название товара'),
                        SizedBox(height: 10),
                        Text('Категория'),
                      ],
                    ),
                    Spacer(),
                    DecoratedBox(
                      decoration: BoxDecoration(),
                      child: Text(
                        'Добавить в Желаемое',
                      ),
                    ),
                    SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(),
                      child: Text(
                        'Купить 50 Р',
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              StaggeredGrid.count(
                crossAxisCount: 6,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: const [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 4,
                    mainAxisCellCount: 3,
                    child: ProductImageCard(),
                  ),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: ProductImageCard()),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: ProductImageCard()),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: ProductImageCard()),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: ProductImageCard()),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: ProductImageCard()),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: ProductImageCard()),
                ],
              ),
              const SizedBox(height: 46),
              StaggeredGrid.count(
                crossAxisCount: 6,
                crossAxisSpacing: 20,
                children: const [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 4,
                    mainAxisCellCount: 1,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Описание товара <Заголовок>'),
                            SizedBox(height: 10),
                            Text(
                                'Описание товара Описание товара Описание товара Описание товара Описание товара Описание товара Описание товара Описание товара')
                          ],
                        ),
                      ),
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: Column(
                      children: [
                        Text('Общий рейтинг'),
                        SizedBox(height: 10),
                        Text('4.5'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductImageCard extends StatelessWidget {
  const ProductImageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: AssetImage('assets/images/pic3.jpg'),
        ),
      ),
    );
  }
}
