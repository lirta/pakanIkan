import 'package:apps/model/list_pesanan_model.dart';
import 'package:apps/service/list_pesanan_service.dart';
import 'package:flutter/cupertino.dart';

class ListPesananProvider with ChangeNotifier {
  List<ListPesananModel> _listpesanan = [];

  List<ListPesananModel> get listpesanan => _listpesanan;

  set listpesanan(List<ListPesananModel> listpesanan) {
    _listpesanan = listpesanan;
    notifyListeners();
  }

  Future<void> getPesanan({String id_konsumen}) async {
    try {
      List<ListPesananModel> listpesanan = await ListPesananServices().getPesanan(id_konsumen: id_konsumen);
      _listpesanan = listpesanan;
      return true;
    } catch (e) {
      return false;
    }
  }

  
}
