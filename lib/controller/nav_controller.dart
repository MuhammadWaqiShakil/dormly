import 'package:get/get.dart';

class NavController extends GetxController {
  // 0 = Home, 1 = Map, 2 = Requests, 3 = Chat, 4 = Profile
  var currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}