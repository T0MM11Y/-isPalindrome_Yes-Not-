import 'package:get/get.dart';

import '../controllers/cek_palindrome_controller.dart';

class CekPalindromeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CekPalindromeController>(
      () => CekPalindromeController(),
    );
  }
}
