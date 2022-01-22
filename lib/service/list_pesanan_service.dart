import 'dart:convert';

import 'package:apps/model/list_pesanan_model.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;

class ListPesananServices {
  // String baseUrl = 'http://10.0.2.2/ikan/';
  Future<List<ListPesananModel>> getPesanan({String id_konsumen}) async {
    var url = '$baseUrl' + 'index.php/pesanan/$id_konsumen';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      List data = jsonDecode(response.body)['pesanan'];
      List<ListPesananModel> listpesanan = [];

      for (var item in data) {
        listpesanan.add(ListPesananModel.fromJson(item));
      }
      // print(pesanan.id);
      return listpesanan;
    }
  }
  Future<List<ListPesananModel>> getPesananAdmin() async {
    var url = '$baseUrl' + 'index.php/pesananAdmin';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      List data = jsonDecode(response.body)['pesanan'];
      List<ListPesananModel> listpesananMasuk = [];

      for (var item in data) {
        listpesananMasuk.add(ListPesananModel.fromJson(item));
      }
      // print(pesanan.id);
      return listpesananMasuk;
    }
  }
  Future<List<ListPesananModel>> getPesananDikemas() async {
    var url = '$baseUrl' + 'index.php/pesananDikemas';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      List data = jsonDecode(response.body)['pesanan'];
      List<ListPesananModel> listpesananDikemas = [];

      for (var item in data) {
        listpesananDikemas.add(ListPesananModel.fromJson(item));
      }
      // print(pesanan.id);
      return listpesananDikemas;
    }
  }
  Future<List<ListPesananModel>> getPesananDikirim() async {
    var url = '$baseUrl' + 'index.php/pesananDikirim';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      List data = jsonDecode(response.body)['pesanan'];
      List<ListPesananModel> listpesananDikirim = [];

      for (var item in data) {
        listpesananDikirim.add(ListPesananModel.fromJson(item));
      }
      // print(pesanan.id);
      return listpesananDikirim;
    }
  }
}
