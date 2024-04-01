import 'package:cloud_firestore/cloud_firestore.dart';

class userModel {
  final String? id;
  final String? username;
  final String? email;
  final String? password;
  final String? phonenumber;



const userModel({
  this.id,
this.username,
this.email,
this.password,
this.phonenumber
});

 toJson()
 {
  return{
    "username": username,
    "email": email,
    "password": password,
    "phonenumber":phonenumber,

  };
 }

 factory userModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> documnet )
 {
  final data = documnet.data()!;
  return userModel(
    id: documnet.id,
    email: data["email"],
    password: data["password"],
    username: data["username"],
    phonenumber: data["phonenumber"],
  );
 }
}