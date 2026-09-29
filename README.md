# Latihan Kuis - Pemrograman Aplikasi Mobile

Aplikasi ini adalah implementasi Flutter untuk menampilkan katalog data hewan beserta rincian informasinya. Proyek ini dibuat untuk memenuhi tugas Latihan Kuis Praktikum Pemrograman Aplikasi Mobile dengan menerapkan navigasi, antarmuka *grid*, manipulasi data statis, dan logika otentikasi sederhana.

## Arsitektur dan Penjelasan Logika Kode

Proyek ini mengadopsi struktur *folder* modular dengan memisahkan antarmuka (`screens`), cetak biru data (`models`), dan sumber data (`data`) agar kode lebih mudah dibaca dan dipelihara. Berikut adalah penjelasan mendalam untuk setiap komponen file:

### 1. `lib/main.dart` (Titik Kumpul Aplikasi)

* **Fungsi:** Bertindak sebagai *entry point* atau titik awal saat aplikasi dijalankan melalui fungsi `runApp()`.
* **Logika Komponen:** Menggunakan *widget* `MaterialApp` sebagai kerangka utama. Di file ini, tema aplikasi diatur secara global, *banner debug* bawaan Flutter di pojok kanan atas dihilangkan (`debugShowCheckedModeBanner: false`), dan properti `home` diatur untuk langsung me-render `LoginPage()` saat aplikasi pertama kali dibuka.

### 2. `lib/models/animal.dart` (Cetak Biru Objek / Model)

* **Fungsi:** Mendefinisikan struktur tipe data untuk objek "Hewan" menggunakan konsep Pemrograman Berorientasi Objek (OOP).
* **Logika Komponen:** Mendeklarasikan sebuah *class* bernama `Animal` dengan atribut yang spesifik: `name` (String), `type` (String), `weight` (double untuk angka desimal), `habitat` (List untuk menampung lebih dari satu habitat), `height` (int), `activities` (List), dan `image` (String berupa URL). Konstruktornya menggunakan modifier `required` untuk memastikan sistem *Null Safety* dari Dart terpenuhi, sehingga aplikasi tidak akan mengalami *crash* akibat data kosong saat objek dibuat.

### 3. `lib/data/dummy_animals.dart` (Sumber Data Statis)

* **Fungsi:** Berperan sebagai *mock database* atau penyedia data sementara, karena aplikasi belum terhubung ke API atau basis data eksternal.
* **Logika Komponen:** Mengimpor *class* `Animal` dari model, kemudian mendeklarasikan sebuah variabel `List<Animal>` bernama `dummyAnimals`. List ini diisi dengan 6 instansiasi objek hewan yang berbeda (Bengal Tiger, Komodo Dragon, African Grey Parrot, Green Sea Turtle, Siberian Husky, Giant Panda) lengkap dengan data spesifik dan tautan gambar dari internet (Pexels) sesuai dengan referensi tugas.

### 4. `lib/screens/login_page.dart` (Halaman Otentikasi)

* **Fungsi:** Menjadi gerbang keamanan aplikasi tempat pengguna memasukkan kredensial sebelum mengakses data utama.
* **Logika Komponen:**
* Menggunakan `StatefulWidget` karena halaman ini perlu merespons perubahan interaksi pengguna secara dinamis saat tombol ditekan.
* Input pengguna ditangkap dan disimpan menggunakan dua `TextEditingController` (satu untuk *username*, satu untuk *password*). Kolom sandi disembunyikan menggunakan properti `obscureText: true`.
* Fungsi `_login()` mengeksekusi logika kondisional (`if-else`). Jika *username* diisi dengan "124240148" (NIM) dan *password* diisi dengan "sistem informasi" (menggunakan `.toLowerCase()` agar input kebal terhadap variasi huruf kapital/kecil), maka login dianggap berhasil.
* **Navigasi Keberhasilan:** Menggunakan `Navigator.pushReplacement()`. Ini berarti halaman form login akan dihapus dari tumpukan memori rute (*stack*), sehingga pengguna tidak bisa kembali ke halaman login dengan menekan tombol "Back" di sistem HP.
* **Navigasi Kegagalan:** Jika salah, `ScaffoldMessenger.of(context).showSnackBar()` akan memicu munculnya notifikasi *pop-up* (Snackbar) berwarna merah di bagian bawah layar yang menginformasikan bahwa login gagal.



