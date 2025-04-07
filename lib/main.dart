import 'package:flutter/material.dart';
import 'HalamanLogin.dart';
import 'HalamanUser.dart';
import 'HalamanRegister.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Aplikasi Barang',
    home: AppBarang(),
    debugShowCheckedModeBanner: false,
  ));
}

class AppBarang extends StatefulWidget {
  const AppBarang({super.key});

  @override
  State<AppBarang> createState() => _AppBarangState();
}

class _AppBarangState extends State<AppBarang> {
  final String myUser = 'Admin';
  final String myPass = '12345';

  TextEditingController cUser = TextEditingController();
  TextEditingController cPass = TextEditingController();
  bool visibilityPass = true;

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
              Color.fromARGB(255, 255, 0, 212)
            ])),
        child: Card(
          elevation: 10,
          shadowColor: const Color.fromARGB(255, 114, 255, 59),
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                child: const CircleAvatar(
                  backgroundImage: AssetImage('gambar/mhs1.png'),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      controller: cUser,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2.0)),
                          labelText: 'Username',
                          hintText: 'Input Username Anda',
                          prefix: Icon(Icons.person)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: cPass,
                      obscureText: !visibilityPass,
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
                                  : const Icon(Icons.visibility_off))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        CekLogin(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 182, 7, 218),
                      ),
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DesainRegister(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 182, 7, 218),
                      ),
                      child: const Text(
                        'REGISTER',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void CekLogin(BuildContext context) {
    //final String myUser = 'Admin';
    //final String myPass = '12345';

    if (cUser.text == myUser && cPass.text == myPass) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DesainLogin(),
          ));
    } else if (cUser.text.isEmpty || cPass.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User dan Password tidak boleh kosong'),
          backgroundColor: Colors.blue,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Login Gagal, Silahkan Cek Kembali Username atau Password'),
          backgroundColor: Colors.blue,
        ),
      );
    }
  }
}
