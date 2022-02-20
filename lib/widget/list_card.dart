import 'package:apps/model/list_pesanan_model.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListCard extends StatelessWidget {
  ListPesananModel lispesanan;

  ListCard(this.lispesanan);
  // ListPesanan(this.lispesanan);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        lispesanan.gambar != null
            ? Navigator.pushNamed(context, '/detail-pesanan', arguments: {
                'id': lispesanan.id,
                'penerima': lispesanan.nama_penerima,
                'hp': lispesanan.hp_penerima,
                'alamat': lispesanan.alamat_penerima,
                'tgl_order': lispesanan.tgl_pemesanan,
                'kg': lispesanan.kg,
                'total': lispesanan.total,
                'status': lispesanan.status,
                'bukti': lispesanan.gambar,
                'tgl_bukti': lispesanan.tgl_bayar,
                'bonus': lispesanan.bonus,
              })
            : Navigator.pushNamed(context, '/pembayaran-skip', arguments: {
                'id': lispesanan.id,
                'penerima': lispesanan.nama_penerima,
                'hp': lispesanan.hp_penerima,
                'alamat': lispesanan.alamat_penerima,
                'tgl_order': lispesanan.tgl_pemesanan,
                'kg': lispesanan.kg,
                'total': lispesanan.total,
                'status': lispesanan.status,
                'bonus': lispesanan.bonus,
              });
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: secondaryTextColor),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/produk.jpeg',
                width: 90,
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
                        "Penerima :",
                        style: blackTextStyle.copyWith(fontWeight: semiBold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        lispesanan.nama_penerima,
                        style: blackTextStyle.copyWith(fontWeight: semiBold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Tgl Order :",
                        style: blackTextStyle.copyWith(fontWeight: semiBold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        lispesanan.tgl_pemesanan,
                        style: blackTextStyle.copyWith(fontWeight: semiBold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Bonus :",
                        style: blackTextStyle.copyWith(fontWeight: semiBold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        lispesanan.bonus == null || lispesanan.bonus == "" ? 0 : lispesanan.bonus,
                        style: blackTextStyle.copyWith(fontWeight: semiBold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Status Order :",
                        style: blackTextStyle.copyWith(fontWeight: semiBold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        lispesanan.status,
                        style: blackTextStyle.copyWith(fontWeight: semiBold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            lispesanan.status == "order"
                ? Icon(
                    FontAwesomeIcons.dollyFlatbed,
                    size: 16,
                    color: priceColor,
                  )
                : Icon(
                    FontAwesomeIcons.shippingFast,
                    size: 16,
                    color: priceColor,
                  )
          ],
        ),
      ),
    );
  }
}

void _showSimpleDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Tambah Pengguna",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Nama Lengkap",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextField(
              style: new TextStyle(
                  fontSize: 14.0, height: 1.0, color: Colors.black),
              decoration: new InputDecoration(
                hintText: "Input nama lengkap",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(3.0)),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 15.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Kontak",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextField(
              style: new TextStyle(
                  fontSize: 14.0, height: 1.0, color: Colors.black),
              decoration: new InputDecoration(
                hintText: "Input kontak",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(3.0)),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 15.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
            child: RaisedButton(
              color: Colors.blue,
              child: Text(
                "SIMPAN",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          )
        ],
      );
    },
  );
}
