import 'package:gudangbuku/Database/account_db.dart';
import 'package:gudangbuku/Database/boxes.dart';

class Account {
  String username;
  String password;

  Account({required this.username, required this.password});

  void input() {
    boxAccount.put(
        'key_$username', AccountDB(username: username, password: password));
  }

  bool authentication() {
    for (int i = 0; i < boxAccount.length; i++) {
      AccountDB akun = boxAccount.getAt(i);
      if (username == akun.username && password == akun.password) {
        return true;
      }
    }
    return false;
  }
}
