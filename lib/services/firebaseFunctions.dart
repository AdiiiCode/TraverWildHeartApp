import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static saveUser(String username, email,phonenumber, uid) async {
    await FirebaseFirestore.instance
        .collection('LoginSignups')
        .doc(uid)
        .set({'email': email, 'username': username,'phonenumber':phonenumber});
  }
}