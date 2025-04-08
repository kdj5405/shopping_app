import 'package:flutter/foundation.dart';
import 'product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners(); // UI 갱신
  }
}
