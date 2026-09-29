import 'package:flutter/material.dart';
import '../models/animal.dart';

class DetailPage extends StatelessWidget {
  // Variabel penampung data hewan yang dikirim dari HomePage
  final Animal animal;

  // Konstruktor untuk mewajibkan HomePage mengirim data 'animal' saat pindah ke halaman ini
  DetailPage({required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animal.name), // Judul AppBar akan dinamis berubah mengikuti nama hewan yang diklik
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      // SingleChildScrollView agar halamannya bisa discroll ke bawah jika isinya kepanjangan
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Semua konten rata kiri
          children: [
            // Menampilkan gambar besar di paling atas
            Image.network(animal.image, width: double.infinity, height: 300, fit: BoxFit.cover),
            
            // Bungkus konten teks dengan Padding agar tidak menempel di pinggir layar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Animal Details:', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  // Menampilkan variabel angka langsung menggunakan tanda dolar (${variabel})
                  Text('Height: ${animal.height} cm', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 4),
                  Text('Weight: ${animal.weight} kg', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 4),
                  Text('Type: ${animal.type}', style: TextStyle(fontSize: 16)),
                  
                  SizedBox(height: 24), // Jarak sebelum masuk ke bagian aktivitas
                  Text('Animal Activities:', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  
                  // Bagian ini membongkar (extract) List activities menjadi barisan Widget UI
                  // map() merubah setiap 1 string aktivitas menjadi 1 widget Row
                  // Simbol titik tiga (...) (Spread Operator) digunakan untuk memasukkan list Widget ini ke dalam Column induknya
                  ...animal.activities.map((activity) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 20), // Ikon centang hijau
                        SizedBox(width: 8), // Jarak ikon dengan teks
                        Text(activity, style: TextStyle(fontSize: 16)), // Teks aktivitasnya
                      ],
                    ),
                  )).toList(), // Wajib diakhiri toList() untuk mengubah fungsi map menjadi format list UI
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
