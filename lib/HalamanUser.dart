import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Aplikasi Barang',
    home: DesainUser(),
    debugShowCheckedModeBanner: false,
  ));
}

class DesainUser extends StatefulWidget {
  const DesainUser({super.key});

  @override
  State<DesainUser> createState() => _DesainUserState();
}

class _DesainUserState extends State<DesainUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Halaman User',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: const Center(
          child: Text(
        'Selamat Datang di Halaman User',
        style: TextStyle(color: Colors.purple),
      )),
    );
  }
}
