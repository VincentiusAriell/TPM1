import 'package:flutter/material.dart';
import 'login_page.dart';


class Homepage extends StatelessWidget {
  final String uname;

  const Homepage({super.key, required this.uname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 136, 255),
        title: Text('TPM Tugas 1'),
        leading: Icon(Icons.menu, color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage('https://source.unsplash.com/random/800x600'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Hello',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),
            Text(
              'hello there, $uname!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}