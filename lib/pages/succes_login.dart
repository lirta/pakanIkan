import 'dart:async';

import 'package:apps/model/user_model.dart';
import 'package:apps/provider/auth_provider.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuccessLoginPage extends StatefulWidget {
  const SuccessLoginPage({Key key}) : super(key: key);

  @override
  _SuccessLoginPageState createState() => _SuccessLoginPageState();
}

class _SuccessLoginPageState extends State<SuccessLoginPage> {
  String rules;
  @override
  void initState() {
    cekLogin();
    super.initState();
  }

  cekLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    rules = prefs.getString("rules");

    // ignore: unrelated_type_equality_checks
    if (rules == "1") {
      Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, '/home'));
      print("ini rules konsumen");
      print(rules);
    } else {
      Timer(Duration(seconds: 2),
          () => Navigator.pushNamed(context, '/profile-admin'));
      print("ini rules admin");
      print(rules);
    }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      throw UnimplementedError();
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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(defaultMargin),
              width: 130,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/logo.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Selamat Datang \n Di \n Sumber Rezeki",
              style: priceTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
