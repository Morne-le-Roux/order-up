import 'package:get/get.dart';
import 'package:order_up/components/menu_item.dart';
import 'components/bottomsheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

//Shared Preferences

  saveItemData({
    required name,
    required icon,
    required amount,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> menuItemSettings = [icon, amount.toString()];
    prefs.setStringList(name, menuItemSettings);
  }

  getItemData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var items = prefs.getKeys();
    print(items);

    for (var item in items) {
      List<String> menuItem = prefs.getStringList(item) ?? [];
      print(menuItem);
      addItemToMenu(
          name: item,
          iconData: menuItem.elementAt(0),
          amount: int.parse(menuItem.elementAt(1)));
    }
  }
}

class IconBoxListController extends GetxController {}
