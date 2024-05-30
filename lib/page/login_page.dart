import 'package:flutter/material.dart';
import 'package:gudangbuku/page/home_page.dart';
import 'package:gudangbuku/sistem/account_operation.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginPageSTF();
  }
}

class LoginPageSTF extends StatefulWidget {
  const LoginPageSTF({super.key});

  @override
  State<LoginPageSTF> createState() => _LoginPageSTFState();
}

class _LoginPageSTFState extends State<LoginPageSTF> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Color.fromARGB(237, 255, 73, 73),
          Color.fromARGB(0, 255, 255, 255)
        ],
      )),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Login Page',
              style: myTextStyle(
                  color: Color.fromARGB(255, 255, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const SizedBox(height: 16),
            _usernameField(),
            const SizedBox(height: 16),
            _passwordField(),
            const SizedBox(height: 16),
            _buttonLogin(),
            const SizedBox(height: 16),
            _register()
          ],
        ),
      ),
    ));
  }

  TextStyle myTextStyle({
    double fontSize = 16.0,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle, // Ini akan menimpa warna teks dengan putih
    );
  }

  Widget _usernameField() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.5),
              blurRadius: 8.0,
              offset: Offset(0, 4),
            )
          ]),
          child: TextFormField(
            enabled: true,
            onChanged: (value) {
              setState(() {
                username = value;
              });
            },
            decoration: const InputDecoration(
                hintText: 'Username',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.red, width: 2.0))),
          ),
        ));
  }

  Widget _passwordField() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.5),
              blurRadius: 8.0,
              offset: Offset(0, 4),
            )
          ]),
          child: TextFormField(
            obscureText: true,
            enabled: true,
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
            decoration: const InputDecoration(
                hintText: 'Password',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.red, width: 2.0))),
          ),
        ));
  }

  Widget _buttonLogin() {
    return ElevatedButton(
        onPressed: () {
          Account akun = Account(username: username, password: password);
          if (akun.authentication()) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Gagal Login : Cek username dan password')));
          }
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 255, 0, 0),
            foregroundColor: Color.fromARGB(255, 2555, 2555, 255)),
        child: const Text('Login'));
  }

  Widget _register() {
    return TextButton(
        onPressed: () {
          Account akun = Account(username: username, password: password);
          akun.input();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Akun $username berhasil dibuat')));
        },
        style: TextButton.styleFrom(
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        child: const Text('Register Disini'));
  }
}
