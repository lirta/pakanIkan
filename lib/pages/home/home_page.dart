import 'package:apps/model/user_model.dart';
import 'package:apps/provider/auth_provider.dart';
import 'package:apps/theme.dart';
import 'package:apps/widget/custom_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  String rules;
  void initState() {
    cekUser();
  }

  cekUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    rules = prefs.getString("rules");
    if (rules == "2") {
      Navigator.pushNamed(context, '/home-admin');
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, right: defaultMargin, left: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hallo,',
                          style: primaryTextStyle.copyWith(
                              fontSize: 20, fontWeight: semiBold),
                        ),
                        Text(
                          user.nama,
                          style: primaryTextStyle.copyWith(
                              fontSize: 20, fontWeight: semiBold),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  // Text(user.email,
                  //   style: subtitleTextStyle.copyWith(fontSize: 16),
                  // )
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/image_profile.png'))),
            )
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
            color: backgroundColor1),
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
                      fontSize: 24,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Pelayanan yang maksimal serta dan menjaga kualitas demi kepuasn pelanggan',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 20,
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
          ],
        ),
      );
    }

    return ListView(
      children: [header(), content()],
    );
  }
}
