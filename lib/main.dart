import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/firebase_options.dart';
import 'package:shopping_app/provider/address_provider.dart';
import 'package:shopping_app/provider/cart_provider.dart';
import 'package:shopping_app/provider/category_provider.dart';
import 'package:shopping_app/provider/google_sign.dart';
import 'package:shopping_app/provider/order_provider.dart';
import 'package:shopping_app/provider/payment_provider.dart';
import 'package:shopping_app/screens/new_bottom_navigation.dart';
import 'package:shopping_app/screens/phone.dart';
import 'package:shopping_app/screens/singup.dart';

import 'provider/whishlist_provider.dart';
import 'screens/verify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
        ChangeNotifierProvider(create: (context) => AddressProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context) => PaymentProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,

        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routes: {
          'phone': (context) => const MyPhone(),
          'verify': (context) => MyVerify(),
          // 'home': (context) => HomePage(),
        },
        home: HomePage(),
        // home: const MyPhone(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Text("Something went wrong");
          } else if (snapshot.hasData) {
            return NewBottom();
          } else {
            return const SignUp();
          }
        },
      ),
    );
  }
}
