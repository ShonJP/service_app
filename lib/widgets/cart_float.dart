import 'package:flutter/material.dart';

class CartFloat extends StatefulWidget {
  const CartFloat({super.key, required this.totalPrice});

  final int totalPrice;

  @override
  State<CartFloat> createState() {
    return _CartFloatState();
  }
}

class _CartFloatState extends State<CartFloat> {
  @override
  Widget build(BuildContext context) {
    int totalPrice = widget.totalPrice;

    return Card(
      elevation: 20,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Grand Total :',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '₹ ${totalPrice.toString()}',
                  style: const TextStyle(fontSize: 24),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
