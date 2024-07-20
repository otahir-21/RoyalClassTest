// Import necessary packages and files
import 'package:blogpractice/View/ProductDetailUi.dart'; // Import ProductDetailUi.dart for product detail screen UI
import 'package:flutter/material.dart'; // Flutter Material package
import 'package:gap/gap.dart'; // Import Gap widget for spacing
import 'package:get/get.dart'; // Import Get package for navigation

// Import controllers and utilities
import '../../Controller/FetchCategoryController/FetchListOfCategory.dart'; // Import FetchListOfCategory controller
import '../../Controller/FetchListOfProductController/FetchProduct.dart'; // Import FetchProduct controller
import '../../myUills.dart'; // Import myUills.dart for utility functions

// HomeUi widget, representing the home screen
class HomeUi extends StatefulWidget {
  const HomeUi({super.key}); // Constructor for HomeUi widget

  @override
  State<HomeUi> createState() => _HomeUiState(); // Create state for HomeUi
}

// State class for HomeUi widget
class _HomeUiState extends State<HomeUi> {
  // Instances of controllers
  FetchListOfCategory fetchListOfCategory = FetchListOfCategory();
  FetchProduct fetchProduct = FetchProduct();

  @override
  void initState() {
    // Fetch initial data on widget initialization
    fetchListOfCategory.fetchCategory();
    fetchProduct.fetchProduct();
    super.initState();
  }

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
                          "Choose your Product",
                          Colors.white,
                          FontWeight.bold,
                          0.020,
                          TextAlign.left),
                    ),
                    Container( // Container for search icon
                      height: myUtills.getHeight(context) * 0.04,
                      margin: EdgeInsets.only(
                        right: myUtills.getHeight(context) * 0.03,
                      ),
                      width: myUtills.getWidth(context) * 0.10,
                      decoration: BoxDecoration(
                        color: myUtills.buttonBackGround,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: myUtills.getHeight(context) * 0.03,
                      ),
                    ),
                  ],
                ),
                Gap(myUtills.getHeight(context) * 0.02), // Vertical gap from myUtills
                Container( // Container for clipped image
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    left: myUtills.getHeight(context) * 0.02,
                    right: myUtills.getHeight(context) * 0.02,
                  ),
                  child: ClipPath( // ClipPath widget for custom shape
                    clipper: MyClipper(), // Custom clipper for shape
                    child: Container( // Container for clipped image
                      decoration: BoxDecoration(
                        color: myUtills.sliderDesignColor, // Background color from myUtills
                        borderRadius:
                        const BorderRadius.all(Radius.circular(20)), // Border radius
                      ),
                      child: Image.asset('Assets/bike.png'), // Replace with your image asset
                    ),
                  ),
                ),
                Gap(myUtills.getHeight(context) * 0.02), // Vertical gap from myUtills
                Obx(() { // Reactive Obx widget for category list
                  if (fetchListOfCategory.isFetingCat.value) { // Check if fetching categories
                    return const CircularProgressIndicator(); // Show loading indicator
                  } else {
                    return Container( // Container for category list
                      height: myUtills.getHeight(context) * 0.06,
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        left: myUtills.getHeight(context) * 0.02,
                      ),
                      child: SizedBox(
                        height: myUtills.getHeight(context) * 0.05,
                        width: myUtills.getWidth(context) * 0.70,
                        child: ListView.builder(
                          itemCount:
                          fetchListOfCategory.cateoryList.length, // Number of categories
                          scrollDirection: Axis.horizontal, // Horizontal scroll direction
                          itemBuilder: (BuildContext context, int index) {
                            var data = fetchListOfCategory.cateoryList[index]; // Get category data
                            return Container( // Container for category item
                              height: myUtills.getHeight(context) * 0.05,
                              width: myUtills.getWidth(context) * 0.20,
                              margin: EdgeInsets.only(
                                left: myUtills.getHeight(context) * 0.01,
                                right: myUtills.getHeight(context) * 0.01,
                              ),
                              decoration: BoxDecoration(
                                color: myUtills.sliderDesignColor, // Background color from myUtills
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10)), // Border radius
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4), // Shadow color
                                    spreadRadius: 1, // Spread radius
                                    blurRadius: 1, // Blur radius
                                  ),
                                ],
                              ),
                              child: Center(
                                child: myUtills.textField(
                                  context,
                                  data.name, // Category name
                                  Colors.white, // Text color
                                  FontWeight.bold, // Font weight
                                  0.01, // Font size factor
                                  TextAlign.center, // Text alignment
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                }),
                Gap(myUtills.getHeight(context) * 0.02), // Vertical gap from myUtills
                Obx(() { // Reactive Obx widget for product list
                  if (fetchProduct.isFetingProduct.value) { // Check if fetching products
                    return const CircularProgressIndicator(); // Show loading indicator
                  } else {
                    return Container( // Container for product grid
                      height: myUtills.getHeight(context) * 0.45,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                        horizontal: myUtills.getHeight(context) * 0.02,
                      ),
                      child: GridView.builder(
                        shrinkWrap: true, // Allow grid to shrink wrap its content
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 items per row
                          crossAxisSpacing: 10, // Spacing between columns
                          mainAxisSpacing: 10, // Spacing between rows
                          childAspectRatio: 1, // Aspect ratio of items
                        ),
                        itemCount: fetchProduct.productList.length, // Number of products
                        itemBuilder: (context, index) {
                          var data = fetchProduct.productList[index]; // Get product data
                          return InkWell( // InkWell for tapping on product
                            onTap: () {
                              Get.to(() => const ProductDetailUi()); // Navigate to product detail screen
                            },
                            child: ClipPath( // ClipPath for custom product shape
                              clipper: MyClipperSecond(), // Custom clipper for shape
                              child: Container( // Container for product item
                                decoration: BoxDecoration(
                                  color: myUtills.sliderDesignColor, // Background color from myUtills
                                  borderRadius: const BorderRadius.all(Radius.circular(20)), // Border radius
                                ),
                                child: Column( // Column for product details
                                  children: [
                                    Container( // Container for favorite icon
                                      alignment: Alignment.topRight,
                                      margin: EdgeInsets.only(
                                        top: myUtills.getHeight(context) * 0.01,
                                        right: myUtills.getHeight(context) * 0.02,
                                      ),
                                      child: const Icon(Icons.favorite_border,color: Colors.white,), // Favorite icon
                                    ),
                                    Container( // Container for product image
                                      height: myUtills.getHeight(context) * 0.08,
                                      width: myUtills.getWidth(context) * 0.30,
                                      child: Image.network(data.category.image), // Product image
                                    ),
                                    Container( // Container for product title
                                      width: double.infinity,
                                      alignment: Alignment.topLeft,
                                      child: myUtills.textField(
                                        context,
                                        data.title, // Product title
                                        Colors.white, // Text color
                                        FontWeight.w500, // Font weight
                                        0.014, // Font size factor
                                        TextAlign.center, // Text alignment
                                      ),
                                    ),
                                    Container( // Container for product price
                                      alignment: Alignment.topLeft,
                                      width: double.infinity,
                                      margin: EdgeInsets.only(
                                        left: myUtills.getWidth(context) * 0.04,
                                      ),
                                      child: myUtills.textField(
                                        context,
                                        '\$ ${data.price.toString()}', // Product price
                                        Colors.white, // Text color
                                        FontWeight.w500, // Font weight
                                        0.014, // Font size factor
                                        TextAlign.center, // Text alignment
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom clipper class for creating a specific shape
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0.0, 0.0); // Move to the top-left corner
    path.lineTo(0.0, size.height * 1); // Line to a point above the bottom
    path.lineTo(size.width, size.height * 0.82); // Line to the same point on the right
    path.lineTo(size.width, 0.0); // Line to the top-right corner
    return path; // Return the created path
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // No need to reclip if the old and new clips are identical
  }
}

// Custom clipper class for creating another specific shape
class MyClipperSecond extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var roundnessFactor = 10.0;

    // Starting point for the bottom clip
    path.moveTo(0, size.height * 0.67);

    // Bottom-left corner curve
    path.lineTo(0, roundnessFactor * 3);
    path.quadraticBezierTo(20, 20, roundnessFactor, 30);

    // Bottom side
    path.lineTo(size.width - roundnessFactor, 0);
    path.quadraticBezierTo(size.width, 0, size.width, roundnessFactor);

    // Bottom-right corner curve
    path.lineTo(size.width, size.height - roundnessFactor);
    path.quadraticBezierTo(
        size.width, size.height, size.width - roundnessFactor, size.height);

    // Top-right corner curve
    path.lineTo(roundnessFactor * 2, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - roundnessFactor);
    return path; // Return the created path
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // No need to reclip if the old and new clips are identical
  }
}
