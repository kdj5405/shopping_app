import 'package:flutter/material.dart';

class ShippingInformationPage extends StatelessWidget {
  const ShippingInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shipping Information")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "We ship within 2 working days",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(labelText: "Full Name"),
            ),
            const TextField(decoration: InputDecoration(labelText: "Location")),
            const TextField(
              decoration: InputDecoration(
                labelText: "Delivery Note",
                hintText: "Enter any special instructions",
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(value: true, onChanged: (_) {}),
                const Text("I accept the terms"),
              ],
            ),
            const Text("Read our T&Cs", style: TextStyle(color: Colors.blue)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save logic
              },
              child: const Text("Save shipping information"),
            ),
          ],
        ),
      ),
    );
  }
}