### 5. `lib/screens/home_page.dart` (Halaman Katalog Utama)

* **Fungsi:** Menampilkan seluruh koleksi hewan dalam bentuk tata letak visual berbasis *grid* (kisi).
* **Logika Komponen:**
* Menggunakan `StatelessWidget` karena halamannya murni menampilkan data statis tanpa perubahan *state* internal.
* Antarmuka dibangun menggunakan `GridView.builder` agar memori perangkat lebih efisien (sistem hanya me-render kotak/item yang sedang terlihat di layar). Tata letak diatur menggunakan `SliverGridDelegateWithFixedCrossAxisCount` untuk membagi layar menjadi 2 kolom (`crossAxisCount: 2`) dengan proporsi kotak disesuaikan melalui `childAspectRatio`.
* Setiap *item* hewan dibungkus menggunakan *widget* `Card` untuk memberikan efek visual kartu dengan bayangan (elevasi). Di dalam kartu, gambar dimuat secara asinkron dengan `Image.network`, sedangkan daftar habitat diekstrak dengan fungsi `.map()` dan disatukan menggunakan *widget* `Wrap` agar teks secara otomatis turun ke baris baru jika ruang horizontal tidak muat.
* Seluruh kartu dibungkus dengan `InkWell` agar memiliki efek gelombang (*ripple*) saat ditekan. Saat *event* `onTap` terpicu, fungsi `Navigator.push()` dijalankan menuju `DetailPage` sambil **membawa dan mengirimkan objek hewan spesifik** yang sedang diklik tersebut sebagai parameter.



### 6. `lib/screens/detail_page.dart` (Halaman Rincian)

* **Fungsi:** Menampilkan informasi komprehensif dari satu entitas hewan yang dipilih oleh pengguna di halaman katalog.
* **Logika Komponen:**
* Halaman ini wajib menerima variabel `animal` (bertipe `Animal`) melalui konstruktor kelasnya, yang merupakan data operan dari `HomePage`.
* Judul halaman pada `AppBar` diatur bersifat dinamis, otomatis menyesuaikan dengan data `animal.name`.
* Tata letak utama menggunakan `SingleChildScrollView` yang membungkus *widget* `Column`. Hal ini memastikan bahwa halaman tidak akan mengalami *overflow* (terpotong) dan bisa digulir ke bawah jika konten teks atau layarnya lebih kecil dari jumlah informasi yang ditampilkan.
* Bagian daftar "Animal Activities" dirender secara dinamis dengan mengekstrak data dari `animal.activities`. Proses ini menggunakan fungsi `.map()` yang mengubah setiap teks aktivitas dalam *List* menjadi sebuah *widget* baris (`Row`), di mana setiap barisnya disandingkan dengan ikon centang berwarna hijau (`Icons.check_circle`) di sebelah kirinya agar tampilan lebih terstruktur.



### Struktur Folder Tambahan
Agar kode lebih terstruktur, rapi, dan mudah dipelihara, proyek ini tidak menumpuk semua file di dalam lib/. Terdapat tiga folder tambahan yang dibuat secara manual di dalam lib/:

* lib/models/: Tempat menyimpan file blueprint atau cetak biru data (Model). Dalam proyek ini berisi animal.dart yang mendefinisikan tipe data apa saja yang dimiliki oleh sebuah objek hewan (nama, berat, habitat, dll).
* lib/data/: Tempat menyimpan sumber data aplikasi. Karena belum menggunakan database eksternal, folder ini memuat dummy_animals.dart yang berisi kumpulan data statis hewan sebagai penyuplai informasi ke antarmuka.
* lib/screens/: Tempat menampung seluruh file tampilan (UI) atau halaman (Pages) yang akan berinteraksi langsung dengan pengguna. Terdiri dari login_page.dart, home_page.dart, dan detail_page.dart.

(flutter create latkuis_124240148)
(cd latkuis_124240148)
