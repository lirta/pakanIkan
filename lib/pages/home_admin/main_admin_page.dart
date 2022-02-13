// import 'package:apps/pages/home_admin/chat_admin_page.dart';
// import 'package:apps/pages/home_admin/home_admin_page.dart';
// import 'package:apps/pages/home_admin/list_admin_page.dart';
// import 'package:apps/pages/home_admin/order_dikemas_page.dart';
// import 'package:apps/pages/home_admin/order_dikirim_page.dart';
// import 'package:apps/pages/home_admin/profile_admin_page.dart';
// import 'package:apps/provider/page_provider.dart';
// import 'package:apps/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

// class MainAdminPage extends StatelessWidget {
//   const MainAdminPage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     PageProvider pageProvider = Provider.of<PageProvider>(context);

//     Widget cartButton() {
//       return FloatingActionButton(
//         onPressed: () {
//           Navigator.pushNamed(context, '/sipping');
//         },
//         backgroundColor: secondaryColor,
//         child: Image.asset(
//           'assets/icon_cart.png',
//           width: 20,
//         ),
//       );
//     }

//     Widget customBottomNav() {
//       return ClipRRect(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(30),
//         ),
//         child: BottomAppBar(
//           shape: CircularNotchedRectangle(),
//           notchMargin: 12,
//           clipBehavior: Clip.antiAlias,
//           child: BottomNavigationBar(
//             backgroundColor: primaryColor,
//             currentIndex: pageProvider.currentIndex,
//             onTap: (value) {
//               print(value);
//               pageProvider.currentIndex = value;
//             },
//             type: BottomNavigationBarType.fixed,
//             items: [
//               BottomNavigationBarItem(
//                 icon: Container(
//                   margin: EdgeInsets.only(
//                     top: 20,
//                     bottom: 10,
//                   ),
//                   child: Icon(
//                     FontAwesomeIcons.cartArrowDown,
//                     size: 21,
//                     color: pageProvider.currentIndex == 0
//                         ? secondaryColor
//                         : backgroundColor1,
//                   ),
//                 ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Container(
//                   margin: EdgeInsets.only(
//                     top: 20,
//                     bottom: 10,
//                   ),
//                   child: Icon(
//                     FontAwesomeIcons.dollyFlatbed,
//                     size: 20,
//                     color: pageProvider.currentIndex == 1
//                         ? secondaryColor
//                         : backgroundColor1,
//                   ),
//                 ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Container(
//                   margin: EdgeInsets.only(
//                     top: 20,
//                     bottom: 10,
//                   ),
//                   child: Icon(
//                     FontAwesomeIcons.shippingFast,
//                     size: 20,
//                     color: pageProvider.currentIndex == 2
//                         ? secondaryColor
//                         : backgroundColor1,
//                   ),
//                 ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Container(
//                   margin: EdgeInsets.only(
//                     top: 20,
//                     bottom: 10,
//                   ),
//                   child: Icon(
//                     FontAwesomeIcons.comments,
//                     size: 20,
//                     color: pageProvider.currentIndex == 3
//                         ? secondaryColor
//                         : backgroundColor1,
//                   ),
//                 ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Container(
//                   margin: EdgeInsets.only(
//                     top: 20,
//                     bottom: 10,
//                   ),
//                   child: Icon(
//                     FontAwesomeIcons.userCircle,
//                     size: 20,
//                     color: pageProvider.currentIndex == 4
//                         ? secondaryColor
//                         : backgroundColor1,
//                   ),
//                 ),
//                 label: '',
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     Widget body() {
//       switch (pageProvider.currentIndex) {
//         case 0:
//           return HomeAdminPage();
//           break;
//         case 1:
//           return OrderDikemasPage();
//           break;
//         case 2:
//           return OrderDikirimPage();
//           break;
//         case 3:
//           return ChatAdminPage();
//           break;
//         case 4:
//           return ProfileAdminPage();
//           break;

//         default:
//           return HomeAdminPage();
//       }
//     }

//     return Scaffold(
//       backgroundColor:
//           pageProvider.currentIndex == 0 ? backgroundColor1 : backgroundColor3,
//       // floatingActionButton: cartButton(),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: customBottomNav(),
//       body: body(),
//     );
//   }
// }
