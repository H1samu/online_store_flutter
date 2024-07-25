import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frog_go_shop/screens/authorization/log_in.dart';

class ShopAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ShopAppBar({Key? key}) : super(key: key);

  @override
  _ShopAppBarState createState() => _ShopAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ShopAppBarState extends State<ShopAppBar> {
  bool _isLoggedIn = false; // Состояние входа пользователя

  void _toggleLoginStatus() {
    setState(() {
      _isLoggedIn = !_isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      leading: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: FaIcon(
            FontAwesomeIcons.frog,
            color: Colors.green,
          ),
        ),
      ),
      title: const Row(
        children: [
          Text(
            'Подборки',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(width: 15),
          Text(
            'Каталог',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      actions: [
        SizedBox(
          width: 380,
          height: 35,
          child: TextField(
            decoration: const InputDecoration(
              fillColor: Color(0xffE1E1E1),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 1),
              prefixIcon: Icon(Icons.search),
              hintText: 'Введите название товара',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (value) {
              print('Ищем $value');
            },
          ),
        ),
        const SizedBox(width: 50),
        GestureDetector(child: const Text('RU')),
        const VerticalDivider(indent: 17, endIndent: 17, color: Colors.black),
        GestureDetector(
            child: const Text(
          'EN',
          style: TextStyle(color: Colors.grey),
        )),
        const SizedBox(width: 15),
        _isLoggedIn
            ? const FaIcon(
                FontAwesomeIcons.userLarge,
                color: Colors.green,
              )
            : const FaIcon(
                FontAwesomeIcons.userLargeSlash,
                color: Colors.red,
              ),
        const SizedBox(width: 8),
        Text(_isLoggedIn ? '420 \$' : ''),
        const SizedBox(width: 40),
        GestureDetector(
          onTap: () {
            if (_isLoggedIn) {
              _toggleLoginStatus();
            } else {
              showLoginDialog(context, _toggleLoginStatus);
            }
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: const Color(0xffE1E1E1),
                border: Border.all(color: const Color(0xffE1E1E1)),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              child: Text(_isLoggedIn ? 'Выйти' : 'Войти'),
            ),
          ),
        ),
        const SizedBox(width: 40)
      ],
    );
  }
}
