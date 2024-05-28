import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

part 'account_db.g.dart';

@HiveType(typeId: 1)
class AccountDB {
  AccountDB({required this.username, required this.password});

  @HiveField(0)
  String username;

  @HiveField(1)
  String password;
}
