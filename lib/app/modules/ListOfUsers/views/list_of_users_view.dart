import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/app/modules/SelectUserView/controllers/select_user_view_controller.dart';
import '../controllers/list_of_users_controller.dart';
import '../models/user.dart';

class ListOfUsersView extends StatefulWidget {
  @override
  _ListOfUsersViewState createState() => _ListOfUsersViewState();
}

class _ListOfUsersViewState extends State<ListOfUsersView> {
  final ListOfUsersController _controller = Get.put(ListOfUsersController());

  @override
  void initState() {
    super.initState();
    // Ensuring fetchUsers is called after build is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List of Users',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF65BEAA),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        if (_controller.isFetching.value && _controller.users.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return RefreshIndicator(
          onRefresh: () => _controller.fetchUsers(isRefresh: true),
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!_controller.isFetching.value &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                _controller.fetchUsers();
                return true;
              }
              return false;
            },
            child: ListView.builder(
              itemCount: _controller.users.length,
              itemBuilder: (context, index) {
                final user = _controller.users[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(20),
                      title: Text(
                        '${user.firstName} ${user.lastName}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          user.email,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black54,
                        size: 20,
                      ),
                      onTap: () {
                        // Ensure the state is updated correctly
                        final selectUserController =
                            Get.find<SelectUserViewController>();
                        selectUserController.selectedUserName.value =
                            '${user.firstName} ${user.lastName}'.trim();
                        Get.back();
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
