import 'package:flutter/material.dart';
import 'package:order_up/components/bottomsheet.dart';
import 'package:get/get.dart';
import 'package:order_up/logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MenuGetController c = Get.put(MenuGetController());
  Future? getData;

  // onStartData(item) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String> menuItem = prefs.getStringList(item) ?? [];
  //   print(menuItem.elementAt(0));
  //   print(menuItem.elementAt(1));
  //   c.addItemToMenu(
  //       name: item,
  //       iconData: menuItem.elementAt(0).toString(),
  //       amount: int.parse(menuItem.elementAt(1)));
  // }

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
                  child: Obx(
                    () => GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: List.generate(
                        c.menu.length,
                        (index) {
                          double itemHeight =
                              200; // calculate desired height based on index or data
                          return AnimatedContainer(
                              duration: const Duration(
                                  seconds:
                                      1), // Adjust animation duration as needed
                              height: itemHeight, // Set the desired height
                              child: c.menu[index] // Your content here
                              );
                        },
                      ),
                      // c.menu.map<Widget>((element) => element as Widget).toList(),
                    ),
                  )),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
