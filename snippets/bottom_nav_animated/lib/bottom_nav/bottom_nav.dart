import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'curved_navigation_bar.dart';

class Nav extends StatefulWidget {
  static const String id = 'nav';

  const Nav({super.key});
  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = [
    const Center(child: Text('Home')),
    const Center(child: Text('Explore')),
    const Center(child: Text('Edit')),
    const Center(child: Text('Notifications')),
    const Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey.shade200,
        buttonBackgroundColor: Colors.blueAccent.shade100,
        color: Colors.white,
        items: const [
          Icon(Icons.home, color: Colors.black, size: 25),
          Icon(Icons.search, color: Colors.black, size: 25),
          Icon(Icons.create_outlined, color: Colors.black, size: 25),
          FaIcon(FontAwesomeIcons.heart, size: 25),
          Icon(Icons.person_outline, color: Colors.black, size: 25),
        ],
        index: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
