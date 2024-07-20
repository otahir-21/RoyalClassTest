// Import necessary packages and files
import 'package:blogpractice/View/LoginUi.dart'; // Import LoginUi.dart for login screen UI
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Authentication package
import 'package:flutter/material.dart'; // Flutter Material package
import 'package:gap/gap.dart'; // Import Gap widget for spacing
import 'package:get/get.dart'; // Import Get package for navigation
import 'package:shared_preferences/shared_preferences.dart'; // Shared Preferences for local storage

import '../../myUills.dart'; // Import myUills.dart for utility functions

// ProfileUi widget, representing the user profile screen
class ProfileUi extends StatefulWidget {
  const ProfileUi({super.key}); // Constructor for ProfileUi widget

  @override
  State<ProfileUi> createState() => _ProfileUiState(); // Create state for ProfileUi
}

// State class for ProfileUi widget
class _ProfileUiState extends State<ProfileUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold widget for app structure
      backgroundColor: myUtills.backgroundColor, // Background color from myUtills
      body: SafeArea( // SafeArea widget for content
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Stack( // Stack widget for layering content
          children: [
            Positioned( // Positioned widget for background image
              top: myUtills.getHeight(context) * 0.10,
              left: myUtills.getHeight(context) * 0.05,
              child: Image.asset(
                'Assets/background.png',
                fit: BoxFit.fill,
              ),
            ),
            Column( // Column widget for vertical arrangement
              children: [
                Row( // Row widget for header
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container( // Container for header title
                      height: myUtills.getHeight(context) * 0.04,
                      margin: EdgeInsets.only(
                        left: myUtills.getHeight(context) * 0.03,
                      ),
                      alignment: Alignment.centerLeft,
                      child: myUtills.textField(
                          context,
                          "User Profile",
                          Colors.white,
                          FontWeight.bold,
                          0.020,
                          TextAlign.left),
                    ),
                  ],
                ),
                Gap(myUtills.getHeight(context) * 0.10), // Vertical gap from myUtills

                SizedBox( // SizedBox for user information rows
                  width: double.infinity,
                  child: Row( // Row for user name
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container( // Container for label "User Name:"
                          margin: EdgeInsets.only(
                              left: myUtills.getHeight(context) * 0.03),
                          child: myUtills.textField(context, "User Name:", Colors.white, FontWeight.bold, 0.020, TextAlign.left)),
                      Container( // Container for user name
                          margin: EdgeInsets.only(
                              left: myUtills.getHeight(context) * 0.03),
                          child: myUtills.textField(context, "Osama Tahir", Colors.white, FontWeight.normal, 0.014, TextAlign.left))
                    ],
                  ),
                ),
                Gap(myUtills.getHeight(context) * 0.02), // Vertical gap from myUtills

                SizedBox( // SizedBox for user information rows
                  width: double.infinity,
                  child: Row( // Row for user email
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container( // Container for label "User Email:"
                          margin: EdgeInsets.only(
                              left: myUtills.getHeight(context) * 0.03),
                          child: myUtills.textField(context, "User Email:", Colors.white, FontWeight.bold, 0.020, TextAlign.left)),
                      Container( // Container for user email
                          margin: EdgeInsets.only(
                              left: myUtills.getHeight(context) * 0.03),
                          child: myUtills.textField(context, "otahir21@gmail.com", Colors.white, FontWeight.normal, 0.014, TextAlign.left))
                    ],
                  ),
                ),
                Gap(myUtills.getHeight(context) * 0.02), // Vertical gap from myUtills

                TextButton( // TextButton for logout
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut(); // Sign out user from Firebase Authentication
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.remove('userID'); // Remove userID from SharedPreferences
                      Get.to(() => const LoginUi()); // Navigate to login screen
                    },
                    child: Container( // Container for logout button
                        height: myUtills.getHeight(context) * 0.06,
                        width: myUtills.getWidth(context) * 0.50,
                        decoration: BoxDecoration(
                            color: myUtills.buttonBackGround, // Background color from myUtills
                            borderRadius: const BorderRadius.all(Radius.circular(10))), // Border radius
                        child: Center(child: myUtills.textField(context, "Log out", Colors.white, FontWeight.bold, 0.016, TextAlign.center))))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
