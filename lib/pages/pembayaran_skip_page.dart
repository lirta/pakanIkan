import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:apps/service/server.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class PembayaranSkipPage extends StatefulWidget {
  const PembayaranSkipPage({Key key}) : super(key: key);

  @override
  State<PembayaranSkipPage> createState() => _PembayaranSkipPageState();
}

class _PembayaranSkipPageState extends State<PembayaranSkipPage> {
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
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final id = args['id'];
    final nama = args['penerima'];
    final hp = args['hp'];
    final alamat = args['alamat'];
    final tgl_order = args['tgl_order'];
    final kg = args['kg'];
    final total = args['total'];
    final status = args['status'];
    updateImage() async {
      setState(() {
        isLoading = true;
      });
      if (!(filegambar != null)) {
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
        request.fields['id'] = id;
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

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Detail Pesanan'),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Detail Pesanan",
                  style: priceTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 20),
                ),
                Divider(
                  thickness: 1,
                  color: Color(0Xff2e3141),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Penerima",
                      style: secondaryTextStyle.copyWith(
                        fontSize: 15,
                        // fontWeight: medium
                      ),
                    ),
                    Text(
                      nama,
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                      maxLines: 3,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Alamat",
                      style: secondaryTextStyle.copyWith(
                        fontSize: 15,
                        // fontWeight: medium
                      ),
                    ),
                    Text(
                      alamat,
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                      maxLines: 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Telepon",
                      style: secondaryTextStyle.copyWith(
                        fontSize: 15,
                        // fontWeight: medium
                      ),
                    ),
                    Text(
                      hp,
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tanggal Order",
                      style: secondaryTextStyle.copyWith(
                        fontSize: 15,
                        // fontWeight: medium
                      ),
                    ),
                    Text(
                      tgl_order,
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity (Kg)",
                      style: secondaryTextStyle.copyWith(
                        fontSize: 15,
                        // fontWeight: medium
                      ),
                    ),
                    Text(
                      kg,
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Status",
                      style: secondaryTextStyle.copyWith(
                        fontSize: 15,
                        // fontWeight: medium
                      ),
                    ),
                    Text(
                      status,
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0Xff2e3141),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: priceTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold),
                    ),
                    Text(
                      total,
                      style: priceTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),

          //BUKTI pembayaran
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bukti Pembayaran",
                  style: priceTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 20),
                ),
                Divider(
                  thickness: 1,
                  color: Color(0Xff2e3141),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
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
                ),
                Divider(
                  thickness: 1,
                  color: Color(0Xff2e3141),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
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
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
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
              child: isLoading == false
                  ? Text(
                      'Bayar',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    )
                  : CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(backgroundColor6),
                    ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
    );
  }
}
