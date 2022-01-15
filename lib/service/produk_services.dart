import 'dart:convert';

import 'package:apps/model/produk_model.dart';
import 'package:http/http.dart' as http;

class ProdukServices {
  String baseUrl = 'http://10.0.2.2/ikan/';


  Future<ProdukModel> getProduk({String id}) async {
    var url = '$baseUrl' + 'getProduk.php';
    var response = await http.post(Uri.parse(url), body: {'id':id});
      print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body)['produk'];
      ProdukModel produk = ProdukModel.fromJson(data);
      return produk;
    }
  }
}
