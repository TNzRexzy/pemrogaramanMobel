import 'package:flutter/material.dart';
import 'home_page.dart';

// Memakai StatefulWidget karena halaman ini punya inputan yang bisa berubah (dinamis)
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk menangkap dan membaca teks yang diketik di dalam TextField
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Fungsi yang dipanggil saat tombol Login ditekan
  void _login() {
    // Mengecek apakah inputan sesuai dengan NIM dan nama Prodi
    // toLowerCase() dipakai agar password tidak sensitif terhadap huruf kapital (sistem informasi = Sistem Informasi)
    if (_usernameController.text == '124240148' && 
        _passwordController.text.toLowerCase() == 'sistem informasi') {
      
      // Jika benar, pindah ke HomePage dan hapus LoginPage dari riwayat (pushReplacement)
      // Jadi kalau user tekan tombol back di HP, dia tidak akan kembali ke login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Jika salah, tampilkan pesan peringatan di bawah layar (Snackbar)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login gagal!'), // Isi pesan
          backgroundColor: Colors.red, // Warna background pesan merah
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          // Card memberikan efek kotak timbul (bayangan) pada form login
          child: Card(
            elevation: 4, // Tingkat ketebalan bayangan
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              // Column menyusun elemen dari atas ke bawah
              child: Column(
                mainAxisSize: MainAxisSize.min, // Agar form tidak mengambil tinggi full satu layar
                children: [
                  Text('Login', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20), // Memberi jarak kosong vertikal
                  
                  // Kolom input untuk Username
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(), // Membuat garis kotak mengelilingi input
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  // Kolom input untuk Password
                  TextField(
                    controller: _passwordController,
                    obscureText: true, // Menyembunyikan teks ketikan menjadi titik-titik (sensor sandi)
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  
                  // Tombol Login
                  SizedBox(
                    width: double.infinity, // Agar tombol memanjang full mengikuti lebar layar/kotak
                    height: 45,
                    child: ElevatedButton(
                      onPressed: _login, // Memanggil fungsi _login saat ditekan
                      child: Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
