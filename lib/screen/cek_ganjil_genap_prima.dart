import 'package:flutter/material.dart';

class GanjilGenapPrimaPage extends StatefulWidget {
  const GanjilGenapPrimaPage({super.key});

  @override
  State<GanjilGenapPrimaPage> createState() => _GanjilGenapPrimaPageState();
}

class _GanjilGenapPrimaPageState extends State<GanjilGenapPrimaPage> {
  final TextEditingController angkaController = TextEditingController();
  String _hasil = "";
  String _warningMessage = "";

  bool isPrima(int n) {
    if (n < 2) return false;
    for (int i = 2; i <= n ~/ 2; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  void resetForm() {
    setState(() {
      angkaController.clear();
      _hasil = "";
      _warningMessage = "";
    });
  }

  void cekAngka() {
    if (angkaController.text.isEmpty) {
      setState(() {
        _warningMessage = "Masukkan angka terlebih dahulu";
      });
      return;
    }

    int? angka = int.tryParse(angkaController.text);

    if (angka == null) {
      setState(() {
        _warningMessage = "Input harus berupa angka!";
      });
      return;
    } else {
      setState(() {
        _warningMessage = "";
      });
    }

    String jenis = (angka % 2 == 0) ? "Genap" : "Ganjil";
    String prima = isPrima(angka)
        ? "dan merupakan bilangan Prima"
        : "dan bukan bilangan Prima";

    setState(() {
      _hasil = "Bilangan $angka merupakan bilangan $jenis $prima";
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

        if (_warningMessage.isNotEmpty)
          Text(_warningMessage, style: const TextStyle(color: Colors.red)),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: cekAngka, child: const Text("Cek")),
        ),

        const SizedBox(height: 20),

        TextField(
          controller: TextEditingController(text: _hasil),
          readOnly: true,
          maxLines: 3,
          decoration: const InputDecoration(
            labelText: "Hasil",
            alignLabelWithHint: true,
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 20),

        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: ElevatedButton(
              onPressed: resetForm,
              child: const Text("Reset"),
            ),
          ),
        ),
      ],
    );
  }
}
