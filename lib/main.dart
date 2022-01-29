import 'package:apps/pages/detail_chat_page.dart';
import 'package:apps/pages/detail_pesanan_page.dart';
import 'package:apps/pages/home/Shipping_page.dart';
import 'package:apps/pages/home/chart_page.dart';
import 'package:apps/pages/home/main_page.dart';
import 'package:apps/pages/home/order_page.dart';
import 'package:apps/pages/home/produk_page.dart';
import 'package:apps/pages/home_admin/add_admin_page.dart';
import 'package:apps/pages/home_admin/admin_detail_pesanan_page.dart';
import 'package:apps/pages/home_admin/chat_admin_page.dart';
import 'package:apps/pages/home_admin/list_admin_page.dart';
import 'package:apps/pages/home_admin/main_admin_page.dart';
import 'package:apps/pages/home_admin/order_dikemas_page.dart';
import 'package:apps/pages/home_admin/order_dikirim_page.dart';
import 'package:apps/pages/home_admin/pesanan_admin_page.dart';
import 'package:apps/pages/home_admin/profile_admin_page.dart';
import 'package:apps/pages/index_page.dart';
import 'package:apps/pages/invois_page.dart';
import 'package:apps/pages/pembayaran_page.dart';
import 'package:apps/pages/pembayaran_skip_page.dart';
import 'package:apps/pages/sign_in_page.dart';
import 'package:apps/pages/sign_up_page.dart';
import 'package:apps/pages/splash_page.dart';
import 'package:apps/pages/succes_login.dart';
import 'package:apps/provider/auth_provider.dart';
import 'package:apps/provider/list_pemesanan_provider.dart';
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
        ChangeNotifierProvider(create: (context) => PageProvider()),
        ChangeNotifierProvider(create: (context) => ProdukProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => PesananProvider()),
        ChangeNotifierProvider(create: (context) => ListPesananProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/succes-login': (context) => const SuccessLoginPage(),
          '/index': (context) => const IndexPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SingUpPage(),
          '/home': (context) => const MainPage(),
          '/caht': (context) => const ChatPage(),
          '/sipping': (context) => const ShippingPage(),
          '/detail-chat': (context) => const DetailChatPage(),
          '/invoic': (context) => const InvoicPage(),
          '/pembayaran': (context) => const PembayaranPage(),
          '/detail-pesanan': (context) => const DetailPesananPage(),
          '/pembayaran-skip': (context) => const PembayaranSkipPage(),
          '/order': (context) => const OrderPage(),
          //admin
          '/home-admin': (context) => const MainAdminPage(),
          '/admin-detail-pesanan': (context) => const AdminDetailPesananPage(),
          '/chat-admin': (context) => const ChatAdminPage(),
          '/profile-admin': (context) => const ProfileAdminPage(),
          '/pesanan-admin': (context) => const PesananAdminPage(),
          '/list-admin': (context) => const ListAdminPage(),
          '/add-admin': (context) => const AddAdminPage(),
          '/order-dikemas': (context) => const OrderDikemasPage(),
          '/order-dikirim': (context) => const OrderDikirimPage(),
          '/produk': (context) => const ProdukPage(),
        },
        // home: SplashPage(),
      ),
    );
  }
}
