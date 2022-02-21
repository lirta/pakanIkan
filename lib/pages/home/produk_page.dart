import 'package:apps/model/produk_model.dart';
import 'package:apps/provider/produk_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key key}) : super(key: key);

  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  Future<void> initState() {
    // await Provider.of<ProdukProvider>(context, listen: false).getProduk();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ProdukProvider produkProvider = Provider.of<ProdukProvider>(context);
    ProdukProvider produkProvider = Provider.of<ProdukProvider>(context);
    ProdukModel produk = produkProvider.produk;
    @override
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text("Produk"),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          child: ListView(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              // ignore: prefer_const_literals_to_create_immutables, prefer_is_empty
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/sipping');
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(
                        top: 10, left: 12, bottom: 14, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: backgroundColor6),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/produk.jpeg',
                            width: 100,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Nama :",
                                    // 'lirta',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    produk.nama,
                                    // 'lirta',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: semiBold,
                                    ),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Jenis   :",
                                    // 'lirta',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Pakan Ikan Basah",
                                    // 'lirta',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Harga  :",
                                    // 'lirta',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: semiBold,
                                    ),
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Rp" + produk.harga.toString(),
                                    // 'lirta',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
        ),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'List Member',
          style: priceTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    return Container(
      child: Column(
        children: [
          header(), content()
          // emptyList(),
          // content(),
        ],
      ),
    );
  }
}
