import 'package:flutter/material.dart';
import 'package:online_store_flutter/screens/common_widgets/app_bar/app_bar.dart';

import 'package:online_store_flutter/screens/menu_screen.dart/menu_screen_widgets/main_menu.dart';

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
