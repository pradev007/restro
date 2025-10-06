import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              child: Center(
                child: Text(
                  "RexMenu",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 1, 211, 183),
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                  ),
                ),
              ),
            ),
            ListTile(leading: Icon(Icons.home_rounded), title: Text('Home')),
            ListTile(leading: Icon(Icons.category), title: Text('Categories')),
            ListTile(
              leading: Icon(Icons.table_restaurant_outlined),
              title: Text('Book Tables'),
            ),
            ListTile(leading: Icon(Icons.fastfood_sharp), title: Text('Order')),
            ListTile(
              leading: Icon(Icons.shopping_cart_outlined),
              title: Text('Cart'),
            ),
            ListTile(leading: Icon(Icons.person_2), title: Text('Profile')),
            ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Restro"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(139, 247, 173, 15),
      ),
      body: Stack(
        children: [
          // Background image with opacity
          Image.asset(
            'assets/images/restaurant.jpg',
            fit: BoxFit.cover,
            opacity: const AlwaysStoppedAnimation(0.5), // Reduce opacity
          ),

          // Centered text
          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 50.w,
              vertical: 50.h,
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.only(top: 50.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                    137,
                    26,
                    25,
                    25,
                  ), // Semi-transparent background for readability
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  "The Best Restaurant at your fingertip",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 213, 226, 96),
                    shadows: [
                      Shadow(
                        color: const Color.fromARGB(108, 0, 0, 0),
                        offset: const Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
