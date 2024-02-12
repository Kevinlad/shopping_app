// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shopping_app/model/user_model.dart';

// class GoogleSignInProvider extends ChangeNotifier {
//   final googleSign = GoogleSignIn();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   UserModel? _userModel;
//   GoogleSignInAccount? _user;
//   GoogleSignInAccount? get user => _user;
//   String? get userEmail => _user?.email;
//   Future<void> googleLogin() async {
//     final googleUser = await googleSign.signIn();

//     if (googleUser == null) return;
//     _user = googleUser;

//     final googleAuth = await googleUser.authentication;
//     final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

//     final authResult =
//         await FirebaseAuth.instance.signInWithCredential(credential);
//     final user = authResult.user;

//     if (user != null) {
//       // Save user ID to Firestore
//       await _firestore.collection('users').doc(user.uid).set({
//         'email': user.email,
//         'username': user.displayName,
//         'phoneNumber': user.phoneNumber,
//         'photoURL': user.photoURL,
//         "id": user.uid
//         // You can add more user data here
//       });

//       // Fetch user data from Firestore and update _userModel
//       final userData = await _firestore.collection('users').doc(user.uid).get();
//       final userModel = UserModel(
//         id: userData['id'],
//         email: userData['email'],
//         username: userData['username'],
//         phoneNumber: userData['phoneNumber'],
//         photoURL: userData['photoURL'],
//       );
//       _userModel = userModel;

//       _user = googleUser;
//       notifyListeners();
//       print('User Model: $_userModel');
//     }

//     notifyListeners();
//   }

//   UserModel? get userModel => _userModel;
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_app/model/user_model.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSign = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserModel? _userModel;
  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;
  String? get userEmail => _user?.email;

  Future<void> googleLogin() async {
    final googleUser = await googleSign.signIn();

    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    final authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = authResult.user;

    if (user != null) {
      // Save user ID to Firestore
      await _firestore.collection('users').doc(user.uid).set({
        'email': user.email,
        'username': user.displayName,
        'phoneNumber': user.phoneNumber,
        'photoURL': user.photoURL,
        "id": user.uid
        // You can add more user data here
      });

      // Fetch user data from Firestore and update _userModel
      await fetchUserProfile(user.uid);

      _user = googleUser;
      notifyListeners();
    }

    notifyListeners();
  }
Stream<UserModel?> get userModelStream {
    return _auth.authStateChanges().asyncMap((user) async {
      if (user == null) return null;

      // Fetch user data from Firestore
      final userData = await _firestore.collection('users').doc(user.uid).get();
      if (!userData.exists) return null;

      return UserModel(
        id: user.uid,
        email: userData['email'],
        username: userData['username'],
        phoneNumber: userData['phoneNumber'],
        photoURL: userData['photoURL'],
      );
    });
  }
  String name = '';
  String email = '';
  String phoneNumber = '';

  void fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      name = userData['username'];
      email = userData['email'];
      phoneNumber = userData['phoneNumber'];
      notifyListeners();
    }
  }

  Future<void> fetchUserProfile(String userId) async {
    final userData = await _firestore.collection('users').doc(userId).get();
    final userModel = UserModel(
      id: userData['id'],
      email: userData['email'],
      username: userData['username'],
      phoneNumber: userData['phoneNumber'],
      photoURL: userData['photoURL'],
    );
    _userModel = userModel;
  }

  Future<String?> getEmail() async {
    try {
      final userId = _user?.id;
      if (userId != null) {
        final userData = await _firestore.collection('users').doc(userId).get();
        if (userData.exists) {
          return userData['email'];
        } else {
          print('Document does not exist');
          return null;
        }
      } else {
        print('User ID is null');
        return null;
      }
    } catch (e) {
      print('Error getting email: $e');
      return null;
    }
  }

  Future<String?> getUsername() async {
    final userId = _user?.id;
    if (userId != null) {
      final userData = await _firestore.collection('users').doc(userId).get();
      return userData['username'];
    }
    return null;
  }

  Future<String?> getPhoneNumber() async {
    final userId = _user?.id;
    if (userId != null) {
      final userData = await _firestore.collection('users').doc(userId).get();
      return userData['phoneNumber'];
    }
    return null;
  }

  // Similarly, you can create functions to fetch other profile data

  UserModel? get userModel => _userModel;
}
