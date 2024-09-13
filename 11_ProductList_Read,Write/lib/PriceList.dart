import 'package:flutter/material.dart';
import 'addProduct.dart';

class PriceList extends StatefulWidget {
  const PriceList({super.key});

  @override
  State<PriceList> createState() => _PriceListState();
}

class _PriceListState extends State<PriceList> {
  final List<Map<String, String>> _products = [
    {
      'image': 'https://thumbs.dreamstime.com/b/coffee-cup-vector-collection-illustration-40689298.jpg',
      'name': 'Product 1',
      'price': '10',
      'quantity': '200',
      'total': '2000'
    },
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Price List"),
      ),
      body: ListView.separated(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return _buildListTile(
            imageUrl: product['image']!,
            name: product['name']!,
            price: product['price']!,
            quantity: product['quantity']!,
            total: product['total']!,
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddProduct(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildListTile({
    required String imageUrl,
    required String name,
    required String price,
    required String quantity,
    required String total,
  }) {
    return ListTile(
      leading: Image.network(
        imageUrl,
        height: 60,
      ),
      title: Text(name),
      subtitle: Wrap(
        spacing: 16,
        children: [
          Text('Unit price $price'),
          Text('Quantity $quantity'),
          Text('Total Price $total'),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Handle edit action
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline_sharp),
            onPressed: () {
              // Handle delete action
            },
          ),
        ],
      ),
    );
  }
}
