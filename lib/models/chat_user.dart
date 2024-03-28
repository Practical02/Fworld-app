import 'package:cloud_firestore/cloud_firestore.dart';

class ChatUser {
  final String id;
  final String photoUrl;
  final String displayName;
  final String phoneNumber;
  final String aboutMe;
  final List<String> participants;

  ChatUser({
    required this.id,
    required this.photoUrl,
    required this.displayName,
    required this.phoneNumber,
    required this.aboutMe,
    required this.participants,
  });

  factory ChatUser.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return ChatUser(
      id: snapshot.id,
      photoUrl: data['photoUrl'] ?? '',
      displayName: data['displayName'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      aboutMe: data['aboutMe'] ?? '',
      participants: List<String>.from(data['participants'] ?? []),
    );
  }

  static Future<bool> checkIfVendorExists(String vendorId) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('chatUsers')
          .doc(vendorId)
          .get();
      return doc.exists;
    } catch (e) {
      print('Error checking if vendor exists: $e');
      return false;
    }
  }

  Future<void> addVendorToChatUserModel() async {
    try {
      await FirebaseFirestore.instance.collection('chatUsers').doc(id).set({
        'photoUrl': photoUrl,
        'displayName': displayName,
        'phoneNumber': phoneNumber,
        'aboutMe': aboutMe,
        // Ensure the participants array is initialized when creating a new vendor
        'participants': participants,
      });
    } catch (e) {
      print('Error adding vendor to ChatUser model: $e');
    }
  }

  Future<void> addParticipant(String email) async {
    final docRef = FirebaseFirestore.instance.collection('chatUsers').doc(id);

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(docRef);

      if (!snapshot.exists) {
        throw Exception("Vendor does not exist!");
      }

      List<dynamic> participants = snapshot['participants'];
      if (!participants.contains(email)) {
        participants.add(email);
        transaction.update(docRef, {'participants': participants});
      }
    }).catchError((error) {
      print("Error adding participant: $error");
    });
  }

  // New method to get a vendor if exists and return a ChatUser instance
  static Future<ChatUser?> getVendorIfExists(String vendorId) async {
    try {
      final DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('chatUsers')
          .doc(vendorId)
          .get();

      if (doc.exists) {
        // Vendor exists, return ChatUser instance
        return ChatUser.fromSnapshot(doc);
      } else {
        // Vendor does not exist, return null
        return null;
      }
    } catch (e) {
      print('Error retrieving vendor: $e');
      return null;
    }
  }
}
