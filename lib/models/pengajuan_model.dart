
import 'package:flutter/material.dart';

class PengajuanModel extends ChangeNotifier {
  final List<String> _daftarPengajuan = [];

  List<String> get daftarPengajuan =>
      List.unmodifiable(_daftarPengajuan);

  int get totalPengajuan => _daftarPengajuan.length;

  void tambahPengajuan(String namaLayanan) {
    _daftarPengajuan.add(namaLayanan);
    notifyListeners();
  }

  void hapusPengajuan(String namaLayanan) {
    if (_daftarPengajuan.remove(namaLayanan)) {
      notifyListeners();
    }
  }

  void kosongkanPengajuan() {
    if (_daftarPengajuan.isNotEmpty) {
      _daftarPengajuan.clear();
      notifyListeners();
    }
  }
}
