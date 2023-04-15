import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double _result = 0.0;
  String _result2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Pengguna :  $username",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'BNI Calculator : ${_result.toStringAsFixed(1)}, $_result2',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Masukkan Tinggi (cm)'),
              ),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Masukkan Berat (kg)'),
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 31, 191, 77),
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                onPressed: () {
                  double height = double.parse(heightController.text) / 100;
                  double weight = double.parse(weightController.text);
                  setState(() {
                    _result = weight / (height * height);
                    if (_result < 18.5) {
                      _result2 = 'Underweight';
                    } else if (_result >= 18.5 && _result < 25) {
                      _result2 = 'Normal weight';
                    } else if (_result >= 25 && _result < 30) {
                      _result2 = 'Overweight';
                    } else {
                      _result2 = 'Obesity';
                    }
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Menghitung BMI...")));
                },
                child: Text(
                  'Hitung BMI',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 150,
              )
            ],
          ),
        ),
      ),
    );
  }
}
