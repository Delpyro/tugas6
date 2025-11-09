import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:h1d023063_tugas6/ui/tampil_data.dart'; 

class FormDataScreen extends StatefulWidget {
  const FormDataScreen({Key? key}) : super(key: key);

  @override
  _FormDataScreenState createState() => _FormDataScreenState();
}

class _FormDataScreenState extends State<FormDataScreen> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunLahirController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _tahunLahirController.dispose();
    super.dispose();
  }

  void _kirimData() {
    String nama = _namaController.text;
    String nim = _nimController.text;
    String tahunLahir = _tahunLahirController.text;

    if (nama.isNotEmpty && nim.isNotEmpty && tahunLahir.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TampilDataScreen(
            nama: nama,
            nim: nim,
            tahunLahir: tahunLahir,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua field harus diisi!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nimController,
              decoration: const InputDecoration(
                labelText: 'NIM',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _tahunLahirController,
              decoration: const InputDecoration(
                labelText: 'Tahun Lahir',
              ),
              keyboardType: TextInputType.number, 
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _kirimData,
              child: const Text('Simpan'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}