import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/model/user_model.dart';

class AuthProvide with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;
  late UserModel? _userData;

  User? get user => _user;
  // UserModel get userData => _userData;

  // AuthProvider() {
  //   _checkCurrentUser();
  // }

  // Future<UserModel> fetchDetails() async {
  //   try {
  //     final documentsnapshot = await _firestore.collection('users').doc().get();
  //     if (documentsnapshot.exists) {
  //       return UserModel.fromMap();
  //     }
  //   } catch (e) {
  //     throw 'Something went wrong';
  //   }
  // }

  // Future<void> _checkCurrentUser() async {
  //   _user = _auth.currentUser;
  //   if (_user != null) {
  //     await fetchUserData();
  //   }
  //   notifyListeners();
  // }

  // Future<void> fetchUserData() async {
  //   try {
  //     final userData =
  //         await _firestore.collection('users').doc(_user!.uid).get();
  //     _userData = UserModel.fromMap(userData.data()!);
  //     notifyListeners();
  //   } catch (error) {
  //     print('Error fetching user data: $error');
  //   }
  // }

  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    try {
      await _firestore.collection('users').doc(_user!.uid).update({
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
      });

      // Update local user data
      // _userData = UserModel(
      //   id: _userData.id,
      //   email: _userData.email,
      //   firstName: firstName,
      //   lastName: lastName,
      //   phoneNumber: phoneNumber,
      //   profilePictureUrl: _userData.profilePictureUrl,
      //   username: _userData.username,
      // );

      notifyListeners();
    } catch (error) {
      print('Error updating profile: $error');
    }
  }

  Future<void> addUserData({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String profilePictureUrl,
    required String username,
  }) async {
    // try {
    //   await _firestore.collection('users').doc(_userData.id).set({
    //     'id': id,
    //     'email': email,
    //     'firstName': firstName,
    //     'lastName': lastName,
    //     'phoneNumber': phoneNumber,
    //     'profilePictureUrl': profilePictureUrl,
    //     'username': username,
    //   });
    // } catch (error) {
    //   print('Error adding user data: $error');
    // }
  }

 
  Future<void> signOut() async {
    // Implementation remains the same
  }
}
