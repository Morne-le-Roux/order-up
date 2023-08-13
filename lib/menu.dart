import 'components/menu_item.dart';
import 'package:flutter/material.dart';

class Menu {
  Menu();

  List<MenuItem> menu = [];

  void addItemToMenu({
    required String name,
    required IconData icon,
  }) {
    menu.add(MenuItem(name: name, iconData: icon));
  }
}
