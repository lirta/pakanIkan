import 'package:apps/model/user_model.dart';
import 'package:apps/pages/list_pesanan_dikemas.dart';
import 'package:apps/provider/auth_provider.dart';
import 'package:apps/provider/list_pemesanan_provider.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../list_pesanan.dart';

class OrderDikemasPage extends StatefulWidget {
  const OrderDikemasPage({ Key key }) : super(key: key);

  @override
  _OrderDikemasPageState createState() => _OrderDikemasPageState();
}

class _OrderDikemasPageState extends State<OrderDikemasPage> {
  int selectedIndex = 0;
  String rules;
  String id;
  void initState() {
    cekUser();
    getpesanan();
    _refreshPesanan(context);
  }

  cekUser() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // rules = prefs.getString("rules");
    // if ( rules == "2") {
    //   Navigator.pushNamed(context, '/home-admin');
    // }
  }
  getpesanan() async {
    await Provider.of<ListPesananProvider>(context, listen: false)
        .getPesananDikemas();
  }

  Future<void> _refreshPesanan(BuildContext context) async {
    await Provider.of<ListPesananProvider>(context, listen: false)
        .getPesananDikemas();
  }
  @override
  Widget build(BuildContext context) {
    ListPesananProvider listPesananProvider =
        Provider.of<ListPesananProvider>(context);
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
            )
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
          'List Order Sedang Dikemas',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget newArrivals() {
      return Expanded(
        child: Container(
            color: backgroundColor3,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: listPesananProvider.listpesananDikemas
                .map(
                  (listpesananDikemas) => ListPesananDikemas(listpesananDikemas),
                )
                .toList(),
          ),
        ),
      );
    }

    return Column(
        children: 
        [header(),
        newArrivalsTitle(),
        newArrivals(),
        //  content()
         ],
      
    );
  }
}