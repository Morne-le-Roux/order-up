import 'package:flutter/material.dart';
import 'package:order_up/components/bottomsheet.dart';
import 'package:get/get.dart';
import 'package:order_up/logic.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Controller c = Get.put(Controller());
  List<MenuItem> menu = Obx(() => c.menu);

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: (Obx(() => c.menu.toList()))), //TODO ADD MENU OBJECT
          ],
        ),
      )),
    );
  }
}
