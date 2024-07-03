import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/app/modules/SelectUserView/views/select_user_view_view.dart';
import '../controllers/cek_palindrome_controller.dart';

class CekPalindromeView extends GetView<CekPalindromeController> {
  const CekPalindromeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Palindrome Checker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF65BEAA),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    backgroundImage: const NetworkImage(
                      'https://media.licdn.com/dms/image/C4E0BAQGkvA7bY4OGfg/company-logo_200_200/0/1631303356110?e=1727913600&v=beta&t=f8IqGoBQFTlQjom_OHLdKMOFHGwB2ieWFjKKb_i-Q94',
                    ),
                    foregroundColor: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Enter your details:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (value) => controller.name.value = value,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF2F2F2),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (value) => controller.sentence.value = value,
                  decoration: InputDecoration(
                    labelText: 'Sentence',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF2F2F2),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      final result =
                          controller.isPalindrome(controller.sentence.value)
                              ? 'is Palindrome'
                              : 'not Palindrome';
                      Get.defaultDialog(
                        title: 'Result',
                        middleText: result,
                        backgroundColor: Colors.white,
                        titleStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        middleTextStyle:
                            TextStyle(color: Colors.black87, fontSize: 18),
                        radius: 8,
                        buttonColor: Color(0xFF64C2A6),
                        confirm: ElevatedButton(
                          onPressed: () => Get.back(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF64C2A6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('OK'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF64C2A6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 165),
                    ),
                    child: const Text(
                      'Check',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => SelectUserView(),
                          arguments: {'name': controller.name.value});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF4A261),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 165),
                      shadowColor: Colors.black,
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
