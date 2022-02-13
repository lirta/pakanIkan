import 'package:apps/service/server.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';

class DetailPesananPage extends StatelessWidget {
  const DetailPesananPage({Key key}) : super(key: key);

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
    final bukti = args['bukti'];
    final tgl_bukti = args['tgl_bukti'];

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
                    height: MediaQuery.of(context).size.width * 0.9,
                    width: MediaQuery.of(context).size.width * 0.9,
                    // margin: EdgeInsets.only(
                    //   top: defaultMargin,
                    // ),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(urlGambar + bukti),
                      )),
                    )),
              ],
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
