import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderEmail;
  final String receiverEmail;
  final String message;
  final DateTime timestamp; // Change type to DateTime

  Message({
    required this.message,
    required this.receiverEmail,
    required this.senderEmail,
    required this.timestamp, // Change type to DateTime
  });

  Map<String, dynamic> toMap() {
    return {
      "sender": senderEmail,
      "receiver": receiverEmail,
      "message": message,
      "timestamp":
          Timestamp.fromDate(timestamp), // Convert DateTime to Timestamp
    };
  }
}
