import 'package:get/get.dart';
import 'package:order_up/components/menu_item.dart';
import 'components/bottomsheet.dart';

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
    IconBox(icon: "assets/icons/hotdog.png", selected: false),
    IconBox(icon: "assets/icons/bacon.png", selected: false),
    IconBox(icon: "assets/icons/burger.png", selected: false),
    IconBox(icon: "assets/icons/cheese.png", selected: false),
    IconBox(icon: "assets/icons/chicken.png", selected: false),
    IconBox(icon: "assets/icons/croissant.png", selected: false),
    IconBox(icon: "assets/icons/egg.png", selected: false),
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
