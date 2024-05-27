import 'package:get/get.dart';
import 'package:neu_social/presentation/Account/Account.dart';
import 'package:neu_social/presentation/Bottom_nav/Bottom_nav.dart';
import 'package:neu_social/presentation/Customize_intrest/customize_intrest.dart';
import 'package:neu_social/presentation/home_screen/Home_screen.dart';
import 'package:neu_social/presentation/sign_up_screen/Signup_screen.dart';
import 'package:neu_social/routes/Page_list/Page_list.dart';

class AppRoutes {
  static var list = [
    GetPage(
      name: PageList.Homescreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: PageList.SignupScreen,
      page: () => SignupScreen(),
    ),
    GetPage(name: PageList.CustomizeIntrest, page: () => CustomizeIntrest()),
    GetPage(
      name: PageList.Bottomnav,
      page: () => BottomNav(),
    ),
    GetPage(name: PageList.Account, page: () => Account(),)
  ];
}
