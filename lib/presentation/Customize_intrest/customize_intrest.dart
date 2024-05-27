import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neu_social/presentation/Customize_intrest/controller/Customize_interestController.dart';
import 'package:neu_social/routes/Page_list/Page_list.dart';

import 'models/Choice_chipsData/Choice_Chips.dart';

class CustomizeIntrest extends StatelessWidget {
  CustomizeIntrest({super.key});
  final CustomizeInterestcontroller customizeInterestcontroller =
      Get.put(CustomizeInterestcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Select to customize your feed',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 35),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Obx(
                  () => Wrap(
                    spacing: 8.0,
                    children: List<Widget>.generate(
                      UserIntrest.length,
                      (int index) {
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ChoiceChip(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            checkmarkColor: Colors.deepOrange,
                            selectedColor: Colors.grey,
                            backgroundColor: Colors.black,
                            label: Text(UserIntrest[index],
                                style: GoogleFonts.aBeeZee(
                                  color: customizeInterestcontroller
                                          .selectedChip
                                          .contains(index)
                                      ? Colors.black
                                      : Colors.white,
                                )),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            selected: customizeInterestcontroller.selectedChip
                                .contains(index),
                            onSelected: (bool selected) {
                              if (selected) {
                                customizeInterestcontroller
                                    .addSelectedChip(index);
                              } else {
                                customizeInterestcontroller
                                    .removeSelectedChip(index);
                              }
                            },
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                      backgroundColor: WidgetStatePropertyAll(Colors.orange),
                      fixedSize: WidgetStatePropertyAll(Size.fromHeight(60))),
                  onPressed: () {
                    Get.toNamed(PageList.Bottomnav);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
