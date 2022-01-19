import 'package:apps/pages/list_pesanan.dart';
import 'package:apps/provider/list_pemesanan_provider.dart';
import 'package:apps/provider/produk_provider.dart';
import 'package:apps/theme.dart';
import 'package:apps/widget/list_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String id;
  Future<void> initState() {
    // await Provider.of<ProdukProvider>(context, listen: false).getProduk();
    super.initState();
    getpesanan();
    _refreshPesanan(context);
  }

  getpesanan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
    print(id);
    await Provider.of<ListPesananProvider>(context, listen: false)
        .getPesanan(id_konsumen: id);
  }

  Future<void> _refreshPesanan(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
    print(id);
    await Provider.of<ListPesananProvider>(context, listen: false)
        .getPesanan(id_konsumen: id);
  }

  @override
  Widget build(BuildContext context) {
    // ProdukProvider produkProvider = Provider.of<ProdukProvider>(context);
    ListPesananProvider listPesananProvider =
        Provider.of<ListPesananProvider>(context);
    @override
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text("Order List"),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyList() {
      return Expanded(
          child: Container(
        width: double.infinity,
        color: backgroundColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.shippingFast,
              size: 80,
              color: primaryColor,
            ),
            SizedBox(
              height: 23,
            ),
            Text(
              "Ma'af !!!",
              style:
                  primaryTextStyle.copyWith(fontSize: 20, fontWeight: medium),
            ),
            // SizedBox(height: 5,),
            Text(
              "Belum ada Orderan.",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            Text(
              "Order sekarang",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 23,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 44,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                    backgroundColor: priceColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Text(
                  'Oerder Sekarang',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
              ),
            )
          ],
        ),
      ));
    }

    print(
        "ini panjang data" + listPesananProvider.listpesanan.length.toString());

    Widget content() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          child: ListView(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              // ignore: prefer_const_literals_to_create_immutables, prefer_is_empty
              children: listPesananProvider.listpesanan
                  .map(
                    (listpesanan) => ListCard(listpesanan),
                  )
                  .toList()
              // ignore: avoid_print

              //  [
              //   ListCard(),
              //   ListCard(),
              //   ListCard(),
              //   ListCard(),
              // ],
              ),
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

    Widget newArrivals() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(
          children: listPesananProvider.listpesanan
              .map(
                (listpesanan) => ListPesanan(listpesanan),
              )
              .toList(),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => _refreshPesanan(context),
      child: Column(
        children: [
          header(),
          listPesananProvider.listpesanan == null ? emptyList() : content()
          // emptyList(),
          // content(),
        ],
      ),
    );
  }
}
