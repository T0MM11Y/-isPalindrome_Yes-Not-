import 'package:get/get.dart';

class CekPalindromeController extends GetxController {
  var name = ''.obs;
  var sentence = ''.obs;

  bool isPalindrome(String text) {
    var textWithoutSpace = text.replaceAll(' ', '').toLowerCase();
    var reversedText = textWithoutSpace.split('').reversed.join();
    return textWithoutSpace == reversedText;
  }
}
