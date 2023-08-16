import 'package:get/get.dart';
import 'package:order_up/components/menu_item.dart';

class Controller extends GetxController {
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
}
