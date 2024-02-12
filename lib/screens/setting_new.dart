import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screens/new_Address.dart';
import 'package:shopping_app/screens/new_cartScreen.dart';
import 'package:shopping_app/screens/new_profile.dart';

import '../provider/google_sign.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<GoogleSignInProvider>(context).user;
    final email = Provider.of<GoogleSignInProvider>(context).userEmail;

    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        // backgroung Image
        Positioned.fill(
          child: Image.asset(
            'assets/images/back1.avif', // Provide your image path here
            fit: BoxFit.cover,
          ),
        ),

        // Content
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Account",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage("assets/images/ellipse-3-bg.png"),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${user?.displayName}',
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text("$email")
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NewProfileScreen()));
                      },
                      icon: const Icon(Icons.edit),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: height * 1.35,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: Colors
                        .white, // Change the color according to your preference
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          "Account Settings",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      menuTitle(
                          Icons.home,
                          "My Address",
                          "Set shopping delivery address",
                          const Icon(Icons.arrow_forward_ios), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewAddress()));
                      }),
                      menuTitle(
                          Icons.shopping_cart,
                          "My Cart",
                          "Add remove produccts and move to checkout",
                          const Icon(Icons.arrow_forward_ios), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewCartScreen()));
                      }),
                      menuTitle(
                          Icons.outbox_rounded,
                          "My Order",
                          "In-progress and Completed Orders",
                          const Icon(Icons.arrow_forward_ios),
                          () {}),
                      menuTitle(
                          Icons.food_bank,
                          "Bank Account",
                          "Withdraw balance to registered bank account",
                          const Icon(Icons.arrow_forward_ios),
                          () {}),
                      menuTitle(
                          Icons.computer,
                          "My Coupons",
                          "List of discounted coupons",
                          const Icon(Icons.arrow_forward_ios),
                          () {}),
                      menuTitle(
                          Icons.notifications,
                          "Notifications",
                          "Set any kind of notication message",
                          const Icon(Icons.arrow_forward_ios),
                          () {}),
                      menuTitle(
                          Icons.security_rounded,
                          "Account Privacy",
                          "Manage data usage and connected accounts",
                          const Icon(Icons.arrow_forward_ios),
                          () {}),
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          "App Settings",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      menuTitle(
                          Icons.document_scanner,
                          "Load Data",
                          "Upload Data to your Cloud Firestore",
                          const Icon(Icons.arrow_forward_ios),
                          () {}),
                      menuTitle(
                          Icons.location_history,
                          "Geolocation",
                          "Set recommendation based on location",
                          Switch(
                            value: false,
                            onChanged: (value) {},
                          ),
                          () {}),
                      menuTitle(
                          Icons.location_history,
                          "Safe Mode",
                          "Search result is ",
                          Switch(
                            value: false,
                            onChanged: (value) {},
                          ),
                          () {}),
                      menuTitle(
                          Icons.location_history,
                          "HD Image Quality",
                          "Set image quality to be seen",
                          Switch(
                            value: false,
                            onChanged: (value) {},
                          ),
                          () {}),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                              child: Text("Logout",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16))),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ],
    )
        // bottomNavigationBar:
        );
  }

  Widget menuTitle(IconData icon, String title, subtitle, Widget? trailing,
      VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: trailing,
      leading: Icon(icon),
      onTap: onTap,
    );
  }
}
