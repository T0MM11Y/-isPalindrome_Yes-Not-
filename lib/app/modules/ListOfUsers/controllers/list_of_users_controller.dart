import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../models/user.dart';

class ListOfUsersController extends GetxController {
  var users = <User>[].obs;
  var isFetching = false.obs;
  var currentPage = 1.obs;

  Future<void> fetchUsers({bool isRefresh = false}) async {
    if (isFetching.value) return;

    if (isRefresh) {
      currentPage.value = 1;
      users.clear();
    }

    isFetching.value = true;
    try {
      final response = await http.get(Uri.parse(
          'https://reqres.in/api/users?page=${currentPage.value}&per_page=10'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final fetchedUsers =
            (data['data'] as List).map((e) => User.fromJson(e)).toList();
        users.addAll(fetchedUsers);
        currentPage.value++;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print(e);
    } finally {
      isFetching.value = false;
    }
  }
}
