import 'package:flutter/material.dart';
import 'package:movie_app/provider/app_navigation_provider.dart';
import 'package:movie_app/screens/movieScreens/latest_movie.dart';
import 'package:movie_app/screens/movieScreens/popular_movies.dart';
import 'package:movie_app/widgets/mainscreen/search_widget.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/widgets/mainscreen/bottom_navigator.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static final List<Widget> _widgetOptions = [
    PopularMoviesScreen(),
    LatestMoviesScreen(),
    Center(child: Text('Favorites Screen (Placeholder)')),
  ];

 @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<AppNavigationProvider>(context);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(17, 17, 17, 1), body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 25, top: 30),
              child: const SearchWidget(),
            ),
            Expanded(
              child: _widgetOptions.elementAt(navProvider.selectedIndex),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border(top: BorderSide(color: Colors.grey.shade900)),
        ),
        child: BottomNavigatorWidget(
          indexs: navProvider.selectedIndex,
          checkIndex: (index) => navProvider.updateIndex(index),
        ),
      ),
    );
  }
}
