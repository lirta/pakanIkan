import 'package:apps/model/pesanan_model.dart';
import 'package:apps/service/pesanan_services.dart';
import 'package:flutter/cupertino.dart';

class PesananProvider with ChangeNotifier {
  PesananModel _pesanan;

  PesananModel get pesanan => _pesanan;

  set pesanan(PesananModel pesanan) {
    _pesanan = pesanan;
    notifyListeners();
  }

  Future<bool> postPesanan(
      {String id_konsumen,
      String nama_penerima,
      String alamat_penerima,
      String hp_penerima,
      String kg,
      String total}) async {
    try {
      PesananModel pesanan = await PesananServices().postPesanan(
          id_konsumen: id_konsumen,
          nama_penerima: nama_penerima,
          alamat_penerima: alamat_penerima,
          hp_penerima: hp_penerima,
          kg: kg,
          total: total);
      _pesanan = pesanan;
      return true;
    } catch (e) {
      return false;
    }
  }
  Future<bool> getPesanan(
      {String id}) async {
    try {
      PesananModel pesanan = await PesananServices().getPesanan(id:id);
      _pesanan = pesanan;
      return true;
    } catch (e) {
      return false;
    }
  }
}
