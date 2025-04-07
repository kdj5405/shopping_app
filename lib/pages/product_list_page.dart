import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String selectedFilter = 'new';

  final List<Map<String, String>> menuItems = [
    {'title': 'product_list_page', 'desc': 'Menu description.'},
    {'title': 'product_detail_page', 'desc': 'Menu description.'},
    {'title': 'Landing_page', 'desc': 'Menu description.'},
    {'title': 'My_Cart', 'desc': 'Menu description.'},
    {'title': 'Menu_Label', 'desc': 'Menu description.'},
  ];

  final List<Map<String, dynamic>> products = List.generate(
    10,
    (index) => {
      'id': index,
      'title': 'Text $index',
      'price': 10 + index * 5,
      'date': DateTime.now().subtract(Duration(days: index)),
      'imageUrl': 'https://via.placeholder.com/150',
    },
  );

  List<Map<String, dynamic>> get sortedProducts {
    List<Map<String, dynamic>> sorted = [...products];
    switch (selectedFilter) {
      case 'asc':
        sorted.sort((a, b) => a['price'].compareTo(b['price']));
        break;
      case 'desc':
        sorted.sort((a, b) => b['price'].compareTo(a['price']));
        break;
      case 'new':
      default:
        sorted.sort((a, b) => b['date'].compareTo(a['date']));
    }
    return sorted;
  }

void _showPopupMenu(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Menu",
    pageBuilder: (_, __, ___) {
      return Stack(
        children: [
          Positioned(
            top: kToolbarHeight + 12,
            right: 16,
            child: Material(
              borderRadius: BorderRadius.circular(12),
              elevation: 8,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...menuItems.map((item) => ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(item['title']!),
                          subtitle: Text(item['desc']!),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/${item['title']}');
                          },
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.home, color: Colors.black87),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        actions: [
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: () => _showPopupMenu(context),
        ),
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.tune),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(
                  label: const Text('New'),
                  selected: selectedFilter == 'new',
                  onSelected: (_) => setState(() => selectedFilter = 'new'),
                ),
                ChoiceChip(
                  label: const Text('Price ascending'),
                  selected: selectedFilter == 'asc',
                  onSelected: (_) => setState(() => selectedFilter = 'asc'),
                ),
                ChoiceChip(
                  label: const Text('Price descending'),
                  selected: selectedFilter == 'desc',
                  onSelected: (_) => setState(() => selectedFilter = 'desc'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: sortedProducts.length,
                itemBuilder: (context, index) {
                final product = sortedProducts[index];
                return GestureDetector(
                  onTap: () {

                    Navigator.pushNamed(
                      context,
                      '/product_detail_page',
                      arguments: product,

                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(product['imageUrl'], fit: BoxFit.cover),
                        ),
                        const SizedBox(height: 8),
                        Text(product['title'], style: const TextStyle(fontSize: 16)),
                        Text('\$${product['price']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                );
              },
              ),
            ),
          ],
        ),
      ),
    );
  }
}