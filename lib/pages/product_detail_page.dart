import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('상품 상세')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl, height: 200),
            const SizedBox(height: 16),
            Text(product.title, style: Theme.of(context).textTheme.titleLarge),
            Text('\$${product.price.toStringAsFixed(2)} / mo',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(product.description),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: const Text('Buy')),
            const Divider(height: 32),
            Text('Label properties', style: Theme.of(context).textTheme.titleMedium),
            ListTile(title: const Text('Label'), subtitle: const Text('Description: Value')),
            ListTile(title: const Text('Label'), subtitle: const Text('Description: Value')),
            const Divider(height: 32),
            Text('Latest reviews', style: Theme.of(context).textTheme.titleMedium),
            _buildReview('Good!', 'Loved it', 'Alice', '2025-04-06'),
            _buildReview('Bad', 'Not worth it', 'Bob', '2025-04-05'),
            const Divider(height: 32),
            const Text('Follow the latest trends'),
            const Text('With our daily newsletter'),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email address',
                hintText: 'you@example.com',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: () {}, child: const Text('Submit')),
          ],
        ),
      ),
    );
  }

  Widget _buildReview(String title, String body, String reviewer, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(body),
        Text('- $reviewer, $date', style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 16),
      ],
    );
  }
}