import 'package:apps/model/user_model.dart';
import 'package:apps/provider/auth_provider.dart';
import 'package:apps/provider/list_pemesanan_provider.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileAdminPage extends StatefulWidget {
  const ProfileAdminPage({Key key}) : super(key: key);

  @override
  _ProfileAdminPageState createState() => _ProfileAdminPageState();
}

class _ProfileAdminPageState extends State<ProfileAdminPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ListPesananProvider listPesananProvider =
        Provider.of<ListPesananProvider>(context);
    getmasuk() async {
      if (await listPesananProvider.getPesananAdmin()) {}
    }

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/image_profile.png',
                    width: 64,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.nama,
                        style: primaryTextStyle.copyWith(
                            fontSize: 20, fontWeight: semiBold)),
                    user.rules == "2"
                        ? Text("Owner",
                            style: primaryTextStyle.copyWith(
                                fontSize: 24, fontWeight: semiBold))
                        : Text("Admin",
                            style: primaryTextStyle.copyWith(
                                fontSize: 24, fontWeight: semiBold)),
                  ],
                )),
                GestureDetector(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove("id");
                      prefs.setBool("is_login", false);
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/index', (route) => false);
                    },
                    child: Icon(
                      FontAwesomeIcons.signOutAlt,
                      size: 40,
                      color: Colors.red[900],
                    ))
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
            Icon(
              Icons.chevron_right,
              color: primaryTextColor,
            ),
          ],
        ),
      );
    }

    Widget pesanan() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: backgroundColor3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Pesanan',
                style: primaryTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (await listPesananProvider.getPesananAdmin()) {
                    Navigator.pushNamed(context, '/order-masuk');
                  } else { 
                    print("gagal");
                  }
                },
                child: menuItem(
                  'Masuk',
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (await listPesananProvider.getPesananDikemas()) {
                    Navigator.pushNamed(context, '/dikemas');
                  } else {
                    print("gagal");
                  }
                },
                child: menuItem(
                  'Dikemas',
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (await listPesananProvider.getPesananDikirim()) {
                    Navigator.pushNamed(context, '/dikirim');
                  } else {
                    print("gagal");
                  }
                },
                child: menuItem(
                  'Dikirim',
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (await listPesananProvider.getPesananSampai()) {
                    Navigator.pushNamed(context, '/sampai');
                  } else {
                    print("gagal");
                  }
                },
                child: menuItem(
                  'Sampai',
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: backgroundColor3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Owner',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/add-admin');
                },
                child: menuItem(
                  'Tambah Admin',
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          header(),
          pesanan(),
          user.rules == "2" ? content() : SizedBox()
        ],
      ),
    );
  }
}
