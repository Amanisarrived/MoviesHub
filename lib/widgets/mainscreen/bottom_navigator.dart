import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigatorWidget extends StatelessWidget {
  const BottomNavigatorWidget({
    required this.checkIndex,
    required this.indexs,
    super.key,
  });

  final int indexs;
  final void Function(int navIndex) checkIndex;

  @override
  Widget build(BuildContext context) {
    return GNav(
      padding: EdgeInsets.symmetric(vertical: 20),
      selectedIndex: indexs,
      onTabChange: (index) {
        checkIndex(index);
      },
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      tabs: [
        GButton(
          icon: Icons.movie_creation_outlined,
          text: "Popular Movies",
          textColor: Colors.white,
          gap: 6,
          iconActiveColor: Color.fromRGBO(255, 199, 0, 1),
          iconColor: Color.fromRGBO(65, 65, 65, 1),
        ),
        GButton(
          icon: Icons.picture_in_picture,
          text: "Latest Movies",
          textColor: Colors.white,
          gap: 6,
          iconActiveColor: Color.fromRGBO(255, 199, 0, 1),
          iconColor: Color.fromRGBO(65, 65, 65, 1),
        ),
      ],
    );
  }
}
