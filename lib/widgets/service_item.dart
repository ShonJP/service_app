import 'package:flutter/material.dart';
import 'package:service_app/models/service.dart';
import 'package:service_app/widgets/add_button.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem(
      {super.key,
      required this.service,
      required this.currentCart,
      required this.count});

  final Service service;
  final Map<String, dynamic> currentCart;
  final num count;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const Image(
                  image: AssetImage('assets/images/service.png'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star),
                        Text(' ${service.rating.toString()} / 5'),
                        const SizedBox(
                          width: 20,
                        ),
                        Text('${service.orders} Orders'),
                      ],
                    ),
                    Text(
                      service.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text('${service.time} minutes'),
                    Text(
                      '₹ ${service.price}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 130,
            child: Align(
              alignment: Alignment.bottomRight,
              child: AddButton(
                service: service,
                currentCart: currentCart,
                count: count,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
