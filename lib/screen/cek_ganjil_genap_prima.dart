import 'package:flutter/material.dart';

class GanjilGenapPrimaPage extends StatefulWidget {
  const GanjilGenapPrimaPage({super.key});

  @override
  State<GanjilGenapPrimaPage> createState() => _GanjilGenapPrimaPageState();
}

class _GanjilGenapPrimaPageState extends State<GanjilGenapPrimaPage> {
  final TextEditingController angkaController = TextEditingController();
  String hasil = "";

  bool isPrima(int n) {
    if (n < 2) return false;
    for (int i = 2; i <= n ~/ 2; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  void cekAngka() {
    if (angkaController.text.isEmpty) {
      setState(() {
        hasil = "Masukkan angka terlebih dahulu";
      });
      return;
    }

    int angka = int.parse(angkaController.text);

    String jenis = (angka % 2 == 0) ? "Genap" : "Ganjil";
    String prima = isPrima(angka)
        ? "dan merupakan bilangan Prima"
        : "dan bukan bilangan Prima";

    setState(() {
      hasil = "Bilangan $jenis $prima";
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        
        Card(
          child: ExpansionTile(
            title: const Text("Apa itu bilangan Ganjil?"),
            children: const [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Bilangan ganjil adalah bilangan yang tidak habis dibagi 2. "
                  "Contohnya: 1, 3, 5, 7, 9.",
                ),
              ),
            ],
          ),
        ),

        Card(
          child: ExpansionTile(
            title: const Text("Apa itu bilangan Genap?"),
            children: const [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Bilangan genap adalah bilangan yang habis dibagi 2. "
                  "Contohnya: 2, 4, 6, 8, 10.",
                ),
              ),
            ],
          ),
        ),

        Card(
          child: ExpansionTile(
            title: const Text("Apa itu bilangan Prima?"),
            children: const [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Bilangan prima adalah bilangan yang hanya memiliki dua faktor "
                  "yaitu 1 dan dirinya sendiri. Contohnya: 2, 3, 5, 7, 11.",
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        /// INPUT ANGKA
        const Text(
          "Cek Jenis Bilangan",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 15),

        TextField(
          controller: angkaController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Masukkan angka",
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 20),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: cekAngka, child: const Text("Cek")),
        ),

        const SizedBox(height: 20),

        Text(
          hasil,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
