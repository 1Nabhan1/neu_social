import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  var selectedType = 1.obs;

  var communities = <Map<String, String>>[].obs;
  var communityMessages = <String, List<String>>{}.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController topicController = TextEditingController();

  void addCommunity(String name, String topic, String type) {
      communities.add({"name": name, "topic": topic,"type": type});
      communityMessages[name] = <String>[];
  }
  String getSelectedTypeText() {
    switch (selectedType.value) {
      case 1:
        return 'public';
      case 2:
        return 'private';
      case 3:
        return 'event-based';
      case 4:
        return 'invitation-based';
      case 5:
        return 'paid';
      default:
        return 'unknown';
    }
  }
}