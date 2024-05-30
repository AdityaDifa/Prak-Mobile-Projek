import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './list_page.dart';
import './setting_page.dart';
import 'package:gudangbuku/sistem/theme_provider.dart' as custom;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    ListPage(),
    FavoritePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<custom.CustomThemeProvider>(context);

    Color getSelectedItemColor() {
      switch (themeProvider.themeMode) {
        case custom.CustomThemeMode.green:
          return Colors.green;
        case custom.CustomThemeMode.blue:
          return Colors.blue;
        case custom.CustomThemeMode.red:
        default:
          return Colors.red;
      }
    }

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Homepage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: getSelectedItemColor(),
        onTap: _onItemTapped,
      ),
    );
  }
}
