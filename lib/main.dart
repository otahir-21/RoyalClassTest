// Import necessary packages and files
import 'package:blogpractice/FragmentHome.dart'; // Import FragmentHome.dart
import 'package:blogpractice/myUills.dart'; // Import myUills.dart
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Authentication
import 'package:firebase_core/firebase_core.dart'; // Firebase Core
import 'package:flutter/material.dart'; // Flutter Material package
import 'package:get/get.dart'; // GetX package for state management
import 'package:shared_preferences/shared_preferences.dart'; // Shared Preferences for local storage

import 'View/LoginUi.dart'; // Import LoginUi.dart
import 'firebase_options.dart'; // Custom Firebase options

// Asynchronous function to initialize Firebase and run the app
Future<void> main() async {
  runApp(const MyApp()); // Run the MyApp widget
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await Firebase.initializeApp( // Initialize Firebase
    options: DefaultFirebaseOptions.currentPlatform, // Use default Firebase options
  );
}

// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor for MyApp widget

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp( // Use GetMaterialApp for navigation
      title: 'Flutter Demo',
      home: Splash(), // Set Splash as the initial screen
    );
  }
}

// Splash screen widget, handles initial app loading
class Splash extends StatefulWidget {
  const Splash({super.key}); // Constructor for Splash widget

  @override
  State<Splash> createState() => _SplashState(); // Create state for Splash
}

// State class for Splash widget
class _SplashState extends State<Splash> {
  @override
  void initState() {
    // Initialize state
    Future.delayed(const Duration(seconds: 2), () {
      userIsLogin(); // Check if user is logged in after 2 seconds
    });
    super.initState();
  }

  // Function to check if user is logged in
  userIsLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance(); // Get instance of SharedPreferences for local storage
    final String? userId = prefs.getString('userID'); // Get userID from SharedPreferences

    // Check if user is already logged in (Firebase Auth or local storage)
    if (FirebaseAuth.instance.currentUser != null || userId != null) {
      Get.off(() => const FragmentHome()); // Navigate to FragmentHome if logged in
    } else {
      Get.off(() => const LoginUi()); // Navigate to Loginui if not logged in
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height; // Get screen height

    return Scaffold( // Scaffold widget for app structure
      backgroundColor: myUtills.backgroundColor, // Background color
      body: SafeArea( // SafeArea to handle device insets
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Stack( // Stack for layering widgets
          children: [
            Positioned( // Positioned widget for background image
              top: myUtills.getHeight(context) * 0.10,
              left: myUtills.getHeight(context) * 0.05,
              child: Image.asset( // Background image asset
                'Assets/background.png',
                fit: BoxFit.fill,
              ),
            ),
            Center( // Center widget for centered text
              child: Text( // Text widget
                "E-Commerce App User",
                style: TextStyle( // Text style
                  color: Colors.white,
                  fontSize: height * 0.03,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
