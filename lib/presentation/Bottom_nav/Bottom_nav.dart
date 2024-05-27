import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:neu_social/presentation/Account/Account.dart';
import 'package:neu_social/presentation/Bottom_nav/Controller/BottomNav_controller.dart';
import 'package:neu_social/presentation/home_screen/Home_screen.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});
  final BottomnavController bottomnavController =
      Get.put(BottomnavController());
  List<Widget> pages = [HomeScreen(), Account()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() =>  pages[bottomnavController.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedIconTheme: CupertinoIconThemeData(
              color: Colors.deepOrange,
            ),
            selectedLabelStyle: TextStyle(color: Colors.grey),
            currentIndex: bottomnavController.selectedIndex.value,
            onTap: (value) {
              bottomnavController.selectedIndex.value = value;
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Account')
            ]),
      ),
    );
  }
}
