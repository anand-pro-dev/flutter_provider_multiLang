import 'package:flutter/material.dart';
import 'package:mshora/temp/test/scroll_to_hide_bottom/page_one_hide.dart';

class HideBottomToScroll extends StatefulWidget {
  const HideBottomToScroll({super.key});

  @override
  State<HideBottomToScroll> createState() => _HideBottomToScrollState();
}

class _HideBottomToScrollState extends State<HideBottomToScroll> {
  bool visible = true; // Track the visibility of the bottom navigation bar
  int _selectedIndex = 0; // Track the selected bottom navigation bar item
  double _height = 90; // Define the height for the bottom navigation bar

  // Widget list as a getter to access functions dynamically
  List<Widget> get _widgetOptions => [
        PageOneScrollHide(
          hideNavigation: () {
            hideNav();
          },
          showNavigation: () {
            showNav();
          },
        ),
        Center(child: Text('Business', style: TextStyle(fontSize: 30))),
        Center(child: Text('School', style: TextStyle(fontSize: 30))),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Sample'),
      ),
      // Display the selected page
      body: _widgetOptions[_selectedIndex],

      // Bottom Navigation Bar with hide/show animation
      bottomNavigationBar: AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: 20),
        curve: Curves.fastLinearToSlowEaseIn,
        height: visible ? _height : 0,
        duration: const Duration(milliseconds: 800),
        child: Wrap(
          children: [
            BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Business',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'School',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            ),
          ],
        ),
      ),
    );
  }

  void hideNav() {
    setState(() {
      visible = false;
    });
  }

  void showNav() {
    setState(() {
      visible = true;
    });
  }
}
