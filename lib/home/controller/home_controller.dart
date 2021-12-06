import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  RxBool isLoading = false.obs;
  
}
