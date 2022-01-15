import 'package:apps/pages/detail_chat_page.dart';
import 'package:apps/pages/home/Shipping_page.dart';
import 'package:apps/pages/home/chart_page.dart';
import 'package:apps/pages/home/main_page.dart';
import 'package:apps/pages/invois_page.dart';
import 'package:apps/pages/pembayaran_page.dart';
import 'package:apps/pages/sign_in_page.dart';
import 'package:apps/pages/sign_up_page.dart';
import 'package:apps/pages/splash_page.dart';
import 'package:apps/provider/auth_provider.dart';
import 'package:apps/provider/page_provider.dart';
import 'package:apps/provider/pesanan_provider.dart';
import 'package:apps/provider/produk_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>PageProvider()),
        ChangeNotifierProvider(create: (context)=>ProdukProvider()),
        ChangeNotifierProvider(create: (context)=>AuthProvider()),
        ChangeNotifierProvider(create: (context)=>PesananProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=> const SplashPage(),
          '/sign-in':(context) =>const SignInPage(),
          '/sign-up':(context) =>const SingUpPage(),
          '/home':(context) =>const MainPage(),
          '/caht':(context) =>const ChatPage(),
          '/sipping':(context) =>const ShippingPage(),
          '/detail-chat':(context) =>const DetailChatPage(),
          '/detail-pesanan':(context) =>const InvoicPage(),
          '/pembayaran':(context) =>const PembayaranPage(),
        },
        // home: SplashPage(),
      ),
    );
  }
}

