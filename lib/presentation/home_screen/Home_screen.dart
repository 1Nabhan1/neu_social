import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neu_social/presentation/home_screen/controller/Home_controller.dart';
import 'package:neu_social/presentation/home_screen/widgets/Custom_Drawer/Custom_drawer.dart';

import '../Chat_page/Chat_page.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  HomeScreen({super.key});
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Image.asset(
          'assets/pngegg.png',
          fit: BoxFit.contain,
        ),
        title: CupertinoTextField(
          padding: EdgeInsets.all(15),
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              CupertinoIcons.search,
              color: Colors.white60,
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
          placeholder: 'Search here',
          placeholderStyle: TextStyle(color: Colors.white60),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
                onTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
                child: Icon(CupertinoIcons.calendar_today)),
          )
        ],
      ),
      endDrawer: CustomDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: homeController.communities.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      tileColor: Colors.grey,
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(Icons.person),
                        ),
                      ),
                      title: Text(
                          homeController.communities.value[index]['name']!),
                      subtitle: Text(
                          homeController.communities.value[index]['topic']!),
                      onTap: () {
                        Get.to(ChatPage(
                          communityName: homeController.communities.value[index]
                              ['name']!,
                          communityTopic:
                              homeController.communities.value[index]['topic']!,
                          communityType: homeController.communities.value[index]
                              ['type']!,
                        ));
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Create a new community',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: homeController.nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 1,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: homeController.topicController,
                        decoration: InputDecoration(
                          labelText: 'Topic',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                      ),
                      SizedBox(height: 20),
                      Text('Select Type:'),
                      Obx(
                        () => RadioListTile<int>(
                          title: Text('public'),
                          value: 1,
                          groupValue: homeController.selectedType.value,
                          onChanged: (value) {
                            homeController.selectedType.value = value!;
                          },
                        ),
                      ),
                      Obx(
                        () => RadioListTile<int>(
                          title: Text('private'),
                          value: 2,
                          groupValue: homeController.selectedType.value,
                          onChanged: (value) {
                            homeController.selectedType.value = value!;
                          },
                        ),
                      ),
                      Obx(
                        () => RadioListTile<int>(
                          title: Text('event-based'),
                          value: 3,
                          groupValue: homeController.selectedType.value,
                          onChanged: (value) {
                            homeController.selectedType.value = value!;
                          },
                        ),
                      ),
                      Obx(
                        () => RadioListTile<int>(
                          title: Text('invitation-based'),
                          value: 4,
                          groupValue: homeController.selectedType.value,
                          onChanged: (value) {
                            homeController.selectedType.value = value!;
                          },
                        ),
                      ),
                      Obx(
                        () => RadioListTile<int>(
                          title: Text('paid'),
                          value: 5,
                          groupValue: homeController.selectedType.value,
                          onChanged: (value) {
                            homeController.selectedType.value = value!;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.blueGrey),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                          // fixedSize: WidgetStateProperty.all(Size(180, 50)),
                        ),
                        onPressed: () {
                          homeController.addCommunity(
                            homeController.nameController.text,
                            homeController.topicController.text,
                              homeController.getSelectedTypeText()
                          );
                          homeController.nameController.clear();
                          homeController.topicController.clear();
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue.shade900),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            )),
      ),
    );
  }
}
