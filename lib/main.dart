import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/home_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator BMI',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.red,
          background: Colors.red.shade400,
          surface: Colors.red.shade100
        )
      ),
      initialRoute: "/register",
      routes: {
        "/register": (context) => RegisterPage(),
        "/login":(context) => LoginPage(username: username, password: password,),
        "/home":(context) => HomePage(username: username,)
      },
    );
  }
}
