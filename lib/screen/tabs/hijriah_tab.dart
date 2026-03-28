import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

class HijriahTab extends StatefulWidget {
  const HijriahTab({super.key});

  @override
  State<HijriahTab> createState() => _HijriahTabState();
}

class _HijriahTabState extends State<HijriahTab> {
  DateTime selectedDate = DateTime.now();
  String hasil = "";

  String getNamaBulan(int bulan) {
    const namaBulan = [
      "",
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember"
    ];
    return namaBulan[bulan];
  }

  void konversiHijriah(DateTime date) {
    HijriCalendar hijri = HijriCalendar.fromDate(date);

    setState(() {
      hasil =
          "${hijri.hDay} ${hijri.longMonthName} ${hijri.hYear} H";
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          "Pilih Tanggal Masehi",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 20),

        CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime(1800), lastDate: DateTime(2900), onDateChanged: (date){
          setState(() {
            selectedDate = date;
          });

          konversiHijriah(date);
        },),

        const SizedBox(height: 20),
      Card(
          child: ListTile(
            title: const Text("Tanggal Masehi"),
            trailing: Text(
              "${selectedDate.day} ${getNamaBulan(selectedDate.month)} ${selectedDate.year}",
            ),
          ),
        ),

        const SizedBox(height: 10),

        /// hasil hijriah
        Card(
          child: ListTile(
            title: const Text("Tanggal Hijriah"),
            trailing: Text(
              hasil,
            ),
          ),
        ),
      ],
    );
  }
}