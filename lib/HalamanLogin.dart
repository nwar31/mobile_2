import 'package:flutter/material.dart';
import './main.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Aplikasi Barang',
    home: DesainLogin(),
    debugShowCheckedModeBanner: false,
  ));
}

class DesainLogin extends StatefulWidget {
  const DesainLogin({super.key});

  @override
  State<DesainLogin> createState() => _DesainLoginState();
}

class _DesainLoginState extends State<DesainLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Halaman Login',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Selamat Datang di Halaman Login',
              style: TextStyle(color: Colors.purple),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AppBarang()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple, // Warna background button
              foregroundColor:
                  const Color.fromARGB(255, 13, 0, 192), // Warna teks button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              'Kembali ke Login',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          )
        ],
      ),
    );
  }
}
