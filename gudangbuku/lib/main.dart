import 'package:flutter/material.dart';
import 'package:gudangbuku/Database/account_db.dart';
import 'package:gudangbuku/Database/boxes.dart';
import 'package:gudangbuku/pages/login_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
    return const MaterialApp(home: LoginPage());
  }
}
