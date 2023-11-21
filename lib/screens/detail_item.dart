import 'package:flutter/material.dart';
import 'package:inventory_management/models/item.dart';

class ItemDetailPage extends StatelessWidget {
  final Item item;

  const ItemDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        backgroundColor: Color.fromARGB(255, 48, 150, 198),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Card(
          elevation: 10.0, // Add a shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Add rounded corners
          ),
          margin: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.fields.name,
                  style: const TextStyle(
                    fontSize: 24.0, // Increase font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Amount: ${item.fields.amount}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 15),
                Text(
                  "Description: ${item.fields.description}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Return to the item list page
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
