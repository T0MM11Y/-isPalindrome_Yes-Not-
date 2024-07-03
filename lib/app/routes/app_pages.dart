import 'package:get/get.dart';

import '../modules/ListOfUsers/bindings/list_of_users_binding.dart';
import '../modules/ListOfUsers/views/list_of_users_view.dart';
import '../modules/SelectUserView/bindings/select_user_view_binding.dart';
import '../modules/SelectUserView/views/select_user_view_view.dart';
import '../modules/cek_palindrome/bindings/cek_palindrome_binding.dart';
import '../modules/cek_palindrome/views/cek_palindrome_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CEK_PALINDROME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CEK_PALINDROME,
      page: () => const CekPalindromeView(),
      binding: CekPalindromeBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_USER_VIEW,
      page: () => SelectUserView(),
      binding: SelectUserViewBinding(),
    ),
    GetPage(
      name: _Paths.LIST_OF_USERS,
      page: () => ListOfUsersView(),
      binding: ListOfUsersBinding(),
    ),
  ];
}
