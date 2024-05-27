import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Accountcontroller extends GetxController {
  var name = ''.obs;
  var email = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();
  }
  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('name') ?? '';
    email.value = prefs.getString('email') ?? '';
  }
}