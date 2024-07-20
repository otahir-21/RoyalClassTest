// Import necessary packages and files
import 'package:blogpractice/FragmentHome.dart'; // Import FragmentHome.dart for home screen
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Authentication
import 'package:flutter/material.dart'; // Flutter Material package
import 'package:gap/gap.dart'; // Gap package for spacing widgets
import 'package:get/get.dart'; // GetX package for state management
import 'package:google_sign_in/google_sign_in.dart'; // Google Sign-In package
import 'package:shared_preferences/shared_preferences.dart'; // Shared Preferences for local storage

import '../myUills.dart'; // Import myUills.dart for utility functions

// Login screen widget
class LoginUi extends StatefulWidget {
  const LoginUi({super.key}); // Constructor for Loginui widget

  @override
  State<LoginUi> createState() => _LoginUiState(); // Create state for Loginui
}

// State class for Loginui widget
class _LoginUiState extends State<LoginUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold widget for app structure
      backgroundColor: myUtills.backgroundColor, // Background color from myUtills

      body: SafeArea( // SafeArea widget to handle device insets
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Stack( // Stack widget for layering widgets
          children: [
            Positioned( // Positioned widget for background image
              top: myUtills.getHeight(context) * 0.10,
              left: myUtills.getHeight(context) * 0.05,
              child: Image.asset( // Background image asset
                'Assets/background.png',
                fit: BoxFit.fill,
              ),
            ),
            Column( // Column widget for vertical layout
              children: [
                Row( // Row widget for horizontal layout
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container( // Container widget for login profile text
                      height: myUtills.getHeight(context) * 0.04,
                      margin: EdgeInsets.only(
                        left: myUtills.getHeight(context) * 0.03,
                      ),
                      alignment: Alignment.centerLeft,
                      child: myUtills.textField( // Custom text field from myUtills
                          context,
                          "Login profile",
                          Colors.white,
                          FontWeight.bold,
                          0.020,
                          TextAlign.left),
                    ),
                  ],
                ),
                Gap(myUtills.getHeight(context) * 0.10), // Vertical gap from Gap package
                Container( // Container widget for authentication text
                    margin: EdgeInsets.only(left: myUtills.getHeight(context) * 0.03),
                    child: myUtills.textField(context, "Authentication with firebase", Colors.white, FontWeight.bold, 0.020, TextAlign.left)),

                Gap(myUtills.getHeight(context) * 0.02), // Vertical gap from Gap package
                TextButton( // TextButton widget for Google Sign-In
                    onPressed: () async {
                      signInWithGoogle(); // Call signInWithGoogle function on button press
                    },
                    child: Container(
                        height: myUtills.getHeight(context) * 0.06,
                        width: myUtills.getWidth(context) * 0.50,
                        decoration: BoxDecoration(
                            color: myUtills.buttonBackGround, // Button background color from myUtills
                            borderRadius: const BorderRadius.all(Radius.circular(10))
                        ),
                        child: Center(child: myUtills.textField(context, "Login with google", Colors.white, FontWeight.bold, 0.016, TextAlign.center)))) // Custom text field for button text
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to handle Google Sign-In
  Future<void> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        throw FirebaseAuthException(
          code: 'account-exists-with-different-credential',
          message: 'The account already exists with a different credential.',
        );
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the credential
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // Access the user information
      final User? user = userCredential.user;

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      if (user != null) {
        // Store user ID in SharedPreferences
        await prefs.setString('userID', user.uid);
        Get.to(() => const FragmentHome()); // Navigate to FragmentHome on successful login
      } else {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'No user found after successful sign-in.',
        );
      }
    } catch (e) {
      throw FirebaseAuthException(
        code: 'google-signin-failed',
        message: 'Failed to sign in with Google: $e',
      );
    }
  }
}
