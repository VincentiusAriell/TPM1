import 'package:flutter/material.dart';

class TanggalLahirTab extends StatefulWidget {
  const TanggalLahirTab({super.key});

  @override
  State<TanggalLahirTab> createState() => _TanggalLahirTabState();
}

class _TanggalLahirTabState extends State<TanggalLahirTab> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  DateTime? hasilDateTime;
  String warning = "";

  void pilihJam() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void prosesHitung() {
    DateTime now = DateTime.now();

    DateTime combined = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    if (combined.isAfter(now)) {
      setState(() {
        warning = "Tanggal & waktu tidak boleh melebihi sekarang!";
        hasilDateTime = null;
      });
      return;
    }

    setState(() {
      warning = "";
      hasilDateTime = combined;
    });
  }

  String hitungUsia(DateTime lahir) {
    DateTime now = DateTime.now();

    Duration selisih = now.difference(lahir);

    int hari = selisih.inDays;
    int tahun = hari ~/ 365;
    int bulan = (hari % 365) ~/ 30;
    int sisaHari = (hari % 365) % 30;

    int jam = selisih.inHours % 24;
    int menit = selisih.inMinutes % 60;

    return "$tahun th $bulan bln $sisaHari hr $jam jam $menit menit";
  }

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

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          "Pilih Tanggal Lahir",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 20),

        /// 📅 Kalender
        CalendarDatePicker(
          initialDate: selectedDate,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          onDateChanged: (date) {
            setState(() {
              selectedDate = date;
            });
          },
        ),

        const SizedBox(height: 20),

        /// ⏰ Pilih Jam
        ListTile(
          leading: const Icon(Icons.access_time),
          title: const Text("Masukkan Jam & Menit"),
          trailing: Text(
            "${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}",
          ),
          onTap: pilihJam,
        ),

        const SizedBox(height: 20),

        /// 🔘 Tombol
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: prosesHitung,
            child: const Text("Hitung"),
          ),
        ),

        const SizedBox(height: 10),

        /// ⚠️ Warning
        if (warning.isNotEmpty)
          Text(
            warning,
            style: const TextStyle(color: Colors.red),
          ),

        const SizedBox(height: 20),

        /// 📊 Hasil
        if (hasilDateTime != null)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Tanggal Lahir"),
                    trailing: Text(
                      "${hasilDateTime!.day} ${getNamaBulan(hasilDateTime!.month)} ${hasilDateTime!.year}",
                    ),
                  ),
                  ListTile(
                    title: const Text("Jam Lahir"),
                    trailing: Text(
                      "${hasilDateTime!.hour.toString().padLeft(2, '0')}:${hasilDateTime!.minute.toString().padLeft(2, '0')}",
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("Usia"),
                    trailing: Text(
                      hitungUsia(hasilDateTime!),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}