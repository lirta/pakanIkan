import 'package:apps/model/user_model.dart';
import 'package:apps/service/auth_services.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
   UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> getUser({ String id}) async {
    try {
      UserModel user = await AuthServices().getUser(id:id);
      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }
  Future<bool> register(
      { String nama,
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


  Future<bool> login({
    String email,
    String password,
  }) async {
    try {
      UserModel user = await AuthServices().login(
        email: email,
        password: password
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
