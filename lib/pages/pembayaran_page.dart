import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:apps/model/pesanan_model.dart';
import 'package:apps/provider/pesanan_provider.dart';
import 'package:apps/service/server.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({Key key}) : super(key: key);

  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  // String id_pesanan;
  // @override
  // void initState() {
  //   pesanan();
  // }

  // pesanan() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (prefs.getString("id_pesanan") == null) {
  //     setState(() {
  //       id_pesanan = prefs.getString("id_pesanan");
  //     });
  //   } else {
  //     print("gagal");
  //     Flushbar(
  //       duration: Duration(seconds: 4),
  //       flushbarPosition: FlushbarPosition.TOP,
  //       backgroundColor: Color(0xffff5c83),
  //       message: 'Orderan anda gagal, silahkan melakukan order ulang',
  //     ).show(context);
  //   }
  // }

  TextEditingController jumlahController = TextEditingController(text: '');
  File filegambar;
  final picker = ImagePicker();
  // PesananProvider pesananProvider = Provider.of<PesananProvider>(context);
  //   PesananModel pesanan = pesananProvider.pesanan;
  bool isLoading = false;
  Future pilihGalery() async {
    // ignore: deprecated_member_use
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      filegambar = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    PesananProvider pesananProvider = Provider.of<PesananProvider>(context);
    PesananModel pesanan = pesananProvider.pesanan;
    updateImage() async {
      setState(() {
        isLoading = true;
      });
      if (!(filegambar != null && jumlahController.text.trim() != "")) {
        //cek file gambar dan name
        Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Color(0xffff5c83),
          message: 'Pilih file gambar dan isi jumlah pembayaran',
        ).show(context);
      } else {
        // jika ke duanya tidak kosong
        var url = '$baseUrl' + 'pembayaran.php';
        var uri = Uri.parse(url);
        // ignore: unnecessary_new
        var request = new http.MultipartRequest("POST", uri);
        var multipartFile =
            await http.MultipartFile.fromPath('filegambar', filegambar.path);
        request.files.add(multipartFile);
        request.fields['id'] = pesanan.id;
        // request.fields['jumlah'] = jumlahController.text;
        var response = await request.send();

        if (response.statusCode == 200) {
          // print(response.stream);
          print('berhasil');
          Navigator.pushNamed(context, '/home');
        } else {
          print('gagal');
          Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Color(0xffff5c83),
          message: 'Pembayaran Gagal',
        ).show(context);
        }
      }
    }

    Widget Update() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: GestureDetector(
          onTap: () async {
            pilihGalery();
          },
          child: Row(
            children: [
              Icon(
                FontAwesomeIcons.fileImage,
                color: secondaryColor,
              ),
              SizedBox(
                width: 15,
              ),
              Text('Pilih file pembayaran',
                  style: priceTextStyle.copyWith(
                      fontSize: 18, fontWeight: semiBold)),
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Form Pembayaran',
              style: primaryTextStyle.copyWith(
                fontSize: 26,
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

    Widget jmlPembayaran() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Jumlah Pembayaran",
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
                      FontAwesomeIcons.moneyBillWave,
                      size: 15,
                      color: secondaryColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        controller: jumlahController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration.collapsed(
                          hintText: "Jumlah Pembayaran",
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

    Widget button() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: updateImage,

          // handlePesanan,
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: isLoading== false ? Text(
            'Bayar',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ) : CircularProgressIndicator( 
            strokeWidth: 2, valueColor: 
            AlwaysStoppedAnimation(backgroundColor6),),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                  height: MediaQuery.of(context).size.width * 0.6,
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                  ),
                  child: filegambar == null
                      ? Container()
                      : Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            image: FileImage(filegambar),
                          )),
                        )),
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
                jmlPembayaran(),
                content(),
                Update(),
                button(),
                // resizeToAvoidBottomInset: false,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
