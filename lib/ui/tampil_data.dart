import 'package:flutter/material.dart';

class TampilDataScreen extends StatelessWidget {
  final String nama;
  final String nim;
  final String tahunLahir;

  const TampilDataScreen({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tahunLahir,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int tahunLahirInt = int.tryParse(tahunLahir) ?? 0;
    int tahunSekarang = DateTime.now().year;
    int umur = tahunSekarang - tahunLahirInt;

    String perkenalan =
        'Nama saya $nama, NIM $nim, dan umur saya adalah $umur tahun.';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perkenalan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              perkenalan,
              style: const TextStyle(fontSize: 18, height: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}