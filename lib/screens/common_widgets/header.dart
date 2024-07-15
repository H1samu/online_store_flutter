import 'package:flutter/material.dart';

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
