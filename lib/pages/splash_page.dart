// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:apps/provider/auth_provider.dart';
import 'package:apps/provider/list_pemesanan_provider.dart';
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
  String rules;
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
    rules = prefs.getString("rules");
    // print(id);
    // print(isLogin);

    // ignore: unrelated_type_equality_checks
    if (isLogin == true) {
      AuthProvider authProvider =
          Provider.of<AuthProvider>(context, listen: false);
      if (await authProvider.getUser(id: id)) {
        if (rules == "1") {
        Timer(Duration(seconds: 2),
            () => Navigator.pushNamed(context, '/home'));
        print(rules);
          
        }else{
          Provider.of<ListPesananProvider>(context, listen: false)
        .getPesananAdmin();
          Timer(Duration(seconds: 2),
            () => Navigator.pushNamed(context, '/home-admin'));
        print(rules);
        }
        print("sudah login");
      } else {
        print("error get data");
        Timer(Duration(seconds: 2),
            () => Navigator.pushNamed(context, '/index'));
        print(isLogin);
        print(id);
      }
    } else {
      print("belumlogin");
      Timer(
          Duration(seconds: 2), () => Navigator.pushNamed(context, '/index'));
    }
    } else {
      print('gagal get data produk');
      Timer(Duration(seconds: 2),
            () => Navigator.pushNamed(context, '/index'));
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
          margin: EdgeInsets.all(defaultMargin),
          // width: 130,
          // height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/logo.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
