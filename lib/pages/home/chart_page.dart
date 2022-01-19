import 'package:apps/provider/auth_provider.dart';
import 'package:apps/provider/page_provider.dart';
import 'package:apps/theme.dart';
import 'package:apps/widget/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String id;
  bool isLogin = false;
  @override
  void initState() {
    cekLogin();
  }

  cekLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLogin = prefs.getBool("is_login");
    id = prefs.getString("id");

    if (isLogin == true) {
      AuthProvider authProvider =
          Provider.of<AuthProvider>(context, listen: false);
      if (await authProvider.getUser(id: id)) {
        setState(() {
          isLogin = true;
        });
        print(id);
        print("sudah login");
      } else {
        print("error get data");
        Navigator.pushNamed(context, '/sign-in');
        print(isLogin);
        print(id);
      }
    } else {
      print("belumlogin");
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    //  AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Message Support',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon_headset.png',
                width: 80,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Opss no message yet?',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'You have never done a transaction',
                style: secondaryTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {
                    pageProvider.currentIndex = 0;
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Explore Store',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Widget content() {
    //   return StreamBuilder(
    //   // return StreamBuilder<List<MessageModel>>(
    //       // stream: MessageService()
    //       //     .getMessagesByUserId(userId: authProvider.user.id),
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           if (snapshot.data!.length == 0) {
    //             return emptyChat();
    //           }

    //           return Expanded(
    //             child: Container(
    //               width: double.infinity,
    //               color: backgroundColor3,
    //               child: ListView(
    //                 padding: EdgeInsets.symmetric(
    //                   horizontal: defaultMargin,
    //                 ),
    //                 children: [
    //                   // ChatTile(snapshot.data![snapshot.data!.length - 1]),
    //                 ],
    //               ),
    //             ),
    //           );
    //         } else {
    //           return emptyChat();
    //         }
    //       });
    // }

    // ignore: unused_element
    Widget emptychat() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon_headset.png',
                width: 80,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Opss no message yet?',
                style: priceTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
          child: Container(
        width: double.infinity,
        color: backgroundColor3,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            ChatTitle(),
          ],
        ),
      ));
    }

    return Column(
      children: [header(), content()],
    );
  }
}
