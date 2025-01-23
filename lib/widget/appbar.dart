import 'package:flutter/material.dart';

class MinimalistAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MinimalistAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF101213),
              size: 24,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Indago',
            style: TextStyle(
              color: Color(0xFF101213),
              fontWeight: FontWeight.w600,
              fontSize: 24,
              letterSpacing: 0.0,
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 10,
        );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}