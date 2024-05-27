import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
  RxBool isObscure = true.obs;
  final formKey = GlobalKey<FormState>();
  final TextEditingController EmailControl = TextEditingController();
  final TextEditingController NameControl = TextEditingController();
  final TextEditingController PasswordControl = TextEditingController();

  Future<void> saveData(String name, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('email', email);
  }

}
