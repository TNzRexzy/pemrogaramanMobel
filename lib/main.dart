// Mengimpor library material bawaan Flutter untuk desain UI
import 'package:flutter/material.dart';
// Mengimpor halaman login yang akan ditampilkan pertama kali
import 'screens/login_page.dart';

// Fungsi utama (entry point) yang akan dipanggil saat aplikasi dibuka
void main() {
  runApp(MyApp()); // Menjalankan widget MyApp
}

// Widget utama aplikasi (Stateless karena tidak ada data yang berubah di level aplikasi)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Kuis', // Judul aplikasi (biasanya muncul di recent apps)
      theme: ThemeData(primarySwatch: Colors.blue), // Mengatur warna tema dasar
      home: LoginPage(), // Mengatur halaman pertama yang terbuka adalah LoginPage
      debugShowCheckedModeBanner: false, // Menghilangkan pita "DEBUG" merah di pojok kanan atas layar
    );
  }
}
