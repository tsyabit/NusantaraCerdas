
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';

class HalamanLayanan extends StatelessWidget {
  const HalamanLayanan({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const Material(
            color: Colors.white,
            child: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Perizinan'),
                Tab(text: 'Kesehatan'),
                Tab(text: 'Transportasi'),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              children: [
                _daftarLayanan(
                  [
                    {
                      'nama': 'Izin Usaha',
                      'dinas': 'Dinas Perizinan',
                      'jam': '08.00 - 16.00',
                      'keterangan':
                          'Pelayanan pengurusan izin usaha.',
                    },
                    {
                      'nama': 'Izin Bangunan',
                      'dinas': 'Dinas PUPR',
                      'jam': '08.00 - 15.00',
                      'keterangan':
                          'Pelayanan pengurusan izin bangunan.',
                    },
                  ],
                ),

                _daftarLayanan(
                  [
                    {
                      'nama': 'Pendaftaran Puskesmas',
                      'dinas': 'Dinas Kesehatan',
                      'jam': '07.00 - 14.00',
                      'keterangan':
                          'Pendaftaran layanan kesehatan.',
                    },
                    {
                      'nama': 'Informasi Vaksinasi',
                      'dinas': 'Dinas Kesehatan',
                      'jam': '08.00 - 15.00',
                      'keterangan':
                          'Informasi jadwal dan layanan vaksinasi.',
                    },
                  ],
                ),

                _daftarLayanan(
                  [
                    {
                      'nama': 'Informasi Angkutan Umum',
                      'dinas': 'Dinas Perhubungan',
                      'jam': '08.00 - 16.00',
                      'keterangan':
                          'Informasi rute angkutan umum.',
                    },
                    {
                      'nama': 'Pengaduan Transportasi',
                      'dinas': 'Dinas Perhubungan',
                      'jam': '08.00 - 16.00',
                      'keterangan':
                          'Layanan pengaduan transportasi.',
                    },
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _daftarLayanan(
    List<Map<String, String>> daftar,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: daftar.length,
      itemBuilder: (context, index) {
        final layanan = daftar[index];
        final nama = layanan['nama']!;

        return Builder(
          builder: (context) {
            final favoritModel =
                context.watch<FavoritModel>();

            final sudahFavorit =
                favoritModel.isFavorit(nama);

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFE1F3E8),
                  child: Icon(
                    Icons.miscellaneous_services,
                    color: Color(0xFF176B4D),
                  ),
                ),

                title: Text(
                  nama,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Text(layanan['dinas']!),

                trailing: IconButton(
                  tooltip: sudahFavorit
                      ? 'Hapus dari favorit'
                      : 'Tambahkan ke favorit',
                  icon: Icon(
                    sudahFavorit
                        ? Icons.star
                        : Icons.star_border,
                    color: sudahFavorit
                        ? Colors.amber
                        : Colors.grey,
                  ),
                  onPressed: () {
                    final model =
                        context.read<FavoritModel>();

                    if (sudahFavorit) {
                      model.batalTandai(nama);
                    } else {
                      model.tandai(nama);
                    }
                  },
                ),

                onTap: () async {
                  final hasil =
                      await Navigator.pushNamed(
                    context,
                    '/detail',
                    arguments: layanan,
                  );

                  if (!context.mounted) return;

                  if (hasil != null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      SnackBar(
                        content: Text(hasil.toString()),
                      ),
                    );
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
