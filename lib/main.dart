import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gudangbuku/Database/account_db.dart';
import 'package:gudangbuku/Database/boxes.dart';
import 'package:gudangbuku/page/login_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:gudangbuku/sistem/theme_provider.dart' as custom;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AccountDBAdapter());
  boxAccount = await Hive.openBox<AccountDB>('accountBox');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => custom.CustomThemeProvider(),
      child: Consumer<custom.CustomThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Gudang Buku',
            theme: ThemeData(
              primaryColor: Colors.red,
              scaffoldBackgroundColor: Colors.white,
            ),
            themeMode: themeProvider.themeMode == custom.CustomThemeMode.red
                ? ThemeMode.light
                : themeProvider.themeMode == custom.CustomThemeMode.green
                ? ThemeMode.dark
                : ThemeMode.system,
            darkTheme: ThemeData(
              primaryColor: Colors.green,
              scaffoldBackgroundColor: Colors.green[50],
            ),
            highContrastTheme: ThemeData(
              primaryColor: Colors.blue,
              scaffoldBackgroundColor: Colors.blue[50],
            ),
            home: const LoginPage(),
          );
        },
      ),
    );
  }
}
