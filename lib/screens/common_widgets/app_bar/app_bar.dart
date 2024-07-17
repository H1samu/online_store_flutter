import 'package:flutter/material.dart';

class ShopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShopAppBar({
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.accessibility_new_outlined),
      title: const Row(
        children: [
          Text(
            'Подборки',
            style: TextStyle(fontSize: 13),
          ),
          SizedBox(width: 15),
          Text(
            'Каталог',
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
      actions: [
        const SizedBox(
          width: 420,
          height: 42,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 80),
        GestureDetector(child: const Text('RU')),
        const VerticalDivider(indent: 17, endIndent: 17, color: Colors.black),
        GestureDetector(child: const Text('EN')),
        const SizedBox(width: 15),
        const Icon(Icons.abc),
        const Text('0'),
        const SizedBox(width: 15),
        const Text('Войти'),
        const SizedBox(width: 40)
      ],
    );
  }
}
