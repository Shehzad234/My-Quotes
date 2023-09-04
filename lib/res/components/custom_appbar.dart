import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final bool pinned;
  final PreferredSizeWidget? bottom;
  const CustomAppbar(
      {required this.title, this.pinned = false, this.bottom, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      pinned: pinned,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
      bottom: bottom,
    );
  }
}
