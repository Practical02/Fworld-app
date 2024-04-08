import 'package:flutter/material.dart';
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:function_world_app/models/chat_user.dart';
import 'package:function_world_app/services/chat_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChatUSersScreen extends StatefulWidget {
  const ChatUSersScreen({Key? key}) : super(key: key);

  static String routeName = "/user/chatUsers";

  @override
  State<ChatUSersScreen> createState() => _ChatUSersScreenState();
}

class _ChatUSersScreenState extends State<ChatUSersScreen> {
  late Future<List<ChatUser>> chatUsersFuture;
  final ChatService _chatService = ChatService();

  final box = GetStorage();

  late String userEmail;

  @override
  void initState() {
    super.initState();

    userEmail = box.read('email');

    chatUsersFuture = _chatService.getChatsForUser(userEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offBlack,
      appBar: AppBar(
        backgroundColor: AppColors.offBlack,
        leading: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
        ),
        title: const Text(
          "Messages",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<ChatUser>>(
        future: chatUsersFuture,
        builder:
            (BuildContext context, AsyncSnapshot<List<ChatUser>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<ChatUser> users = snapshot.data ?? [];
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const CircleAvatar(
                    radius: 20,
                  ),
                  title: Text(
                    users[index].displayName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'Message ...',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    navigateToUserMessagesScreen(userEmail, users[index].id);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

void navigateToUserMessagesScreen(String userEmail, String receiverEmail) {
  Get.toNamed(RoutesConstant.userMessagesScreen,
      arguments: {'userEmail': userEmail, 'receiverEmail': receiverEmail});
}
