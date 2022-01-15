// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:apps/provider/auth_provider.dart';
import 'package:apps/provider/produk_provider.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String id;
  String id_produk = "1";
  @override
  void initState() {
    // Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, '/sign-in'));
    cekLogin();
    // getInit();
  }

  cekLogin() async {
    ProdukProvider produkProvider =
        Provider.of<ProdukProvider>(context, listen: false);
    if (await produkProvider.getProduk(id: id_produk)) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLogin = prefs.getBool("is_login");
    id = prefs.getString("id");
    // print(id);
    // print(isLogin);

    // ignore: unrelated_type_equality_checks
    if (isLogin == true) {
      AuthProvider authProvider =
          Provider.of<AuthProvider>(context, listen: false);
      if (await authProvider.getUser(id: id)) {
        Navigator.pushNamed(context, '/home');
        print(id);
        print("sudah login");
      } else {
        print("error get data");
        Timer(Duration(seconds: 2),
            () => Navigator.pushNamed(context, '/sign-in'));
        print(isLogin);
        print(id);
      }
    } else {
      print("belumlogin");
      Timer(
          Duration(seconds: 2), () => Navigator.pushNamed(context, '/sign-in'));
    }
    } else {
      print('gagal get data produk');
    }
  }

  // getInit() async {
  //   await Provider.of<ProdukProvider>(context, listen: false).getProduk();
  // }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/image_splash.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
