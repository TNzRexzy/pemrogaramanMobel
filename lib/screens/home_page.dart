import 'package:flutter/material.dart';
import '../data/dummy_animals.dart';
import 'detail_page.dart';
import 'login_page.dart';

// Memakai StatelessWidget karena halaman ini hanya menampilkan data, tidak ada interaksi form
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar adalah navigasi bagian paling atas layar
      appBar: AppBar(
        title: Text('Animals List'), // Judul halaman
        backgroundColor: Colors.black, // Warna latar atas hitam
        foregroundColor: Colors.white, // Warna teks judul putih
        actions: [
          // Tombol logout yang ada di pojok kanan atas
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Jika diklik, lempar balik ke halaman LoginPage dan hapus riwayat
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      // GridView.builder membuat layout kotak-kotak (grid) yang efisien di memori
      body: GridView.builder(
        padding: EdgeInsets.all(12),
        // gridDelegate mengatur bentuk gridnya
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Dibagi menjadi 2 kolom ke samping
          childAspectRatio: 0.65, // Mengatur proporsi tinggi vs lebar kotak kartu (0.65 agar lebih tinggi/persegi panjang)
          crossAxisSpacing: 12, // Jarak antar kotak ke samping
          mainAxisSpacing: 12, // Jarak antar kotak ke bawah
        ),
        itemCount: dummyAnimals.length, // Total data yang akan ditampilkan (6 hewan)
        // itemBuilder adalah tempat kita merakit tampilan setiap satu kartunya
        itemBuilder: (context, index) {
          final animal = dummyAnimals[index]; // Mengambil satu data hewan sesuai urutan
          
          // InkWell memberikan efek gelombang (ripple) saat kartu diklik
          return InkWell(
            onTap: () {
              // Navigasi pindah ke halaman DetailPage
              Navigator.push(
                context,
                // Mengirimkan variabel data hewan yang sedang diklik ke halaman DetailPage
                MaterialPageRoute(
                  builder: (context) => DetailPage(animal: animal),
                ),
              );
            },
            // Card untuk memberikan desain kotak putih dengan bayangan
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Membulatkan sudut kartu
              clipBehavior: Clip.antiAlias, // Memotong gambar agar sudutnya ikut membulat mengikuti kartu
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Ratakan teks ke sebelah kiri
                children: [
                  // Expanded memaksa gambar mengisi sisa ruang yang kosong di dalam kotak
                  Expanded(
                    child: Image.network(
                      animal.image, // Mengambil gambar dari internet
                      width: double.infinity, // Lebar gambar memenuhi kartu
                      fit: BoxFit.cover, // Gambar di-crop rapi agar memenuhi ruang tanpa merusak proporsi (gepeng)
                    ),
                  ),
                  // Teks informasi di bawah gambar
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(animal.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)), // Nama hewan
                        Text(animal.type, style: TextStyle(color: Colors.grey, fontSize: 12)), // Tipe hewan
                        SizedBox(height: 6),
                        
                        // Wrap menyusun elemen otomatis turun ke bawah jika layar tidak muat (berguna untuk tag/chip)
                        Wrap(
                          spacing: 4, // Jarak horizontal antar kotak tag
                          runSpacing: 4, // Jarak vertikal antar kotak tag jika turun ke baris baru
                          // Mengubah list habitat (teks) menjadi desain kotak tag (Container)
                          children: animal.habitat.map((h) => Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300), // Garis pinggir abu-abu
                              borderRadius: BorderRadius.circular(4), // Sudut tag agak bulat
                            ),
                            child: Text(h, style: TextStyle(fontSize: 10)),
                          )).toList(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
