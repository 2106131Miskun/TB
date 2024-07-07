import 'package:belajar_array_crud/screens/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Ditambahkan untuk menggunakan BoxDecoration dan LinearGradient
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Aplikasi Data Mahasiswa'),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              const Color.fromARGB(255, 255, 255, 255)
            ], // Warna gradien
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: CupertinoButton.filled(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                    FontAwesomeIcons.userGraduate), // added Font Awesome icon
                const Text(' Buka Data Mahasiswa'),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const ListScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
