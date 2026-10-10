
import 'package:flutter/material.dart';

class HalamanTentang extends StatelessWidget {
  const HalamanTentang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Logo aplikasi
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: const Color(0xFFE1F3E8),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.location_city,
                size: 65,
                color: Color(0xFF176B4D),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Nusantara Cerdas Mobile',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF176B4D),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Versi 1.0.0',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 24),

            // Deskripsi aplikasi
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi Aplikasi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 12),

                    Text(
                      'Nusantara Cerdas Mobile adalah '
                      'aplikasi simulasi layanan publik '
                      'berbasis Smart City yang dirancang '
                      'untuk mempermudah masyarakat '
                      'mengakses informasi kota dan '
                      'berbagai layanan publik.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Fitur aplikasi
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fitur Utama',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 16),

                    ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Color(0xFF176B4D),
                      ),
                      title: Text('Beranda'),
                      subtitle: Text(
                        'Informasi enam pilar Smart City',
                      ),
                    ),

                    ListTile(
                      leading: Icon(
                        Icons.miscellaneous_services,
                        color: Color(0xFF176B4D),
                      ),
                      title: Text('Layanan Publik'),
                      subtitle: Text(
                        'Perizinan, kesehatan, dan transportasi',
                      ),
                    ),

                    ListTile(
                      leading: Icon(
                        Icons.people,
                        color: Color(0xFF176B4D),
                      ),
                      title: Text('Warga'),
                      subtitle: Text(
                        'Profil dan riwayat laporan warga',
                      ),
                    ),

                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Color(0xFF176B4D),
                      ),
                      title: Text('Pengaturan Kota'),
                      subtitle: Text(
                        'Pengaturan preferensi aplikasi',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Informasi pengembangan
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE1F3E8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.school,
                    size: 32,
                    color: Color(0xFF176B4D),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Praktikum Pemrograman Mobile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF176B4D),
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Dibuat menggunakan Flutter dan Dart '
                    'sebagai implementasi navigasi '
                    'pada aplikasi mobile.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              '© 2026 Nusantara Cerdas Mobile',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
