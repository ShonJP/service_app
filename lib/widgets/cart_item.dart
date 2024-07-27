import 'package:flutter/material.dart';
import 'package:service_app/data/dummy_data.dart';
import 'package:service_app/models/service.dart';
//import 'package:service_app/widgets/add_button.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    super.key,
    required this.keys,
    required this.values,
    required this.ind,
    required this.currentCart,
    required this.countChange,
    required this.countDecrease,
  });

  final String keys;
  final int values;
  final int ind;
  final Map<String, dynamic> currentCart;
  final void Function(String item) countChange;
  final void Function(String item) countDecrease;

  @override
  State<CartItem> createState() {
    return _CartItemScreen();
  }
}

class _CartItemScreen extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    final String keys = widget.keys;
    final int values = widget.values;
    final int ind = widget.ind;
    final Service service =
        dummyService.where((service) => service.name == keys).toList()[0];
    //final Map<String, dynamic> currentCart = widget.currentCart;
    final void Function(String item) countChange = widget.countChange;
    final void Function(String item) countDecrease = widget.countDecrease;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200,
            child: Text(
              '${ind.toString()}.   $keys',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              color: Color.fromARGB(255, 94, 94, 94),
            ),
            child: InkWell(
              //hoverColor: Colors.grey,
              onTap: () {
                countChange(keys);
              },
              child: const Icon(
                Icons.add,
                size: 22,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            values.toString(),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              color: Color.fromARGB(255, 94, 94, 94),
            ),
            child: InkWell(
              onTap: () {
                countDecrease(keys);
              },
              child: const Icon(
                Icons.remove,
                size: 22,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            ' ₹ ${service.price.toString()}',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
