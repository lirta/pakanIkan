import 'dart:convert';

import 'package:apps/model/pesanan_model.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PesananServices {
  // String baseUrl = 'http://10.0.2.2/ikan/';
  Future<PesananModel> postPesanan(
      {String id_konsumen,
      String nama_penerima,
      String alamat_penerima,
      String hp_penerima,
      String kg,
      String total}) async {
    var url = '$baseUrl' + 'pesanan.php';
    var response = await http.post(Uri.parse(url), body: {
      'id_konsumen': id_konsumen,
      'nama_penerima': nama_penerima,
      'alamat_penerima': alamat_penerima,
      'hp_penerima': hp_penerima,
      'kg': kg,
      'total': total
    });
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body)['pesanan'];
      PesananModel pesanan = PesananModel.fromJson(data);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setBool("is_login", true);
      prefs.setString("id_pesanan", pesanan.id);
      print(pesanan.id);
      return pesanan;
    }
  }

  Future<PesananModel> getPesanan({String id}) async {
    var url = '$baseUrl' + 'getPesanan.php';
    var response = await http.post(Uri.parse(url), body: {'id': id});
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body)['pesanan'];
      PesananModel pesanan = PesananModel.fromJson(data);
      return pesanan;
    }
  }

  Future<PesananModel> postStatus({String id, String status}) async {
    var url = '$baseUrl' + 'posStatus.php';
    var response =
        await http.post(Uri.parse(url), body: {'id': id, 'status': status});
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body)['pesanan'];
      PesananModel pesanan = PesananModel.fromJson(data);
      return pesanan;
    }
  }
}
