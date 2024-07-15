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
          Text('Подборки'),
          SizedBox(width: 15),
          Text('Каталог'),
        ],
      ),
      actions: [
        const Text('data'),
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

// class Header extends StatelessWidget {
//   const Header({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const Icon(
//           Icons.abc,
//         ),
//         const SizedBox(width: 20),
//         const Text('Подборки'),
//         const SizedBox(width: 15),
//         const Text('Каталог'),
//         const SizedBox(width: 40),
//         // const TextField(),
//         const SizedBox(width: 20),
//         GestureDetector(child: const Text('RU')),
//         const VerticalDivider(
//           width: 3,
//           color: Colors.black,
//         ),
//         GestureDetector(
//           child: const Text('EN'),
//         ),
//         const SizedBox(width: 15),
//         const Icon(Icons.abc), const Text('0'),
//         const SizedBox(width: 15),
//         const Text('Войти'),
//       ],
//     );
//   }
// }
