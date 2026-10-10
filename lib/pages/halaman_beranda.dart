
import 'package:flutter/material.dart';
import '../widgets/kepala_kota.dart';
import '../widgets/kartu_pilar.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Identitas Kota Nusantara
          const KepalaKota(),

          const SizedBox(height: 24),

          // Judul bagian Smart City
          const Text(
            'Enam Pilar Smart City',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF176B4D),
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Mewujudkan kota yang cerdas, modern, '
            'berkelanjutan, dan nyaman bagi masyarakat.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),

          const SizedBox(height: 16),

          // Pilar 1
          const KartuPilar(
            namaPilar: 'Smart Governance',
            ikon: Icons.account_balance,
            deskripsi:
                'Meningkatkan pelayanan pemerintahan '
                'yang transparan dan berbasis teknologi.',
          ),

          // Pilar 2
          const KartuPilar(
            namaPilar: 'Smart Economy',
            ikon: Icons.trending_up,
            deskripsi:
                'Mendorong pertumbuhan ekonomi digital '
                'dan pengembangan usaha masyarakat.',
          ),

          // Pilar 3
          const KartuPilar(
            namaPilar: 'Smart Living',
            ikon: Icons.home,
            deskripsi:
                'Meningkatkan kualitas hidup melalui '
                'fasilitas dan pelayanan publik.',
          ),

          // Pilar 4
          const KartuPilar(
            namaPilar: 'Smart Mobility',
            ikon: Icons.directions_bus,
            deskripsi:
                'Mengembangkan sistem transportasi '
                'yang aman, efisien, dan terintegrasi.',
          ),

          // Pilar 5
          const KartuPilar(
            namaPilar: 'Smart Environment',
            ikon: Icons.eco,
            deskripsi:
                'Menjaga kelestarian lingkungan '
                'melalui pengelolaan sumber daya.',
          ),

          // Pilar 6
          const KartuPilar(
            namaPilar: 'Smart People',
            ikon: Icons.people,
            deskripsi:
                'Meningkatkan kualitas sumber daya '
                'manusia yang kreatif dan inovatif.',
          ),

          const SizedBox(height: 20),

          // Informasi tambahan
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE1F3E8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nusantara Cerdas Mobile',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF176B4D),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Akses informasi dan layanan publik '
                  'Kota Nusantara melalui menu Layanan '
                  'dan Warga.',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
