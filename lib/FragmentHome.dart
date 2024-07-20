// Import necessary packages and files
import 'package:blogpractice/View/Fragments/FavUi.dart';
import 'package:blogpractice/View/Fragments/HomeUi.dart'; // Import HomeUi.dart for home screen UI
import 'package:blogpractice/View/Fragments/ProfileUI.dart'; // Import ProfileUI.dart for profile screen UI
import 'package:blogpractice/View/Fragments/cartUi.dart';
import 'package:blogpractice/myUills.dart'; // Import myUills.dart for utility functions
import 'package:flutter/material.dart'; // Flutter Material package

// FragmentHome widget, managing the main app screens
class FragmentHome extends StatefulWidget {
  const FragmentHome({super.key}); // Constructor for FragmentHome widget

  @override
  State<FragmentHome> createState() => _FragmentHomeState(); // Create state for FragmentHome
}

// State class for FragmentHome widget
class _FragmentHomeState extends State<FragmentHome> {
  int _selectedDrawerIndex = 0; // Index for the selected screen in the bottom navigation bar

  // Function to handle bottom navigation item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedDrawerIndex = index; // Update selected index
    });
  }

  // Function to return the widget based on the selected index
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const HomeUi(); // Return HomeUi for index 0
      case 1:
        return const CartUi(); // Return HomeUi for index 1
      case 2:
        return const FavUi(); // Return HomeUi for index 2
      case 3:
        return const ProfileUi(); // Return ProfileUi for index 3
      default:
        return const Text("Error"); // Return error text for unknown index
    }
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(); // Global key for Scaffold state

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold widget for app structure
      body: Scaffold( // Nested Scaffold to handle body and bottom navigation
        key: scaffoldKey, // Set key for Scaffold state
        body: _getDrawerItemWidget(_selectedDrawerIndex), // Body content based on selected index
        bottomNavigationBar: Material( // Material widget for bottom navigation bar
          color: myUtills.sliderDesignColor, // Background color from myUtills
          elevation: 1, // Elevation for bottom navigation bar
          child: Card( // Card widget for bottom navigation bar
            color: myUtills.sliderDesignColor, // Background color from myUtills
            elevation: 0, // No elevation for the card
            child: Container( // Container widget for bottom navigation bar content
              margin: EdgeInsets.only(
                  bottom: myUtills.getHeight(context) * 0.02), // Margin from myUtills
              height: myUtills.getHeight(context) * 0.09, // Height from myUtills
              decoration: const BoxDecoration( // BoxDecoration for container
                // Additional decoration if needed
              ),
              child: Row( // Row widget for items in bottom navigation bar
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container( // Container for home icon
                    width: myUtills.getWidth(context) * 0.15, // Width from myUtills
                    margin: EdgeInsets.only(top: myUtills.getWidth(context) * 0.01), // Margin from myUtills
                    child: InkWell( // InkWell for home icon tap
                      splashColor: Colors.transparent, // Transparent splash color
                      highlightColor: Colors.transparent, // Transparent highlight color
                      onTap: () {
                        _onItemTapped(0); // Tap action for home icon
                      },
                      child: Column( // Column for home icon content
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox( // SizedBox for home icon size
                            width: myUtills.getWidth(context) * 0.046,
                            child: const Icon(Icons.home,color: Colors.white,), // Home icon
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container( // Container for shopping cart icon
                    width: myUtills.getWidth(context) * 0.15, // Width from myUtills
                    margin: EdgeInsets.only(top: myUtills.getHeight(context) * 0.01), // Margin from myUtills
                    child: InkWell( // InkWell for shopping cart icon tap
                      splashColor: Colors.transparent, // Transparent splash color
                      highlightColor: Colors.transparent, // Transparent highlight color
                      onTap: () {
                        _onItemTapped(1); // Tap action for shopping cart icon
                      },
                      child: Column( // Column for shopping cart icon content
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipPath( // ClipPath widget for custom shape
                            clipper: MyClipperSecond(), // Custom clipper for shape
                            child: SizedBox( // SizedBox for shopping cart icon size
                              width: myUtills.getWidth(context) * 0.046,
                              child: const Icon(Icons.add_shopping_cart,color: Colors.white,), // Shopping cart icon
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container( // Container for favorite icon
                    width: myUtills.getWidth(context) * 0.15, // Width from myUtills
                    margin: EdgeInsets.only(top: myUtills.getHeight(context) * 0.01), // Margin from myUtills
                    child: InkWell( // InkWell for favorite icon tap
                      splashColor: Colors.transparent, // Transparent splash color
                      highlightColor: Colors.transparent, // Transparent highlight color
                      onTap: () {
                        _onItemTapped(2); // Tap action for favorite icon
                      },
                      child: Column( // Column for favorite icon content
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox( // SizedBox for favorite icon size
                            width: myUtills.getWidth(context) * 0.046,
                            child: const Icon(Icons.favorite_border,color: Colors.white,), // Favorite icon
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container( // Container for profile icon
                    width: myUtills.getWidth(context) * 0.15, // Width from myUtills
                    margin: EdgeInsets.only(top: myUtills.getHeight(context) * 0.01), // Margin from myUtills
                    child: InkWell( // InkWell for profile icon tap
                      splashColor: Colors.transparent, // Transparent splash color
                      highlightColor: Colors.transparent, // Transparent highlight color
                      onTap: () {
                        _onItemTapped(3); // Tap action for profile icon
                      },
                      child: Column( // Column for profile icon content
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox( // SizedBox for profile icon size
                            width: myUtills.getWidth(context) * 0.046,
                            child: const Icon(Icons.account_circle,color: Colors.white,), // Profile icon
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
