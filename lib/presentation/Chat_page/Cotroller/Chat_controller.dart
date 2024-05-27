import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {

   var messages =<String> [].obs;
   final TextEditingController controller = TextEditingController();

   void sendMessage() {
     if (controller.text.isNotEmpty) {
         messages.add(controller.text);
       controller.clear();
     }
   }
}