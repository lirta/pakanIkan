import 'package:apps/model/list_pesanan_model.dart';
import 'package:apps/provider/pesanan_provider.dart';
import 'package:apps/service/server.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPesananDikirim extends StatelessWidget {
  ListPesananModel listpesananDikirim;
  ListPesananDikirim(this.listpesananDikirim);

  @override
  Widget build(BuildContext context) {
    PesananProvider pesananProvider = Provider.of<PesananProvider>(context);
    detailPesanan() async {
      if (await pesananProvider.getPesanan(id: listpesananDikirim.id)) {
        print("berhasil");
        Navigator.pushNamed(context, '/admin-detail-pesanan');
      } else {
        print("gagal");
      }
    }
  
    return GestureDetector(
      onTap: detailPesanan,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: backgroundColor6),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/produk.jpeg',
                width: 120,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listpesananDikirim.nama_penerima,
                    // 'lirta',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    listpesananDikirim.hp_penerima,
                    // 'lirta',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    listpesananDikirim.tgl_pemesanan,
                    // 'Lierta',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  listpesananDikirim.gambar == null ?
                  Text("Pembayaran Tertunda",
                    // 'Lierta',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ):
                  Text("Menunggu Komfirmasi Pembayaran ",
                    // 'Lierta',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
