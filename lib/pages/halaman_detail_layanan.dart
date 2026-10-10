
import 'package:flutter/material.dart';

class HalamanDetailLayanan extends StatelessWidget {
  const HalamanDetailLayanan({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil data yang dikirim dari halaman Layanan
    final arguments =
        ModalRoute.of(context)?.settings.arguments;

    final data = arguments is Map
        ? arguments
        : <String, String>{};

    final String nama =
        data['nama']?.toString() ?? 'Layanan Tidak Ditemukan';

    final String dinas =
        data['dinas']?.toString() ?? '-';

    final String jam =
        data['jam']?.toString() ?? '-';

    final String keterangan =
        data['keterangan']?.toString() ?? '-';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Layanan'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian judul layanan
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFE1F3E8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.miscellaneous_services,
                    size: 64,
                    color: Color(0xFF176B4D),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    nama,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF176B4D),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Informasi dinas
            const Text(
              'Dinas Penanggung Jawab',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            ListTile(
              leading: const Icon(
                Icons.account_balance,
                color: Color(0xFF176B4D),
              ),
              title: Text(dinas),
            ),

            const Divider(),

            // Informasi jam operasional
            const Text(
              'Jam Operasional',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            ListTile(
              leading: const Icon(
                Icons.access_time,
                color: Color(0xFF176B4D),
              ),
              title: Text(jam),
            ),

            const Divider(),

            // Keterangan layanan
            const Text(
              'Keterangan Layanan',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              keterangan,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 32),

            // Tombol pengajuan
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(
                    context,
                    'Permohonan $nama telah diajukan',
                  );
                },
                icon: const Icon(Icons.send),
                label: const Text('Ajukan Permohonan'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF176B4D),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
