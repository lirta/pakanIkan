import 'package:apps/model/pesanan_model.dart';
import 'package:apps/provider/pesanan_provider.dart';
import 'package:apps/service/server.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminDetailPesananPage extends StatefulWidget {
  const AdminDetailPesananPage({Key key}) : super(key: key);

  @override
  _AdminDetailPesananPageState createState() => _AdminDetailPesananPageState();
}

class _AdminDetailPesananPageState extends State<AdminDetailPesananPage> {
  @override
  Widget build(BuildContext context) {
    PesananProvider pesananProvider = Provider.of<PesananProvider>(context);
    PesananModel pesanan = pesananProvider.pesanan;
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                  pesanan.id_konsumen,
                  style: priceTextStyle.copyWith(fontWeight: semiBold),
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
                        fontSize: 12,
                        // fontWeight: medium
                      ),
                    ),
                    Text(
                      pesanan.nama_penerima,
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
                        fontSize: 12,
                        // fontWeight: medium
                      ),
                    ),
                    Text(
                      pesanan.alamat_penerima,
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                      maxLines: 2,
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
                      "Telepon",
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                        // fontWeight: medium
                      ),
                    ),
                    Text(
                      pesanan.hp_penerima,
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
                        fontSize: 12,
                        // fontWeight: medium
                      ),
                    ),
                    Text(
                      pesanan.tgl_pemesanan,
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
                        fontSize: 12,
                        // fontWeight: medium
                      ),
                    ),
                    Text(
                      pesanan.kg,
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                pesanan.tgl_bayar != ""
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Status",
                            style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                              // fontWeight: medium
                            ),
                          ),
                          Text(
                            pesanan.status,
                            style:
                                primaryTextStyle.copyWith(fontWeight: medium),
                          ),
                        ],
                      )
                    : Container(),
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
                          // fontSize: 12,
                          fontWeight: semiBold),
                    ),
                    Text(
                      pesanan.total,
                      style: priceTextStyle.copyWith(fontWeight: semiBold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          pesanan.gambar != null
              ? Container(
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
                              image: NetworkImage(UrlGambar + pesanan.gambar),
                            )),
                          )),
                    ],
                  ),
                )
              : Container(),
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            child: TextButton(
              onPressed: () async {
                if (await pesananProvider.postStatus(
                    id: pesanan.id, status: pesanan.status)) {
                  if (pesanan.status == "order") {
                    Navigator.pushNamed(context, '/home-admin');
                  }else{
                    Navigator.pushNamed(context, '/home-admin');
                  }
                  print("berhasil ubah status");
                } else {}
                // Navigator.pushNamed(context, '/pembayaran');
              },
              // handlePesanan,
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Konfirmasi Orderan',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
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
