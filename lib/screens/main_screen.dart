import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/components/sidebar_menu.dart';
import 'package:news_app/screens/favorite_screen.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/profile_screen.dart';
import 'package:provider/provider.dart';

import '../Network/NewsList.dart';
import '../Network/Utils.dart';
import 'browse_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DiscoverScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  int _selectedIndex = 0;
  bool _isLoading = true;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    final newsList = Provider.of<NewsList>(context, listen: false);
    final newsItems = await NetworkCall().fetchNews();
    newsList.setNews(newsItems);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.blue[500]!,
              color: Colors.grey.shade400,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.language,
                  text: 'Browse',
                ),
                GButton(
                  icon: Icons.favorite_border_outlined,
                  text: 'Favorites',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profil',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      drawer: SidebarMenu(),
    );
  }
}
