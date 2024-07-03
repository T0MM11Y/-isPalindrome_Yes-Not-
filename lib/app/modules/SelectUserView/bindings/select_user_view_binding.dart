// SelectUserViewBinding.dart
import 'package:get/get.dart';
import '../controllers/select_user_view_controller.dart';

class SelectUserViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectUserViewController());
  }
}
