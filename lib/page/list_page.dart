import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gudangbuku/page/login_page.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:gudangbuku/page/detail_page.dart';
import 'package:gudangbuku/sistem/theme_provider.dart' as custom;

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<dynamic> dataImport = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('https://projek-api-tugas-prak-cc-rqransntba-et.a.run.app/books'),
    );
    if (response.statusCode == 200) {
      setState(() {
        dataImport = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<custom.CustomThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "List Buku",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: dataImport.length,
                itemBuilder: (context, index) {
                  final data = dataImport[index];
                  return ListTile(
                    title: Text(
                      data['title'] ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(data['author'] ?? ''),
                    trailing: Text(
                      '${data['jumlah']} buku',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(book: data),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
