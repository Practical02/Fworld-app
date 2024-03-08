import 'package:flutter/material.dart';
import 'package:function_world_app/core/app_colors.dart';

class ChatUSersScreen extends StatefulWidget {
  const ChatUSersScreen({super.key});

  static String routeName = "/user/chatUsers";

  @override
  State<ChatUSersScreen> createState() => _ChatUSersScreenState();
}

class _ChatUSersScreenState extends State<ChatUSersScreen> {
  List<String> chatUsers = [
    "User 1",
    "User 2",
    "User 3",
    "User 4",
    "User 5",
    "User 6",
    "User 7",
    "User 8",
    "User 9",
    "User 10",
    "User 1",
    "User 2",
    "User 3",
    "User 4",
    "User 5",
    "User 6",
    "User 7",
    "User 8",
    "User 9",
    "User 10",
  ];

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
          child: Icon(Icons.arrow_back, color: AppColors.primaryColor),
        ),
        title: Text(
          "Messages",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: chatUsers.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 20,
            ),
            title: Text(
              chatUsers[index],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Message preview...',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
