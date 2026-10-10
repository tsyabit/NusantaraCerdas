
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';
import '../models/pengajuan_model.dart';

class HalamanWarga extends StatelessWidget {
  const HalamanWarga({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Identitas warga
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFE1F3E8),
                    child: Icon(
                      Icons.person,
                      size: 35,
                      color: Color(0xFF176B4D),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Warga Nusantara',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text('Status: Warga Aktif'),
                        Text('Domisili: Kota Nusantara'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Judul layanan favorit
          const Text(
            'Layanan Favorit',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF176B4D),
            ),
          ),

          const SizedBox(height: 12),

          // Daftar favorit dari Provider
          Consumer<FavoritModel>(
            builder: (context, favoritModel, child) {
              final daftar =
                  favoritModel.daftarFavorit.toList();

              if (daftar.isEmpty) {
                return const Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        'Belum ada layanan favorit.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }

              return Column(
                children: daftar.map((nama) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      title: Text(nama),
                      trailing: IconButton(
                        tooltip: 'Hapus favorit',
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          context
                              .read<FavoritModel>()
                              .batalTandai(nama);
                        },
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),

          const SizedBox(height: 24),

          // Judul daftar pengajuan
          const Text(
            'Daftar Pengajuan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF176B4D),
            ),
          ),

          const SizedBox(height: 12),

          Consumer<PengajuanModel>(
            builder: (context, pengajuanModel, child) {
              final daftar =
                  pengajuanModel.daftarPengajuan;

              if (daftar.isEmpty) {
                return const Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        'Belum ada pengajuan layanan.',
                      ),
                    ),
                  ),
                );
              }

              return Column(
                children: [
                  ...daftar.map((nama) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(
                          Icons.assignment_turned_in,
                          color: Color(0xFF176B4D),
                        ),
                        title: Text(nama),
                        subtitle: const Text(
                          'Tercatat dalam daftar pengajuan',
                        ),
                        trailing: IconButton(
                          tooltip: 'Hapus pengajuan',
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            context
                                .read<PengajuanModel>()
                                .hapusPengajuan(nama);
                          },
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 8),
                  Text(
                    'Total Pengajuan: '
                    '${pengajuanModel.totalPengajuan}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 24),

          // Riwayat laporan warga
          const Text(
            'Riwayat Laporan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF176B4D),
            ),
          ),

          const SizedBox(height: 12),

          const Card(
            child: ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              title: Text('Laporan Jalan Rusak'),
              subtitle: Text('Status: Selesai'),
            ),
          ),

          const Card(
            child: ListTile(
              leading: Icon(
                Icons.schedule,
                color: Colors.orange,
              ),
              title: Text('Laporan Lampu Jalan'),
              subtitle: Text('Status: Diproses'),
            ),
          ),
        ],
      ),
    );
  }
}
