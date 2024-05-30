import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gudangbuku/page/login_page.dart';
import 'package:gudangbuku/sistem/theme_provider.dart' as custom;

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<custom.CustomThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Page',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: themeProvider.themeMode == custom.CustomThemeMode.red
            ? Colors.red
            : themeProvider.themeMode == custom.CustomThemeMode.green
            ? Colors.green
            : Colors.blue,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                themeProvider.setTheme(custom.CustomThemeMode.red);
              },
              child: const Text('Red Theme'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                themeProvider.setTheme(custom.CustomThemeMode.green);
              },
              child: const Text('Green Theme'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                themeProvider.setTheme(custom.CustomThemeMode.blue);
              },
              child: const Text('Blue Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
