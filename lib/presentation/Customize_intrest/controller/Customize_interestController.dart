import 'package:get/get.dart';

class CustomizeInterestcontroller extends GetxController {
  var selectedChip =  <int>[].obs;
  void addSelectedChip(int index) {
    if (!selectedChip.contains(index)) {
      selectedChip.add(index);
    }
  }

  void removeSelectedChip(int index) {
    selectedChip.remove(index);
  }

  bool isChipSelected(int index) {
    return selectedChip.contains(index);
  }
}