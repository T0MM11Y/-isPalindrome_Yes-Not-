import 'package:get/get.dart';
import 'package:suitmedia_test/app/modules/SelectUserView/controllers/select_user_view_controller.dart';

import '../controllers/list_of_users_controller.dart';

class ListOfUsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListOfUsersController>(
      () => ListOfUsersController(),
    );
    Get.lazyPut(() => SelectUserViewController());
  }
}
