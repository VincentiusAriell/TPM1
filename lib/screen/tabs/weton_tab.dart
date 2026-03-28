import 'package:flutter/material.dart';

const _pasaran = ['Legi', 'Pahing', 'Pon', 'Wage', 'Kliwon'];

String _namaHariIndonesia(int weekday) {
  const names = [
    '',
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu',
  ];
  return names[weekday];
}

int _pasaranIndex(DateTime date) {
  final d = DateTime(date.year, date.month, date.day);
  final base = DateTime(1900, 1, 1);
  final days = d.difference(base).inDays;
  return ((days + 1) % 5 + 5) % 5;
}


class WetonTab extends StatefulWidget {
  const WetonTab({super.key});

  @override
  State<WetonTab> createState() => _WetonTabState();
}

class _WetonTabState extends State<WetonTab> {
  DateTime selectedDate = DateTime.now();

  String getNamaBulan(int bulan) {
    const namaBulan = [
      '',
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return namaBulan[bulan];
  }

  void _onDateChanged(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    final weekday = selectedDate.weekday;
    final hari = _namaHariIndonesia(weekday);
    final pIndex = _pasaranIndex(selectedDate);
    final pasaran = _pasaran[pIndex];
    final weton = '$hari $pasaran';

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Pilih Tanggal Masehi',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        CalendarDatePicker(
          initialDate: selectedDate,
          firstDate: DateTime(1800),
          lastDate: DateTime(2900),
          onDateChanged: _onDateChanged,
        ),
        const SizedBox(height: 20),
        Card(
          child: ListTile(
            title: const Text('Tanggal Masehi'),
            trailing: Text(
              '${selectedDate.day} ${getNamaBulan(selectedDate.month)} ${selectedDate.year}',
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: ListTile(
            title: const Text('Weton'),
            subtitle: const Text('Hari & pasaran'),
            trailing: Text(
              weton,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
