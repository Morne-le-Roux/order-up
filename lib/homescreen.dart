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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    c.getItemData();
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
          backgroundColor: Colors.white,
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return const AddMenuItemBottomSheet();
                });
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(() {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
              ),
              itemCount: [...c.menu].length,
              itemBuilder: (BuildContext context, int index) {
                final menuItem = Obx(() => [...c.menu][index]);

                return menuItem;
              },
            );
          }),
        ),
      ),
    );
  }
}
