import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';

String username = "";
String password = "";

class RegisterPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Container(
          width: 200,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Pendaftaran",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Username",
                  ),
                  onSaved: (value) {
                    username = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                  obscureText: true,
                  onSaved: (value) {
                    password = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 36,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Registrasi Berhasil")));

                      Navigator.pushNamed(context, '/login',
                          arguments: {username: username, password: password});
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 31, 191, 77),
                      padding:
                          EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  child: const Text(
                    "Daftar",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
