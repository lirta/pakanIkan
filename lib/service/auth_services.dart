import 'dart:convert';

import 'package:apps/model/user_model.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;
import 'package:apps/provider/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  // String baseUrl = 'http://10.0.2.2/ikan/';

  Future<UserModel> getUser({String id}) async {
    var url = '$baseUrl' + 'getUser.php';
    var response = await http.post(
      Uri.parse(url),
      body: {'id': id},
    );
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body)['user'];
      UserModel user = UserModel.fromJson(data);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("is_login", true);
      prefs.setString("id", user.id);
      print(user.id);

      return user;
    }
  }

  Future<UserModel> addAdmin(
      {String nama,
      String hp,
      String alamat,
      String email,
      String password}) async {
    var url = '$baseUrl' + 'addAdmin.php';
    var response = await http.post(
      Uri.parse(url),
      body: {
        'nama': nama,
        'hp': hp,
        'alamat': alamat,
        'email': email,
        'password': password
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      // var data = jsonDecode(response.body)['user'];
      // UserModel admin = UserModel.fromJson(data);

      // // print(user.id);

      // return admin;
    }
  }

  Future<UserModel> posregister(
      {String nama,
      String hp,
      String alamat,
      String email,
      String password}) async {
    var url = '$baseUrl' + 'register.php';
    var response = await http.post(
      Uri.parse(url),
      body: {
        'nama': nama,
        'hp': hp,
        'alamat': alamat,
        'email': email,
        'password': password
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body)['user'];
      UserModel user = UserModel.fromJson(data);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("is_login", true);
      prefs.setString("id", user.id);
      prefs.setString("rules", user.rules);
      print(user.id);

      return user;
    }
  }

  Future<UserModel> login({String email, String password}) async {
    var url = '$baseUrl' + 'login.php';
    var response = await http.post(
      Uri.parse(url),
      body: {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body)['user'];
      UserModel user = UserModel.fromJson(data);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("is_login", true);
      prefs.setString("id", user.id);
      prefs.setString("rules", user.rules);
      print(user.id);
      print(user.rules);

      return user;
    }
  }
}
