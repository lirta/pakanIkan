import 'package:apps/model/list_pesanan_model.dart';
import 'package:apps/pages/list_pesanan_dikemas.dart';
import 'package:apps/service/list_pesanan_service.dart';
import 'package:flutter/cupertino.dart';

class ListPesananProvider with ChangeNotifier {
  List<ListPesananModel> _listpesanan = [];
  List<ListPesananModel> _listpesananMasuk = [];
  List<ListPesananModel> _listpesananDikemas = [];
  List<ListPesananModel> _listpesananDikirim = [];
  List<ListPesananModel> _listpesananSampai = [];

  List<ListPesananModel> get listpesanan => _listpesanan;
  List<ListPesananModel> get listpesananMasuk => _listpesananMasuk;
  List<ListPesananModel> get listpesananDikemas => _listpesananDikemas;
  List<ListPesananModel> get listpesananDikirim => _listpesananDikirim;
  List<ListPesananModel> get listpesananSampai => _listpesananSampai;

  set listpesanan(List<ListPesananModel> listpesanan) {
    _listpesanan = listpesanan;
    notifyListeners();
  }

  set listpesananMasuk(List<ListPesananModel> listpesananMasuk) {
    _listpesananMasuk = listpesananMasuk;
    notifyListeners();
  }

  set listPesananDikemas(List<ListPesananModel> listpesananDikemas) {
    _listpesananDikemas = listpesananDikemas;
    notifyListeners();
  }

  set listpesananDikirim(List<ListPesananModel> listpesananDikirim) {
    _listpesananDikirim = listpesananDikirim;
    notifyListeners();
  }

  set listpesananSampai(List<ListPesananModel> listpesananSampai) {
    _listpesananSampai = listpesananSampai;
    notifyListeners();
  }

  Future<void> getPesanan({String id_konsumen}) async {
    try {
      List<ListPesananModel> listpesanan =
          await ListPesananServices().getPesanan(id_konsumen: id_konsumen);
      _listpesanan = listpesanan;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> getPesananAdmin() async {
    try {
      List<ListPesananModel> listpesananMasuk =
          await ListPesananServices().getPesananAdmin();
      _listpesananMasuk = listpesananMasuk;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> getPesananDikemas() async {
    try {
      List<ListPesananModel> listpesananDikemas =
          await ListPesananServices().getPesananDikemas();
      _listpesananDikemas = listpesananDikemas;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> getPesananDikirim() async {
    try {
      List<ListPesananModel> listpesananDikirim =
          await ListPesananServices().getPesananDikirim();
      _listpesananDikirim = listpesananDikirim;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> getPesananSampai() async {
    try {
      List<ListPesananModel> listpesananSampai =
          await ListPesananServices().getPesananSampai();
      _listpesananSampai = listpesananSampai;
      return true;
    } catch (e) {
      return false;
    }
  }
}
