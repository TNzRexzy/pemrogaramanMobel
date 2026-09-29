// Mendefinisikan class Animal sebagai cetak biru data
class Animal {
  // Deklarasi variabel menggunakan 'final' karena data tidak akan berubah setelah dibuat
  final String name; // Nama hewan
  final String type; // Jenis hewan (Mamalia, Reptil, dll)
  final double weight; // Berat hewan (pakai double karena ada angka desimal)
  final List<String> habitat; // Tempat hidup (pakai List karena bisa lebih dari satu)
  final int height; // Tinggi hewan dalam cm
  final List<String> activities; // Daftar aktivitas hewan
  final String image; // URL gambar hewan dari internet

  // Konstruktor (Constructor) untuk membuat objek Animal baru
  // Kata kunci 'required' memastikan semua data ini wajib diisi saat objek dibuat
  Animal({
    required this.name,
    required this.type,
    required this.weight,
    required this.habitat,
    required this.height,
    required this.activities,
    required this.image,
  });
}
