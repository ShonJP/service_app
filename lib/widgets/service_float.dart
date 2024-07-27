import 'package:flutter/material.dart';
import 'package:service_app/data/dummy_data.dart';
import 'package:service_app/models/service.dart';

class ServiceFloat extends StatefulWidget {
  const ServiceFloat(
      {super.key, required this.count, required this.currentCart});

  final num count;
  final Map<String, dynamic> currentCart;

  @override
  State<ServiceFloat> createState() {
    return _ServiceFloatState();
  }
}

class _ServiceFloatState extends State<ServiceFloat> {
  @override
  Widget build(BuildContext context) {
    num count = widget.count;
    final Map<String, dynamic> currentCart = widget.currentCart;


    final List keys = currentCart.entries.map((e) {
      return e.key;
    }).toList();

    int totalPrice = 0;
    List<Service> service = [];
    for (var i = 0; i < keys.length; i++) {
      var ser =
          dummyService.where((service) => service.name == keys[i]).toList();
      service.add(ser[0]);
    }
    for (var ele in service) {
      int items = currentCart[ele.name];
      totalPrice += ele.price * items;
    }

    // void countUpdate() {
    //   setState(() {
    //     final List values = currentCart.entries.map((e) {
    //       return e.value;
    //     }).toList();
    //     num countItems() {
    //       num sum = 0;
    //       for (var element in values) {
    //         sum += element;
    //       }
    //       return sum;
    //     }

    //     count = countItems();
    //   });
    // }

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        elevation: 20,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$count Items',
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(
                      '₹ $totalPrice',
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
