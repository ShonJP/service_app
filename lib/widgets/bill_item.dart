import 'package:flutter/material.dart';
import 'package:service_app/data/dummy_data.dart';
import 'package:service_app/models/service.dart';

class BillItem extends StatefulWidget {
  const BillItem({
    super.key,
    required this.keys,
    required this.values,
  });

  final String keys;
  final int values;

  @override
  State<BillItem> createState() => _BillItemState();
}

class _BillItemState extends State<BillItem> {
  @override
  Widget build(BuildContext context) {
    final String keys = widget.keys;
    final int values = widget.values;
    final Service service = dummyService
        .where((service) => service.name == widget.keys)
        .toList()[0];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(keys),
          const SizedBox(
            width: 100,
          ),
          Text(
            (service.price * values).toString(),
          )
        ],
      ),
    );
  }
}
