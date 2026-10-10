
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pengajuan_model.dart';
import 'halaman_beranda.dart';
import 'halaman_layanan.dart';
import 'halaman_warga.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int _indeksTerpilih = 0;

  final List<Widget> _halaman = const [
    HalamanBeranda(),
    HalamanLayanan(),
    HalamanWarga(),
  ];

  void _pilihHalaman(int indeks) {
    setState(() {
      _indeksTerpilih = indeks;
    });
  }

  void _bukaMenu(String route) {
    Navigator.pop(context);
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layarLebar = constraints.maxWidth >= 600;

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Nusantara Cerdas Mobile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFF176B4D),
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    mainAxisAlignment:
                        MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.location_city,
                        color: Colors.white,
                        size: 42,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Nusantara Cerdas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Pengaturan Kota'),
                  onTap: () => _bukaMenu('/pengaturan'),
                ),

                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('Tentang Aplikasi'),
                  onTap: () => _bukaMenu('/tentang'),
                ),

                const Divider(),

                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Keluar'),
                  onTap: () {
                    Navigator.pop(context);
                    _pilihHalaman(0);
                  },
                ),
              ],
            ),
          ),

          body: layarLebar
              ? Row(
                  children: [
                    NavigationRail(
                      selectedIndex: _indeksTerpilih,
                      onDestinationSelected:
                          _pilihHalaman,
                      labelType:
                          NavigationRailLabelType.all,
                      destinations: const [
                        NavigationRailDestination(
                          icon: Icon(Icons.home_outlined),
                          selectedIcon: Icon(Icons.home),
                          label: Text('Beranda'),
                        ),

                        NavigationRailDestination(
                          icon: Icon(
                            Icons.miscellaneous_services_outlined,
                          ),
                          selectedIcon: Icon(
                            Icons.miscellaneous_services,
                          ),
                          label: Text('Layanan'),
                        ),

                        NavigationRailDestination(
                          icon: IkonWarga(
                            terpilih: false,
                          ),
                          selectedIcon: IkonWarga(
                            terpilih: true,
                          ),
                          label: Text('Warga'),
                        ),
                      ],
                    ),

                    const VerticalDivider(
                      thickness: 1,
                      width: 1,
                    ),

                    Expanded(
                      child: _halaman[_indeksTerpilih],
                    ),
                  ],
                )
              : _halaman[_indeksTerpilih],

          bottomNavigationBar: layarLebar
              ? null
              : NavigationBar(
                  selectedIndex: _indeksTerpilih,
                  onDestinationSelected:
                      _pilihHalaman,
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: 'Beranda',
                    ),

                    NavigationDestination(
                      icon: Icon(
                        Icons.miscellaneous_services_outlined,
                      ),
                      selectedIcon: Icon(
                        Icons.miscellaneous_services,
                      ),
                      label: 'Layanan',
                    ),

                    NavigationDestination(
                      icon: IkonWarga(
                        terpilih: false,
                      ),
                      selectedIcon: IkonWarga(
                        terpilih: true,
                      ),
                      label: 'Warga',
                    ),
                  ],
                ),
        );
      },
    );
  }
}

// Widget khusus untuk badge jumlah pengajuan
class IkonWarga extends StatelessWidget {
  final bool terpilih;

  const IkonWarga({
    super.key,
    required this.terpilih,
  });

  @override
  Widget build(BuildContext context) {
    final total = context.select<PengajuanModel, int>(
      (model) => model.totalPengajuan,
    );

    return Badge(
      isLabelVisible: total > 0,
      label: Text('$total'),
      child: Icon(
        terpilih
            ? Icons.person
            : Icons.person_outline,
      ),
    );
  }
}
