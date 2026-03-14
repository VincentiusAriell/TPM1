import 'package:flutter/material.dart';
import 'login_page.dart';


class Homepage extends StatelessWidget {
  final String uname;

  const Homepage({super.key, required this.uname});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Hello There, $uname'),
          backgroundColor: Colors.blue.shade700,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
        drawer: const NavigationDrawer(),
      );
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildMenuItems(BuildContext context) => Column(
        children: [

          ListTile(
            leading: const Icon(Icons.arrow_back),
            title: const Text('Back'),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Penjumlahan & Pengurangan'),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('Cek Ganjil / Genap & Prima'),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.format_list_numbered),
            title: const Text('Jumlah Total Digit'),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('Stopwatch'),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.change_history),
            title: const Text('Luas & Volume Piramid'),
            onTap: () {},
          ),
        ],
      );
}