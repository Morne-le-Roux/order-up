import 'package:flutter/material.dart';
import 'package:order_up/components/bottomsheet.dart';
import 'package:get/get.dart';
import 'package:order_up/components/long_press_dialog.dart';
import 'package:order_up/logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MenuGetController c = Get.put(MenuGetController());
  Future? getData;

  @override
  void initState() {
    super.initState();
    getData = c.getItemData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print("snapshot data => ${snapshot.data}");
          Map data = snapshot.data;
          data.forEach(
            (key, value) {
              String itemName = key;
              List itemDetails = value;
              c.addItemToMenu(
                  name: itemName,
                  iconData: itemDetails.elementAt(0),
                  amount: int.parse(itemDetails.elementAt(1)));
            },
          );
          return Scaffold(
            floatingActionButton: FloatingActionButton.small(
                backgroundColor: Colors.pink,
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const AddMenuItemBottomSheet();
                      });
                },
                child: const Icon(Icons.add)),
            body: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(() => GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                        ),
                        itemCount: [...c.menu].length,
                        itemBuilder: (BuildContext context, int index) {
                          final menuItem = [...c.menu][index];
                          return GestureDetector(
                            onLongPress: () => showDialog(
                                context: context,
                                builder: (context) {
                                  return LongPressDialog(
                                    name: menuItem.name,
                                    index: index,
                                    amount: menuItem.amount,
                                  );
                                }),
                            child: menuItem,
                          );
                        },
                      ))),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
