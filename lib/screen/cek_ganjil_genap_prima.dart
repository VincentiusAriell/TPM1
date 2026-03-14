import 'package:flutter/material.dart';

class GanjilGenapPrimaPage extends StatefulWidget {
  const GanjilGenapPrimaPage({super.key});

  @override
  State<GanjilGenapPrimaPage> createState() => _GanjilGenapPrimaPageState();
}

class _GanjilGenapPrimaPageState extends State<GanjilGenapPrimaPage> {
  final TextEditingController angkaController = TextEditingController();
  String hasil = "";

  void cekAngka() {
    int angka = int.parse(angkaController.text);

    // cek ganjil genap
    if (angka % 2 == 0) {
      hasil = "Bilangan Genap";
    } else {
      hasil = "Bilangan Ganjil";
    }

    // cek bilangan prima
    bool prima = true;

    if (angka < 2) {
      prima = false;
    } else {
      for (int i = 2; i <= angka ~/ 2; i++) {
        if (angka % i == 0) {
          prima = false;
          break;
        }
      }
    }

    if (prima) {
      hasil += "dan Bilangan Prima";
    } else {
      hasil += "dan Bukan Bilangan Prima";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: angkaController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Masukkan angka",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(onPressed: cekAngka, child: const Text("Cek")),

          const SizedBox(height: 20),

          Text(
            hasil,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}