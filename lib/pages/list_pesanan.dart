import 'package:apps/model/list_pesanan_model.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';

class ListPesanan extends StatelessWidget {
  ListPesananModel lispesanan;
  ListPesanan(this.lispesanan);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                // child: Image.network(
                //   gambarUrl + member.gambar,
                //   width: 60,
                //   height: 60,
                //   fit: BoxFit.cover,
                // )
                ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   // member.name,
                  //   'inda',
                  //   style: wTextStyle.copyWith(
                  //     fontSize: 12,
                  //   ),
                  // ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    lispesanan.nama_penerima,
                    // 'lirta',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  // Text(
                  //   member.username,
                  //   // 'Lierta',
                  //   style: wTextStyle.copyWith(
                  //     fontWeight: FontWeight.normal,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
