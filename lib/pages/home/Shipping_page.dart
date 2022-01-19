// ignore: file_names
// ignore: file_names
import 'package:another_flushbar/flushbar.dart';
import 'package:apps/model/produk_model.dart';
import 'package:apps/model/user_model.dart';
import 'package:apps/provider/auth_provider.dart';
import 'package:apps/provider/pesanan_provider.dart';
import 'package:apps/provider/produk_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:flutter/material.dart';

import '../../theme.dart';

class ShippingPage extends StatefulWidget {
  const ShippingPage({Key key}) : super(key: key);

  @override
  State<ShippingPage> createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage> {
  TextEditingController namaController = TextEditingController(text: '');

  TextEditingController nohpController = TextEditingController(text: '');

  TextEditingController alamatController = TextEditingController(text: '');

  TextEditingController quantityController = TextEditingController(text: '');
  // intCon

  bool isLoading = false;
  int bayar = 0;
  int item;

  Future<void> initState() {
    cekLogin();
    // getProduk();
  }

  cekLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLogin = prefs.getBool("is_login");
    // print(id);
    // print(isLogin);

    // ignore: unrelated_type_equality_checks
    if (isLogin != true) {
      print("belumlogin");
      Navigator.pushNamed(context, '/sign-in');
    } else {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ProdukProvider produkProvider = Provider.of<ProdukProvider>(context);
    PesananProvider pesananProvider = Provider.of<PesananProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProdukModel produk = produkProvider.produk;
    // String harga = produk.harga;

    handlePesanan() async {
      setState(() {
        isLoading = true;
      });
      // ignore: unused_local_variable
      var $harga = quantityController.text * produk.harga;
      if (!(namaController.text.trim() != "" &&
          nohpController.text.trim() != "" &&
          alamatController.text.trim() != "" &&
          quantityController.text.trim() != "")) {
        Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Color(0xffff5c83),
          message: 'fild tidak boleh kosong',
        ).show(context);
      } else {
        print(user.id);
        print(namaController.text);
        print(alamatController.text);
        print(nohpController.text);
        print(quantityController.text);
        print(produk.harga);
        //prosess register
        if (await pesananProvider.postPesanan(
            id_konsumen: user.id,
            nama_penerima: namaController.text,
            alamat_penerima: alamatController.text,
            hp_penerima: nohpController.text,
            kg: quantityController.text,
            total: produk.harga.toString())) {
          Navigator.pushNamed(context, '/invoic');
        } else {
          Flushbar(
            duration: Duration(seconds: 4),
            flushbarPosition: FlushbarPosition.TOP,
            backgroundColor: Color(0xffff5c83),
            message: 'Gagal Order Pesanan, Cobalagi Nanti',
          ).show(context);
        }
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Form Order',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Silahkan isi semua form dengan benar',
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget namapenerima() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama Penerima",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.addressCard,
                      size: 15,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        controller: namaController,
                        decoration: InputDecoration.collapsed(
                          hintText: "Nama Penerima",
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget nopenerima() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'No Telepon Penerima',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.phoneSquareAlt,
                      size: 15,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        keyboardType: TextInputType.number,
                        controller: nohpController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'No Telepon',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget alamat() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat Peneriama',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.mapMarkedAlt,
                      size: 15,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        // maxLines: 5,
                        style: primaryTextStyle,
                        controller: alamatController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Alamat Penerima',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget quantity() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quantity (Kg)',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.calculator,
                      size: 15,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        // sets
                        // obscureText: true,
                        // controller: _controller,
                        keyboardType: TextInputType.number,
                        controller: quantityController,

                        decoration: InputDecoration.collapsed(
                          hintText: 'Jumlah Quantity',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget totalBayar() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Harga / Kg : Rp.',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  produk.harga.toString(),
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                )
              ],
            ),
            // SizedBox(height: 20),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       'Total Bayar : Rp.',
            //       style: primaryTextStyle.copyWith(
            //         fontSize: 16,
            //         fontWeight: medium,
            //       ),
            //     ),
            //     Text(
            //       bayar.toString(),
            //       style: primaryTextStyle.copyWith(
            //         fontSize: 16,
            //         fontWeight: medium,
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      );
    }

    Widget button() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30, bottom: 20),
        child: TextButton(
          onPressed:
              // (){Navigator.pushNamed(context, '/detail-pesanan');},
              handlePesanan,
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Order Sekarang',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 30,
          top: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account? ',
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Sign In',
                style: purpleTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                namapenerima(),
                nopenerima(),
                alamat(),
                quantity(),
                totalBayar(),
                // isLoading ? LoadingButton() :
                button(),
                // Spacer(),
                // footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
