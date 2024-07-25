import 'package:flutter/material.dart';

void showLoginDialog(BuildContext context, Function toggleLoginStatus) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Добро пожаловать!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(labelText: 'Логин'),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Пароль'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Отмена'),
                ),
                ElevatedButton(
                  onPressed: () {
                    toggleLoginStatus();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Войти'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text('Регистрация'),
            ),
          ],
        ),
      );
    },
  );
}
