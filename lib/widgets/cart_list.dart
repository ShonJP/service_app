import 'package:flutter/material.dart';
import 'package:service_app/widgets/cart_item.dart';

class CartList extends StatefulWidget {
  const CartList({
    super.key,
    required this.currentCart,
    required this.countChange,
    required this.countDecrease,
  });

  final Map<String, dynamic> currentCart;
  final void Function(String item) countChange;
  final void Function(String item) countDecrease;

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> currentCart = widget.currentCart;
    final List keys = widget.currentCart.entries.map((e) {
      return e.key;
    }).toList();

    final List values = widget.currentCart.entries.map((e) {
      return e.value;
    }).toList();

    final void Function(String item) countChange = widget.countChange;
    final void Function(String item) countDecrease = widget.countDecrease;

    Widget content = const Center(
      child: Text('No items added yet.'),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: currentCart.isEmpty ? content : ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: keys.length,
          itemBuilder: (ctx, index) => CartItem(
            keys: keys[index],
            values: values[index],
            ind: index + 1,
            currentCart: widget.currentCart,
            countChange: (String item) {
              countChange(item);
            },
            countDecrease: (String item) {
              countDecrease(item);
            } ,
          ),
        ),
      ),
    );
  }
}
