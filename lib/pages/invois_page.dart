import 'package:apps/model/pesanan_model.dart';
import 'package:apps/provider/pesanan_provider.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvoicPage extends StatefulWidget {
  const InvoicPage({Key key}) : super(key: key);

  @override
  _InvoicPageState createState() => _InvoicPageState();
}

class _InvoicPageState extends State<InvoicPage> {
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
                  "Metode Pembayaran",
                  style: priceTextStyle.copyWith(fontWeight: semiBold),
                ),
                Divider(
                  thickness: 1,
                  color: Color(0Xff2e3141),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Nama Bank',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                  maxLines: 3,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "BRI",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12,
                    // fontWeight: medium
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Atas Nama',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                  maxLines: 3,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Bapak Budi",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12,
                    // fontWeight: medium
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'No Reg.',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                  maxLines: 3,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "1079-0100-9040-5-36",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12,
                    // fontWeight: medium
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
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
                  "Invoice",
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
                      // Text(pesanan.nama_penerima,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bonus (Kg)",
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                        // fontWeight: medium
                      ),
                    ),
                    Text(
                      pesanan.bonus,
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
                        fontSize: 12,
                        // fontWeight: medium
                      ),
                    ),
                    Text(
                      pesanan.status,
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
          SizedBox(
            height: 12,
          ),
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pembayaran');
              },
              // handlePesanan,
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Bayar Sekarang',
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
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },

                // handlePesanan,
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Lewati',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                )),
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
