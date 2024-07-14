import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    super.key,
  });

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
            Column(
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
                Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/product');
                          },
                          child: const SizedBox(
                            width: 300,
                            height: 500,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
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
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 5),
                    const Column(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 250,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/pic3.jpg'),
                              ),
                              color: Colors.grey,
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
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          width: 150,
                          height: 250,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
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
                        ),
                      ],
                    ),
                    const SizedBox(width: 5),
                    const Column(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 250,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
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
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          width: 150,
                          height: 250,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
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
                        ),
                      ],
                    ),
                    const SizedBox(width: 5),
                    const Column(
                      children: [
                        SizedBox(
                          width: 300,
                          height: 250,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
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
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            SizedBox(
                              width: 150,
                              height: 250,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
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
                            ),
                            SizedBox(width: 5),
                            SizedBox(
                              width: 150,
                              height: 250,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
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
                            ),
                          ],
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.abc,
        ),
        const SizedBox(width: 20),
        const Text('Подборки'),
        const SizedBox(width: 15),
        const Text('Каталог'),
        const SizedBox(width: 40),
        // const TextField(),
        const SizedBox(width: 20),
        GestureDetector(child: const Text('RU')),
        const VerticalDivider(
          width: 3,
          color: Colors.black,
        ),
        GestureDetector(
          child: const Text('EN'),
        ),
        const SizedBox(width: 15),
        const Icon(Icons.abc), const Text('0'),
        const SizedBox(width: 15),
        const Text('Войти'),
      ],
    );
  }
}
