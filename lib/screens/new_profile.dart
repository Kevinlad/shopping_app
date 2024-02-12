import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/user_model.dart';
import 'package:shopping_app/provider/google_sign.dart';

class NewProfileScreen extends StatefulWidget {
  const NewProfileScreen({super.key});

  @override
  State<NewProfileScreen> createState() => _NewProfileScreenState();
}

class _NewProfileScreenState extends State<NewProfileScreen> {
  String _name = '';
  String _email = '';
  String _phoneNumber = '';
  String _username = '';
  // Function to fetch user data from Firestore
  void fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        _name = userData['username'];
        _email = userData['email'];
        _phoneNumber = userData['phoneNumber'];
        _username = userData['username'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Consumer<GoogleSignInProvider>(builder: (context, provider, _) {
              final user = provider.user;
              final userModel = provider.userModel;
              final userdetail = provider.getEmail();
              if (provider.name.isEmpty) {
                // Fetch user data if not fetched yet
                Future.microtask(() => provider.fetchUserData());
                return Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  // NetworkImage('$_name')
                                  AssetImage("assets/images/ellipse-3-bg.png")),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Change Profile Picture",
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.w800),
                              )),
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 8),
                    const Text(
                      "Profile Information",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    profileMenu("Name", "${provider.name}", () {}),
                    profileMenu("Username", "${provider.name}", () {}),
                    const Divider(),
                    const SizedBox(height: 8),
                    const Text(
                      "Personal Information",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    profileMenu("User ID", "4567", () {}),
                    profileMenu("Email", "${provider.email}", () {}),
                    profileMenu(
                        "Phone Number", "${provider.phoneNumber}", () {}),
                    profileMenu("Gender", "Male", () {}),
                    profileMenu("Date of Birth", "17-09-2001", () {}),
                  ],
                );
              }
            })),
      ),
    );
  }

  Widget profileMenu(String title, String name, VoidCallback onPresses) {
    return GestureDetector(
      onTap: onPresses,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.grey[500], fontWeight: FontWeight.w800),
                )),
            Expanded(
                flex: 5,
                child: Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
            const Expanded(child: Icon(Icons.arrow_forward_ios))
          ],
        ),
      ),
    );
  }
}
