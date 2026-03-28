import 'package:flutter/material.dart';
import 'tabs/weton_tab.dart';
import 'tabs/tgl_lahir_tab.dart';
import 'tabs/hijriah_tab.dart';

class KalenderPage extends StatelessWidget {
  const KalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // jumlah tab
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Kalender"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.calendar_today),
                text: "Weton",
              ),
              Tab(
                icon: Icon(Icons.cake),
                text: "Tanggal Lahir",
              ),
              Tab(
                icon: Icon(Icons.brightness_3),
                text: "Hijriah",
              ),
            ],
          ),
        ),

        body: const TabBarView(
          children: [
            WetonTab(),
            TanggalLahirTab(),
            HijriahTab(),
          ],
        ),
      ),
    );
  }
}