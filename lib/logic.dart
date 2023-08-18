import 'package:get/get.dart';
import 'package:order_up/components/menu_item.dart';
import 'constants.dart';
import 'components/bottomsheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuGetController extends GetxController {
  //Main Menu list. This displays on the main menu.
  var menu = [].obs;

  //Method to add items to the above list.
  addItemToMenu({
    required name,
    required iconData,
    required amount,
  }) {
    menu.add(MenuItem(name: name, icon: iconData, amount: amount));
  }

  RxList<IconBox> iconBoxList = [
    IconBox(
        icon: const FaIcon(
          FontAwesomeIcons.burger,
          color: kPrimaryColor,
        ),
        selected: false),
    IconBox(
        icon: const FaIcon(
          FontAwesomeIcons.hotdog,
          color: kPrimaryColor,
        ),
        selected: false),
    IconBox(
        icon: const FaIcon(
          FontAwesomeIcons.egg,
          color: kPrimaryColor,
        ),
        selected: false),
  ].obs;

  void singleIconSelected() {
    for (var iconBox in iconBoxList) {
      if (iconBox.selected) {
        iconBox.selected = false;
        break;
      }
    }
  }
}

class IconBoxListController extends GetxController {}
