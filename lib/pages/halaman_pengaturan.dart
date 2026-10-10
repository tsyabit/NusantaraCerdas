
import 'package:flutter/material.dart';

class HalamanPengaturan extends StatefulWidget {
  const HalamanPengaturan({super.key});

  @override
  State<HalamanPengaturan> createState() =>
      _HalamanPengaturanState();
}

class _HalamanPengaturanState
    extends State<HalamanPengaturan> {
  bool _notifikasiAktif = true;
  bool _modeGelap = false;
  String _bahasa = 'Indonesia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Kota'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Preferensi Aplikasi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF176B4D),
            ),
          ),

          const SizedBox(height: 16),

          Card(
            child: Column(
              children: [
                SwitchListTile(
                  secondary: const Icon(
                    Icons.notifications_active_outlined,
                  ),
                  title: const Text('Notifikasi'),
                  subtitle: const Text(
                    'Aktifkan notifikasi layanan kota',
                  ),
                  value: _notifikasiAktif,
                  onChanged: (nilai) {
                    setState(() {
                      _notifikasiAktif = nilai;
                    });
                  },
                ),

                const Divider(height: 1),

                SwitchListTile(
                  secondary: const Icon(
                    Icons.dark_mode_outlined,
                  ),
                  title: const Text('Mode Gelap'),
                  subtitle: const Text(
                    'Preferensi tampilan gelap',
                  ),
                  value: _modeGelap,
                  onChanged: (nilai) {
                    setState(() {
                      _modeGelap = nilai;
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Bahasa Aplikasi',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF176B4D),
            ),
          ),

          const SizedBox(height: 12),

          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: DropdownButtonFormField<String>(
                initialValue: _bahasa,
                decoration: const InputDecoration(
                  labelText: 'Pilih Bahasa',
                  prefixIcon: Icon(Icons.language),
                  border: InputBorder.none,
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Indonesia',
                    child: Text('Bahasa Indonesia'),
                  ),
                  DropdownMenuItem(
                    value: 'English',
                    child: Text('English'),
                  ),
                ],
                onChanged: (nilai) {
                  if (nilai != null) {
                    setState(() {
                      _bahasa = nilai;
                    });
                  }
                },
              ),
            ),
          ),

          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE1F3E8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Pengaturan ini merupakan simulasi '
              'untuk kebutuhan praktikum. '
              'Preferensi belum disimpan secara permanen.',
              style: TextStyle(
                color: Color(0xFF176B4D),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
