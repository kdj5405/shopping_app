import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['title'])),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(product['imageUrl'], fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Text(product['title'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('\$${product['price']}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            const Text('이곳은 상품 상세 설명입니다.'),
          ],
        ),
      ),
    );
  }
}