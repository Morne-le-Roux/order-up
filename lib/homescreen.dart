import 'package:flutter/material.dart';
import 'package:order_up/components/bottomsheet.dart';
import 'package:get/get.dart';
import 'package:order_up/logic.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final MenuGetController c = Get.put(MenuGetController());

  @override
  Widget build(BuildContext context) {
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
            children:
                c.menu.map<Widget>((element) => element as Widget).toList(),
          ),
        ),
      )),
    );
  }
}
