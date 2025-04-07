import 'package:flutter/material.dart';
import 'package:shopping_app/pages/product_detail_page';
import 'pages/product_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  title: 'Shopping App',
  initialRoute: '/product_list_page',
  routes: {
    '/product_list_page': (context) => const ProductListPage(),
    '/product_detail_page': (context) => const ProductDetailPage(),
  //  '/landing_page': (context) => const LandingPage(),
  //  '/my_cart': (context) => const MyCartPage(),
  //  '/menu_label': (context) => const MenuLabelPage(),
  },
);
  }
}