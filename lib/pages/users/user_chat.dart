import 'package:flutter/material.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:function_world_app/core/service/chat_service.dart';
import 'package:function_world_app/models/message_model.dart';

import 'package:flutter/material.dart';

class UserMessagesScreen extends StatefulWidget {
  final String userEmail;
  final String receiverEmail;

  const UserMessagesScreen({
    super.key,
    required this.userEmail,
    required this.receiverEmail,
  });

  @override
  _UserMessagesScreenState createState() => _UserMessagesScreenState();
}

class _UserMessagesScreenState extends State<UserMessagesScreen> {
  String username = '';
  String receiverEmail = '';
  bool isLoading = true;
  List<Message> messages = []; // List to store messages
  late ChatService _chatService;

  late TextEditingController
      _messageController; // Controller for the message input

  // Function to fetch messages between users
  Future<void> fetchMessages() async {
    try {
      List<Message> sentMessages =
          await _chatService.getMessagesBetweenUsers(username, receiverEmail);

      List<Message> recievedMessages =
          await _chatService.getMessagesBetweenUsers(receiverEmail, username);

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

  // Function to send a message
  Future<void> sendMessage(String message) async {
    try {
      // Send the message using ChatService
      await _chatService.sendMessage(Message(
        senderEmail: username,
        receiverEmail: receiverEmail,
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
                        bool isSentMessage =
                            message.senderEmail == widget.userEmail;
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
                                    : AppColors.buttonColor,
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
