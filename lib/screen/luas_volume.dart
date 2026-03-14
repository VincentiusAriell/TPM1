import 'package:flutter/material.dart';

class LuasVolumePage extends StatefulWidget {
  const LuasVolumePage({super.key});

  @override
  State<LuasVolumePage> createState() => _LuasVolumePage();
}

class _LuasVolumePage extends State<LuasVolumePage> {
  final TextEditingController jumlahpanjangalas = TextEditingController();
  final TextEditingController jumlahlebaralas = TextEditingController();
  final TextEditingController jumlahtinggisisitegak = TextEditingController();

  String hitung = "";
  String judulHasil = "Hasil";

  void hitungLuas() {
    double lebaralas = double.parse(jumlahlebaralas.text);
    double panjangalas = double.parse(jumlahpanjangalas.text);
    double tinggisisitegak = double.parse(jumlahtinggisisitegak.text);

    double kelilingalas = (panjangalas * 2) + (lebaralas * 2);
    double luasalas = panjangalas * lebaralas;
    double hasil = luasalas + (0.5 * kelilingalas * tinggisisitegak);

    setState(() {
      hitung = hasil.toString();
      judulHasil = "Hasil Luas Piramida";
    });
  }

  void hitungVolume() {
    double lebaralas = double.parse(jumlahlebaralas.text);
    double panjangalas = double.parse(jumlahpanjangalas.text);
    double tinggisisitegak = double.parse(jumlahtinggisisitegak.text);

    double luasalas = panjangalas * lebaralas;
    double hasil = 1 / 3 * luasalas * tinggisisitegak;

    setState(() {
      hitung = hasil.toString();
      judulHasil = "Hasil Volume Piramida";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: jumlahlebaralas,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: "Masukkan Lebar Alas",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 10),

          TextField(
            controller: jumlahpanjangalas,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: "Masukkan Panjang Alas",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 10),

          TextField(
            controller: jumlahtinggisisitegak,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: "Masukkan Tinggi Sisi Tegak",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: hitungLuas,
                child: const Text("Hitung Luas"),
              ),
              ElevatedButton(
                onPressed: hitungVolume,
                child: const Text("Hitung Volume"),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            "$judulHasil: $hitung",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}