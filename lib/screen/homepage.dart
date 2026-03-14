import 'package:flutter/material.dart';
import 'package:tpm1/screen/calculator_page.dart';
import 'package:tpm1/screen/data_kelompok_page.dart';
import 'package:tpm1/screen/stopwatch_page.dart';
import 'login_page.dart';
import 'cek_ganjil_genap_prima.dart';
import 'luas_volume.dart';
import 'jumlah_total_angka.dart';

class Homepage extends StatefulWidget {
  final String uname;

  const Homepage({super.key, required this.uname});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const DaftarKelompokPage(),
    const CalculatorPage(),
    const GanjilGenapPrimaPage(),
    const JumlahTotalDigitPage(),
    const StopwatchPage(),
    const LuasVolumePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello There, ${widget.uname}'),
        backgroundColor: Colors.blue.shade700,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),

      drawer: MyDrawer(
        onItemTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),

      body: pages[selectedIndex],
    );
  }
}

class MyDrawer extends StatelessWidget {
  final Function(int) onItemTap;

  const MyDrawer({super.key, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),

            const Text(
              "Menu",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Daftar Kelompok'),
              onTap: () {
                onItemTap(0);
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Penjumlahan & Pengurangan'),
              onTap: () {
                onItemTap(1);
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('Cek Ganjil / Genap & Prima'),
              onTap: () {
                onItemTap(2);
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.format_list_numbered),
              title: const Text('Jumlah Total Digit'),
              onTap: () {
                onItemTap(3);
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.timer),
              title: const Text('Stopwatch'),
              onTap: () {
                onItemTap(4);
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.change_history),
              title: const Text('Luas & Volume Piramid'),
              onTap: () {
                onItemTap(5);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
