import 'package:get/get.dart';
import 'package:suitmedia_test/app/modules/cek_palindrome/models/main_user.dart';

class SelectUserViewController extends GetxController {
  var selectedUserName = ''.obs; // Observable variable

  var mainUserModel = MainUser(name: '').obs;

  void setSelectedUser(String firstName, String lastName) {
    selectedUserName.value = '$firstName $lastName';
  }

  void setMainUserModel(MainUser user) {
    mainUserModel.value = user;
  }
}
