import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:gudangbuku/sistem/theme_provider.dart' as custom;

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> book;

  const DetailPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<custom.CustomThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Buku',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('login', true);
            },
            icon: Icon(
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book['title'] ?? '',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Author: ${book['author'] ?? ''}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Jumlah: ${book['jumlah']} buku',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
