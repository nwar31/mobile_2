import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Aplikasi Barang',
    home: DesainRegister(),
    debugShowCheckedModeBanner: false,
  ));
}

class DesainRegister extends StatefulWidget {
  const DesainRegister({super.key});

  @override
  State<DesainRegister> createState() => _DesainLoginState();
}

class _DesainLoginState extends State<DesainRegister> {
  TextEditingController cUsername = TextEditingController();
  TextEditingController cEmail = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController cConfirm = TextEditingController();
  bool visibilityPass = true;
  bool visibilityConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 131, 16, 121),
              Color.fromARGB(255, 255, 0, 212),
            ],
          ),
        ),
        child: Card(
          elevation: 10,
          shadowColor: const Color.fromARGB(255, 114, 255, 59),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('gambar/mhs1.png'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: cUsername,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0)),
                      labelText: 'Username',
                      hintText: 'Input Username Anda',
                      prefix: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: cEmail,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0)),
                      labelText: 'Email',
                      hintText: 'Input Email Anda',
                      prefix: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: cPassword,
                    obscureText: visibilityPass,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0)),
                      labelText: 'Password',
                      hintText: 'Input Password Anda',
                      prefix: const Icon(Icons.lock),
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            visibilityPass = !visibilityPass;
                          });
                        },
                        icon: visibilityPass
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: cConfirm,
                    obscureText: visibilityConfirm,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0)),
                      labelText: 'Konfirmasi Password',
                      hintText: 'Ulangi Password Anda',
                      prefix: const Icon(Icons.lock_outline),
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            visibilityConfirm = !visibilityConfirm;
                          });
                        },
                        icon: visibilityConfirm
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      ProsesRegister(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 182, 7, 218),
                    ),
                    child: const Text(
                      'DAFTAR',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 182, 7, 218),
                    ),
                    child: const Text(
                      'KEMBALI',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void ProsesRegister(BuildContext context) {
    if (cUsername.text.isEmpty ||
        cEmail.text.isEmpty ||
        cPassword.text.isEmpty ||
        cConfirm.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua field harus diisi'),
          backgroundColor: Colors.blue,
        ),
      );
      return;
    }

    if (cPassword.text != cConfirm.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password dan Konfirmasi tidak cocok'),
          backgroundColor: Colors.blue,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Registrasi Berhasil!'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pop(context); // Kembali ke halaman login
  }
}
