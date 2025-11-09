Tugas 6 Pertemuan 8 - Flutter (h1d023063_tugas6)

Ini adalah proyek Flutter sederhana untuk memenuhi Tugas 6, yang mengimplementasikan form input data (Nama, NIM, Tahun Lahir) dan menampilkannya di layar kedua.

Screenshot Aplikasi

| Halaman Form Input | Halaman Tampil Data |
| :---: | :---: |
| <img src="Screenshot 2025-11-09 234055.png" width="250"> | <img src="Screenshot 2025-11-09 234106.png" width="250"> |

---

Penjelasan Proses Passing Data

Dalam proyek Flutter ini, proses pengiriman data (*passing data*) dari form input ke tampilan hasil dilakukan menggunakan **Constructor Passing** melalui `Navigator`.

1. Pengiriman Data (dari `form_data.dart`)

Data dikirim saat tombol "Simpan" ditekan. Kami menggunakan `Navigator.push` untuk berpindah ke layar baru (`TampilDataScreen`).

Saat memanggil `TampilDataScreen`, kita **menyisipkan data** yang diambil dari `TextEditingController`s (yaitu `nama`, `nim`, dan `tahunLahir`) ke dalam *constructor*-nya.

```dart
// ... di dalam _FormDataScreenState

void _kirimData() {
  // ... mengambil data dari controller ...
  String nama = _namaController.text;
  String nim = _nimController.text;
  String tahunLahir = _tahunLahirController.text;

  Navigator.push(
    context,
    MaterialPageRoute(
      // Data dilempar ke constructor TampilDataScreen
      builder: (context) => TampilDataScreen(
        nama: nama,
        nim: nim,
        tahunLahir: tahunLahir,
      ),
    ),
  );
}

2. Penerimaan Data (di tampil_data.dart)
TampilDataScreen adalah StatelessWidget yang disiapkan untuk menerima data.

Kami mendeklarasikan variabel final (seperti nama, nim, tahunLahir) di dalam class.

Kami membuat constructor yang mewajibkan (required) variabel-variabel tersebut untuk diisi saat class ini dipanggil.

Dart

// ... di dalam TampilDataScreen

// Deklarasi variabel untuk menampung data
final String nama;
final String nim;
final String tahunLahir;

// Constructor yang menerima data
const TampilDataScreen({
  Key? key,
  required this.nama,
  required this.nim,
  required this.tahunLahir,
}) : super(key: key);

// ... di dalam build method
@override
Widget build(BuildContext context) {
  // Variabel 'nama', 'nim', dan 'tahunLahir'
  // bisa langsung digunakan di sini.
  int tahunLahirInt = int.tryParse(tahunLahir) ?? 0;
  int tahunSekarang = DateTime.now().year;
  int umur = tahunSekarang - tahunLahirInt;

  String perkenalan = 'Nama saya $nama, NIM $nim, dan umur saya adalah $umur tahun.';

  return Scaffold(...);
}
