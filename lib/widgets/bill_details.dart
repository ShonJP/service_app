import 'package:flutter/material.dart';
import 'package:service_app/widgets/bill_item.dart';
import 'package:dotted_line/dotted_line.dart';

class BillDetails extends StatefulWidget {
  const BillDetails(
      {super.key, required this.currentCart, required this.totalPrice});

  final Map<String, dynamic> currentCart;
  final int totalPrice;

  @override
  State<BillDetails> createState() {
    return _BillDetailsState();
  }
}

class _BillDetailsState extends State<BillDetails> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> currentCart = widget.currentCart;
    final List keys = currentCart.entries.map((e) {
      return e.key;
    }).toList();
    final List values = currentCart.entries.map((e) {
      return e.value;
    }).toList();

    int totalPrice = widget.totalPrice;

    Widget content = const Center(
      child: Text('No items added yet.'),
    );

    return Card.outlined(
      color: Colors.white,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 233, 233, 233),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(10))),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Text(
                  'Bill Details',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: currentCart.isEmpty ? content : ListView.builder(
              itemCount: keys.length,
              itemBuilder: (ctx, index) => BillItem(
                keys: keys[index],
                values: values[index],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: DottedLine(
              direction: Axis.horizontal,
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total :', style: TextStyle(fontSize: 22),),
                  Text(
                    totalPrice.toString(), style: const TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
