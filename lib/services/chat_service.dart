import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:function_world_app/models/chat_user.dart';
import 'package:function_world_app/models/message_model.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Message>> getMessages() {
    return _firestore
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Message(
          senderEmail: doc['sender'],
          receiverEmail: doc['receiver'],
          message: doc['message'],
          timestamp: doc['timestamp'],
        );
      }).toList();
    });
  }

  Future<void> sendMessage(Message message) async {
    await _firestore.collection('messages').add(message.toMap());
  }

  Future<List<ChatUser>> getChatsForUser(String userEmail) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('chatUsers')
          .where('participants', arrayContains: userEmail)
          .get();

      List<ChatUser> chats = [];
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        ChatUser chat = ChatUser.fromSnapshot(doc);

        chats.add(chat);
      }
      return chats;
    } catch (e) {
      print('Error fetching chats: $e');
      return [];
    }
  }

  Future<List<Message>> getMessagesBetweenUsers(
      String user1Email, String user2Email) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('messages')
          .where('sender', isEqualTo: user1Email)
          .where('receiver', isEqualTo: user2Email)
          .get();

      List<Message> messages = [];
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        Message message = Message(
          senderEmail: doc['sender'],
          receiverEmail: doc['receiver'],
          message: doc['message'],
          timestamp: (doc['timestamp'] as Timestamp)
              .toDate(), // Convert Timestamp to DateTime
        );
        messages.add(message);
      }
      return messages;
    } catch (e) {
      print('Error fetching messages between users: $e');
      return [];
    }
  }

  // Method to add a user to Firestore
  // Method to add a user to Firestore if it doesn't exist
  Future<void> addUserToFirestore(ChatUser user) async {
    try {
      // Check if the user already exists
      bool userExists = await checkIfUserExists(user.id);

      if (!userExists) {
        // If the user doesn't exist, add it to Firestore
        await _firestore.collection('users').doc(user.id).set({
          'photoUrl': user.photoUrl,
          'displayName': user.displayName,
          'phoneNumber': user.phoneNumber,
          'aboutMe': user.aboutMe,
        });
      }
    } catch (e) {
      print('Error adding user to Firestore: $e');
    }
  }

  // Method to check if a user already exists in Firestore
  Future<bool> checkIfUserExists(String userId) async {
    try {
      final docSnapshot =
          await _firestore.collection('users').doc(userId).get();
      return docSnapshot.exists;
    } catch (e) {
      print('Error checking if user exists: $e');
      return false;
    }
  }
}
