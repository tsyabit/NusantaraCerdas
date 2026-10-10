
import 'package:flutter/material.dart';

import '../pages/halaman_utama.dart';
import '../pages/halaman_detail_layanan.dart';
import '../pages/halaman_pengaturan.dart';
import '../pages/halaman_tentang.dart';

class AppRoutes {
  static const String utama = '/';
  static const String detail = '/detail';
  static const String pengaturan = '/pengaturan';
  static const String tentang = '/tentang';

  static Map<String, WidgetBuilder> get routes {
    return {
      utama: (context) => const HalamanUtama(),
      detail: (context) => const HalamanDetailLayanan(),
      pengaturan: (context) => const HalamanPengaturan(),
      tentang: (context) => const HalamanTentang(),
    };
  }

  static Route<dynamic> onUnknownRoute(
    RouteSettings settings,
  ) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('Halaman Tidak Ditemukan'),
        ),
        body: const Center(
          child: Text(
            'Halaman yang dicari tidak tersedia.',
          ),
        ),
      ),
    );
  }
}
