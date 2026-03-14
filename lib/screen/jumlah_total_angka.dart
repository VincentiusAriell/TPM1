import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JumlahTotalDigitPage extends StatefulWidget {
  const JumlahTotalDigitPage({super.key});

  @override
  State<JumlahTotalDigitPage> createState() => _JumlahTotalDigitPageState();
}

class _JumlahTotalDigitPageState extends State<JumlahTotalDigitPage> {
  final TextEditingController angkaController = TextEditingController();

  String hasil = "";
  String proses = "";
  String warning = "";

  bool showProses = false;

  void hitungDigit() {
    if (angkaController.text.isEmpty) {
      setState(() {
        warning = "Masukkan angka terlebih dahulu";
      });
      return;
    }

    warning = "";

    String input = angkaController.text;
    List<int> digits = input.split('').map((e) => int.parse(e)).toList();

    int total = 0;
    for (var d in digits) {
      total += d;
    }

    String prosesHitung = digits.join(" + ");

    setState(() {
      hasil = "Total = $total";
      proses = "$prosesHitung = $total";
    });
  }

  void resetForm() {
    setState(() {
      angkaController.clear();
      hasil = "";
      proses = "";
      warning = "";
      showProses = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          "Jumlah Total Digit",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 20),

        /// INPUT
        TextField(
          controller: angkaController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ], // hanya angka
          decoration: const InputDecoration(
            labelText: "Masukkan angka",
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 10),

        if (warning.isNotEmpty)
          Text(
            warning,
            style: const TextStyle(color: Colors.red),
          ),

        const SizedBox(height: 20),

        /// BUTTON HITUNG
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: hitungDigit,
            child: const Text("Hitung"),
          ),
        ),

        const SizedBox(height: 20),

        /// SWITCH SHOW PROSES
        SwitchListTile(
          title: const Text("Tampilkan proses perhitungan"),
          value: showProses,
          onChanged: (value) {
            setState(() {
              showProses = value;
            });
          },
        ),

        const SizedBox(height: 20),

        /// HASIL
        if (hasil.isNotEmpty)
          Text(
            hasil,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

        const SizedBox(height: 10),

        /// PROSES
        if (showProses && proses.isNotEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                proses,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),

        const SizedBox(height: 20),

        /// RESET BUTTON
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