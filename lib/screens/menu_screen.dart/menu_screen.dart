import 'package:flutter/material.dart';
import 'package:online_store_flutter/screens/common_widgets/app_bar/app_bar.dart';

import 'package:online_store_flutter/screens/menu_screen.dart/menu_screen_widgets/main_menu.dart';

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
