import 'package:apps/model/user_model.dart';
import 'package:apps/service/auth_services.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user;
  //  UserModel _admin;

  UserModel get user => _user;
  // UserModel get admin => _admin;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }
  // set admin(UserModel admin) {
  //   _admin = admin;
  //   notifyListeners();
  // }

  Future<bool> getUser({String id}) async {
    try {
      UserModel user = await AuthServices().getUser(id: id);
      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register(
      {String nama,
      String hp,
      String alamat,
      String email,
      String password}) async {
    try {
      UserModel user = await AuthServices().posregister(
          nama: nama, hp: hp, alamat: alamat, email: email, password: password);
      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> addadmin(
      {String nama,
      String hp,
      String alamat,
      String email,
      String password}) async {
    try {
      await AuthServices().addAdmin(
          nama: nama, hp: hp, alamat: alamat, email: email, password: password);
      // _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> login({
    String email,
    String password,
  }) async {
    try {
      UserModel user =
          await AuthServices().login(email: email, password: password);

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
