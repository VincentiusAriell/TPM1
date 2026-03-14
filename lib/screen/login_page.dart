import 'package:flutter/material.dart';
import 'homepage.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {

  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final List<String> correctPasswords = ["131", "140", "113"];
  bool isLogin = false;

void _login() {
  String uname = _unameController.text.trim();
  String password = _passwordController.text.trim();

  if (uname.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login Gagal: field tidak boleh kosong'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  if (correctPasswords.contains(password)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Login Berhasil! Welcome Back, $uname'),
        backgroundColor: Colors.green,
      ),
    );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage(uname: uname)),
      );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login Gagal: password salah'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 136, 255),
        title: Text('TUGAS 1 TPM'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller : _unameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username'
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller : _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password'
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: _login, child: Text("Login")),

          ],
        ),
      ),
    );
  }
}



