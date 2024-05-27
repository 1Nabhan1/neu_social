import 'dart:async';

import 'package:get/get.dart';
import 'package:neu_social/routes/Page_list/Page_list.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(Duration(seconds: 5),() {
Get.offNamed(PageList.SignupScreen);
    },);
  }
}