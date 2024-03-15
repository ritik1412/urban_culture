import 'package:flutter/material.dart';
import 'package:urban_culture/config/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kbackgrondcolor,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Epilogue',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
