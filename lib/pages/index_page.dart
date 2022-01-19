import 'package:apps/theme.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin, left: defaultMargin),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/logo.png'))),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Kelompok Tani \n Sumber Rezeki',
                    style: primaryTextStyle.copyWith(
                        fontSize: 30, fontWeight: semiBold),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
            color: backgroundColor4),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Kelompok tani ini berdiri pada tahun 2011 yang didirikan oleh bapak rudi Susanto, awalnya Kelompok tani ini hanya berfokus kepada budidaya ikan seperti ikan lele, ikan patin dll. Tetapi karena semakin banyak yang berminat untuk budidaya ikan, bapak Rudi Susanto berinisiatif untuk membuat pakan ikan yang diproduksi sendiri sehingga dapat menghemat biaya perawatan ikan untuk masyarakat disekitar.',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Visi',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Memiliki sumber daya manusia yang berkualitas serta menjunjung tinggi nilai agama dan kejujuran',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Misi',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Pelayanan yang maksimal serta dan menjaga kualitas demi kepuasn pelanggan',
                    style: subtitleTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                        onPressed: () {Navigator.pushNamed(context, '/sign-in');},
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: primaryColor,
                        ),
                        child: Text(
                          'Sign In',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/sign-up');
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: primaryColor,
                        ),
                        child: Text(
                          'Sign Up',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
            // margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              children: [header(), content()],
            ),
          ),
        ),
      ),
    );
  }
}
