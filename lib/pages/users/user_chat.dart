import 'package:flutter/material.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:function_world_app/services/chat_service.dart';
import 'package:function_world_app/models/message_model.dart';

import 'package:get/get.dart';

class UserMessagesScreen extends StatefulWidget {
  const UserMessagesScreen({
    super.key,
  });

  @override
  _UserMessagesScreenState createState() => _UserMessagesScreenState();
}

class _UserMessagesScreenState extends State<UserMessagesScreen> {
  String username = '';
  String receiver = '';
  bool isLoading = true;
  List<Message> messages = [];
  late ChatService _chatService;

  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _chatService = ChatService();
    fetchUserDetails();
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  Future<void> fetchUserDetails() async {
    final Map<String, dynamic> arguments = Get.arguments;
    final String userEmail = arguments['userEmail'];
    final String receiverEmail = arguments['receiverEmail'];

    setState(() {
      // Update username and receiverEmail from SharedPreferences
      username = userEmail;
      receiver = receiverEmail;

      // Initialize ChatService
      _chatService = ChatService();

      // Fetch messages between users
      fetchMessages();

      fetchRecieved();
    });
  }

  // Function to fetch messages between users
  Future<void> fetchMessages() async {
    try {
      List<Message> sentMessages =
          await _chatService.getMessagesBetweenUsers(username, receiver);

      List<Message> recievedMessages =
          await _chatService.getMessagesBetweenUsers(receiver, username);

      setState(() {
        messages = sentMessages + recievedMessages;

        messages.sort(
          (a, b) {
            return a.timestamp.compareTo(b.timestamp);
          },
        );

        isLoading = false;
      });
    } catch (error) {
      // Handle error
      print('Error fetching messages: $error');
    }
  }

  Future<void> fetchRecieved() async {
    try {
      List<Message> allMessages =
          await _chatService.getMessagesBetweenUsers(receiver, username);

      setState(() {
        messages = messages + allMessages;
        isLoading = false; // Set loading to false once messages are fetched
      });
    } catch (error) {
      // Handle error
      print('Error fetching messages: $error');
    }
  }

  // Function to send a message
  Future<void> sendMessage(String message) async {
    try {
      // Send the message using ChatService
      print(username);
      print(receiver);

      await _chatService.sendMessage(Message(
        senderEmail: username,
        receiverEmail: receiver,
        message: message,
        timestamp: DateTime.now(),
      ));
      // Clear the input field after sending the message
      _messageController.clear();
      // Fetch updated messages
      fetchMessages();
    } catch (error) {
      // Handle error
      print('Error sending message: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Messages'), // Set app bar title
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  ) // Show loading indicator if isLoading is true
                : SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      children: messages.map((message) {
                        // Check if the message is sent by the current user
                        bool isSentMessage = message.senderEmail == username;
                        return ListTile(
                          title: Align(
                            alignment: isSentMessage
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.symmetric(vertical: 4.0),
                              decoration: BoxDecoration(
                                color: isSentMessage
                                    ? AppColors.primaryColor
                                    : AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Text(
                                message.message,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
          ),
          // Text field for message input
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    style: TextStyle(color: Colors.white54),
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Call sendMessage when the send button is pressed
                    sendMessage(_messageController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
