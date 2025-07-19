import 'package:flutter/material.dart';
import 'screens/category_screen.dart';
import 'screens/search_screen.dart';

class MainScaffold extends StatefulWidget {
  final int currentIndex;

  const MainScaffold({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  late int _selectedIndex;

  final List<Widget> _screens = [CategoryScreen(), const SearchScreen()];

  @override
  void initState() {
    _selectedIndex = widget.currentIndex;
    super.initState();
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => MainScaffold(currentIndex: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      backgroundColor: const Color.fromARGB(255, 220, 220, 223),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),

        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: const Color.fromARGB(210, 1, 1, 1),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Categories',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ],
        ),
      ),
    );
  }
}
