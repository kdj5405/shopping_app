import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {"name": "티셔츠", "price": 30000},
    {"name": "청바지", "price": 50000},
  ];

  @override
  Widget build(BuildContext context) {
    double total = cartItems.fold(0, (sum, item) => sum + item["price"]);

    return Scaffold(
      appBar: AppBar(title: Text("장바구니")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  title: Text(item["name"]),
                  trailing: Text("${item["price"]}원"),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("총액: $total원", style: TextStyle(fontSize: 18)),
                ElevatedButton(
                  child: Text("결제하기"),
                  onPressed: () {
                    // 결제 로직 처리
                    print("결제 진행 중...");
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
