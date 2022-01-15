import 'package:apps/model/user_model.dart';
import 'package:apps/provider/auth_provider.dart';
import 'package:apps/theme.dart';
import 'package:apps/widget/custom_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, Inda',
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    '@inda',
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  )
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

    Widget categories() {
      return Container(
        child: Column(),
      );
    }

    // Widget categories() {
    //   return Container(
    //     margin: EdgeInsets.only(top: defaultMargin),
    //     child: SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       child: Row(
    //         children: [
    //           SizedBox(
    //             width: defaultMargin,
    //           ),
    //           Container(
    //             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    //             margin: EdgeInsets.only(right: 16),
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(12),
    //                 color: primaryColor),
    //             child: Text(
    //               "ABOUT",
    //               style: primaryTextStyle.copyWith(
    //                   fontSize: 13, fontWeight: medium),
    //             ),
    //           ),
    //           Container(
    //             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    //             margin: EdgeInsets.only(right: 16),
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(12),
    //                 border: Border.all(color: subtitleColor),
    //                 color: transparentColor),
    //             child: Text(
    //               "VISI & MISI",
    //               style: primaryTextStyle.copyWith(
    //                   fontSize: 13, fontWeight: medium),
    //             ),
    //           ),
    //           Container(
    //             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    //             margin: EdgeInsets.only(right: 16),
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(12),
    //                 border: Border.all(color: subtitleColor),
    //                 color: transparentColor),
    //             child: Text(
    //               "PRODAC",
    //               style: primaryTextStyle.copyWith(
    //                   fontSize: 13, fontWeight: medium),
    //             ),
    //           ),
    //           Container(
    //             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    //             margin: EdgeInsets.only(right: 16),
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(12),
    //                 border: Border.all(color: subtitleColor),
    //                 color: transparentColor),
    //             child: Text(
    //               "CONTAC",
    //               style: primaryTextStyle.copyWith(
    //                   fontSize: 13, fontWeight: medium),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    return ListView(
      children: [
        header(),
        Container(
          child: Column(
            children: [
              CustomTabBar(
                titles: ['About', 'Visi & Misi', 'Prodact'],
                selectedIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              SizedBox(
                height: 16,
              ),
              Builder(
                builder: (_) {
                  String body = (selectedIndex == 0)
                      ? 'About'
                      : (selectedIndex == 1)
                          ? 'Visi & misi'
                          : 'Prodact';

                  return Center(
                    child: Text(
                      body,
                    ),
                  );
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
