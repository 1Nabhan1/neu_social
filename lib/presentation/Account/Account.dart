import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neu_social/presentation/Account/Controller/AccountController.dart';
import 'package:neu_social/presentation/Account/models/account_models.dart';

class Account extends StatelessWidget {
  Account({super.key});
  final Accountcontroller accountcontroller = Get.put(Accountcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Account',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 270,
            width: double.infinity,
            color: Colors.blueGrey,
            child: Column(
              children: [
                Icon(
                  CupertinoIcons.person_circle,
                  color: Colors.white,
                  size: 200,
                ),
                Obx(
                  () => Text(
                    accountcontroller.name.value,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Obx(
                  () => Text(
                    accountcontroller.email.value,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: Accountdata.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Icon(Iconsdata[index]),
                  trailing: Icon(
                    Icons.chevron_right,
                  ),
                  tileColor: Colors.blueGrey.shade300,
                  title: Text(
                    Accountdata[index],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
