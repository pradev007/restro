import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookTable extends StatelessWidget {
  const BookTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        color: Colors.amber,
        height: MediaQuery.sizeOf(context).height,
      ),
    );
  }
}
