import 'package:flutter/material.dart';
import 'package:service_app/models/service.dart';
import 'package:service_app/data/dummy_data.dart';
import 'package:service_app/widgets/service_item.dart';

class DeepCleaning extends StatefulWidget {
  const DeepCleaning(
      {super.key, required this.currentCart, required this.count});

  final Map<String, dynamic> currentCart;
  final num count;

  @override
  State<DeepCleaning> createState() {
    return _DeepCleaningState();
  }
}

class _DeepCleaningState extends State<DeepCleaning> {
  final List<Service> _maidServiceData = dummyService
      .where((service) => service.category == Category.deepCleaning)
      .toList();

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> currentCart = widget.currentCart;
    final num count = widget.count;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView.builder(
          itemCount: _maidServiceData.length,
          itemBuilder: (ctx, index) => ServiceItem(
            service: _maidServiceData[index],
            currentCart: currentCart,
            count: count,
          ),
        ),
      ),
    );
  }
}
