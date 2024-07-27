import 'package:flutter/material.dart';
import 'package:service_app/screens/car_cleaning.dart';
import 'package:service_app/screens/carpet_cleaning.dart';
import 'package:service_app/screens/cart.dart';
import 'package:service_app/screens/deep_cleaning.dart';
import 'package:service_app/screens/maid_services.dart';
import 'package:service_app/widgets/service_float.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key, required this.currentCart});

  final Map<String, dynamic> currentCart;

  @override
  State<ServiceScreen> createState() {
    return _ServiceScreenState();
  }
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> currentCart = widget.currentCart;

    final List values = currentCart.entries.map((e) {
      return e.value;
    }).toList();
    num countItems() {
      num sum = 0;
      for (var element in values) {
        sum += element;
      }
      return sum;
    }

    void viewCart(BuildContext context) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => CartScreen(
            currentCart: currentCart,
          ),
        ),
      );
    }

    num count = countItems();
    //final void Function() countUpdate;

    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Cleaning Services'),
          bottom: const TabBar(
            labelColor: Colors.green,
            indicatorColor: Colors.green,
            tabs: <Widget>[
              Tab(
                text: 'Car Cleaning',
              ),
              Tab(
                text: 'Maid Services',
              ),
              Tab(
                text: 'Carpet Cleaning',
              ),
              Tab(
                text: 'Deep Cleaning',
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: TabBarView(
                children: <Widget>[
                  Center(
                    child: CarCleaning(
                      currentCart: currentCart,
                      count: count,
                    ),
                  ),
                  Center(
                    child: MaidServices(
                      currentCart: currentCart,
                      count: count,
                    ),
                  ),
                  Center(
                    child: CarpetCleaning(
                      currentCart: currentCart,
                      count: count,
                    ),
                  ),
                  Center(
                    child: DeepCleaning(
                      currentCart: currentCart,
                      count: count,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 100,
                child: ServiceFloat(
                  count: count,
                  currentCart: currentCart,
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 50,
                  child: InkWell(
                    onTap: () {
                      viewCart(context);
                    },
                    child: const Card(
                      color: Color.fromARGB(255, 255, 109, 31),
                      child: Center(
                        child: Text(
                          'View Cart',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
