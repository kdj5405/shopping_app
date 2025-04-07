import 'package:flutter/material.dart';
import 'package:shopping_app/pages/product_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/product_list_page',
      routes: {
        '/product_list_page': (context) => const ProductListPage(),
        '/product_detail_page': (context) => const DummyPage(title: 'Product Detail Page'),
    //    '/landing_page': (context) => const DummyPage(title: 'Landing Page'),
    //    '/my_cart': (context) => const DummyPage(title: 'My Cart'),
    //    '/menu_label': (context) => const DummyPage(title: 'Menu Label'),
      },
    );
  }
}

class DummyPage extends StatelessWidget {
  final String title;
  const DummyPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title 내용입니다')),
    );
  }
}