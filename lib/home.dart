import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<DropdownMenuItem<String>> _dropdownItems = [
    DropdownMenuItem(
      value: 'Option 1',
      child: Row(children: [Icon(Icons.person_2_rounded), Text('Profile')]),
    ),
    DropdownMenuItem(
      value: 'Option 2',
      child: Row(children: [Icon(Icons.settings), Text('Settings')]),
    ),
    DropdownMenuItem(
      value: 'Option 3',
      child: Row(children: [Icon(Icons.logout), Text('Logout')]),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int myRadiusValue = 10;

    return GestureDetector(
      // This captures taps on areas outside the Scaffold's interactive children,
      // and helps catch taps on AppBar area as well.
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.amber),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "RexMenu",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 1, 211, 183),
                          fontWeight: FontWeight.bold,
                          fontSize: 22.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const ListTile(
                leading: Icon(Icons.home_rounded),
                title: Text('Home'),
              ),
              const ListTile(
                leading: Icon(Icons.category),
                title: Text('Categories'),
              ),
              ListTile(
                leading: const Icon(Icons.table_restaurant_outlined),
                title: const Text('Book Tables'),
                onTap: () {
                  Navigator.pop(context); // close the drawer
                  context.go('/book-tables'); // navigate to BookTable page
                },
              ),

              const ListTile(
                leading: Icon(Icons.fastfood_sharp),
                title: Text('Order'),
              ),
              const ListTile(
                leading: Icon(Icons.shopping_cart_outlined),
                title: Text('Cart'),
              ),
              const ListTile(
                leading: Icon(Icons.person_2),
                title: Text('Profile'),
              ),
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              const ListTile(
                leading: Icon(Icons.logout_rounded),
                title: Text('Logout'),
              ),
            ],
          ),
        ),

        // Wrap AppBar so taps on AppBar itself also unfocus
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: AppBar(
              title: const Text("Restro"),
              centerTitle: true,
              actions: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: FaIcon(FontAwesomeIcons.solidCircleUser),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    // value: _selectedDropDownValue,
                    items: _dropdownItems,
                    onChanged: (String? newValue) {
                      setState(() {});
                    },
                    icon: Icon(Icons.person),
                  ),
                ),
              ],
              backgroundColor: const Color.fromARGB(139, 247, 173, 15),
            ),
          ),
        ),

        body: SafeArea(
          maintainBottomViewPadding: true,
          left: true,
          right: true,
          child: Listener(
            // Listener receives raw pointer events even if children consume gestures.
            behavior: HitTestBehavior.translucent,
            onPointerDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            child: SingleChildScrollView(
              // Keeps your layout scrollable while still allowing the Listener above to catch taps.
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(myRadiusValue.toDouble()),
                          bottomRight: Radius.circular(
                            myRadiusValue.toDouble(),
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/restaurant.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 4,
                          opacity: const AlwaysStoppedAnimation(0.5),
                        ),
                      ),
                      Positioned.fill(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(137, 26, 25, 25),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                "The Best Restaurant at Your Fingertips",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(
                                    255,
                                    213,
                                    226,
                                    96,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // big clickable area to test tap outside
                  const SizedBox(height: 16),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      textInputAction: TextInputAction.search,
                      // remove autofocus (don't auto-open keyboard)
                      // autofocus: true,
                      onFieldSubmitted: (value) {
                        // perform search
                        debugPrint('search: $value');
                      },
                    ),
                  ),

                  // SizedBox(height: 400),
                  Container(
                    color: const Color.fromARGB(255, 126, 125, 125),
                    // height: MediaQuery.sizeOf(context).height,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Top Categories",
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: Colors.pinkAccent,
                                fontWeight: FontWeight.w800,
                                shadows: [
                                  Shadow(
                                    blurRadius: 2.0,
                                    color: const Color.fromARGB(
                                      255,
                                      199,
                                      199,
                                      199,
                                    ),
                                    offset: Offset(-1.0, 1.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.center,

                            children: List.generate(
                              9,
                              (index) => Container(
                                height: 30.h,
                                width: 100.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.amber,
                                ),
                                // color: const Color.fromARGB(255, 74, 214, 104),
                                child: Center(child: Text("data ${index + 1}")),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 184, 25, 25),
                    height: 500.h,
                  ), // tappable area for testing
                  Container(color: Colors.black, height: 500.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
