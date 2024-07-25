import 'package:flutter/material.dart';
import 'package:frog_go_shop/screens/common_widgets/app_bar/app_bar.dart';

import 'package:frog_go_shop/screens/menu_screen.dart/menu_screen_widgets/main_menu.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: ShopAppBar(),
      body: MainMenu(),
    );
  }
}
