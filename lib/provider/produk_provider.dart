import 'package:apps/model/produk_model.dart';
import 'package:apps/service/produk_services.dart';
import 'package:flutter/cupertino.dart';

class ProdukProvider with ChangeNotifier {
  ProdukModel _produk;
  ProdukModel get produk => _produk;
  set produk(ProdukModel produk) {
    _produk = produk;
    notifyListeners();
  }

  Future<bool> getProduk({String id}) async {
    try {
      ProdukModel produk = await ProdukServices().getProduk(id :id);
      _produk = produk;
      return true;
    } catch (e) {
      return false;
    }
  }
}
