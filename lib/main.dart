import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restro/book_table.dart';
import 'package:restro/home.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const Restro());
}

class Restro extends StatelessWidget {
  const Restro({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const Home(),
        ),
        GoRoute(
          path: '/book-tables',
          name: 'book-tables',
          builder: (context, state) => const BookTable(),
        ),
      ],
    );

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          title: 'RexMenu',
        );
      },
    );
  }
}
