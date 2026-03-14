import 'package:flutter/material.dart';
import '../models/data_anggota.dart';

class DaftarKelompokPage extends StatelessWidget {
  const DaftarKelompokPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataKelompok.length,
      itemBuilder: (context, index) {
        final anggota = dataKelompok[index];

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(anggota.foto),
            ),
            title: Text(
              anggota.nama,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(anggota.nim),
          ),
        );
      },
    );
  }
}