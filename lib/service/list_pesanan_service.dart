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
}
