import 'package:flutter/material.dart';
import 'package:online_store_flutter/screens/menu_screen.dart/menu_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 25,
        ),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: 30),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 700,
                  height: 500,
                  child: Image.asset('assets/images/pic3.jpg'),
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/images/pic3.jpg'),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/images/pic3.jpg'),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/images/pic3.jpg'),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/images/pic3.jpg'),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/images/pic3.jpg'),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/images/pic3.jpg'),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 700,
                  height: 200,
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
                SizedBox(width: 20),
                Column(
                  children: [
                    Text('Общий рейтинг'),
                    SizedBox(height: 10),
                    Text('4.5'),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
