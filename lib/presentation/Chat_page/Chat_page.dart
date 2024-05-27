import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neu_social/presentation/Chat_page/Cotroller/Chat_controller.dart';

import '../home_screen/controller/Home_controller.dart';

class ChatPage extends StatelessWidget {
  ChatPage(
      {super.key,
      required this.communityName,
      required this.communityTopic,
      required this.communityType});
  final String communityName;
  final String communityTopic;
  final String communityType;
  final HomeController homeController = Get.find();
  final ChatController chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    chatController.messages.value =
        homeController.communityMessages[communityName] ?? [];
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadiusDirectional.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.person),
                )),
            SizedBox(
              width: 10,
            ),
            Text(communityName),
            SizedBox(
              width: 10,
            ),
            Text(
              '(${communityType})',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            )
          ],
        ),
        actions: [
          Icon(Icons.delete),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to ${communityName} Community',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  communityTopic,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                            color: Colors.blueGrey),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(chatController.messages[index]),
                        )),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: chatController.controller,
                    decoration: InputDecoration(
                      labelText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: chatController.sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
