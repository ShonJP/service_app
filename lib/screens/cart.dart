import 'package:flutter/material.dart';
import 'package:service_app/widgets/bill_details.dart';
import 'package:service_app/widgets/cart_float.dart';
import 'package:service_app/widgets/cart_list.dart';
import 'package:service_app/screens/service.dart';
import 'package:service_app/widgets/freq_add_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:service_app/data/dummy_data.dart';
import 'package:service_app/models/service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.currentCart});

  final Map<String, dynamic> currentCart;

  @override
  State<CartScreen> createState() {
    return _CartScreenState();
  }
}

class _CartScreenState extends State<CartScreen> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> currentCart = widget.currentCart;
    final List keys = currentCart.entries.map((e) {
      return e.key;
    }).toList();

    void countChange(String item) {
      setState(() {
        currentCart[item]++;
        FirebaseFirestore.instance
            .collection('cart')
            .doc(user!.uid)
            .set(currentCart);
      });
    }

    void countDecrease(String item) {
      setState(() {
        currentCart[item]--;
        if (currentCart[item] == 0) {
          currentCart.remove(item);
        }
        FirebaseFirestore.instance
            .collection('cart')
            .doc(user!.uid)
            .set(currentCart);
      });
    }

    void seeAll(BuildContext context) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => ServiceScreen(
            currentCart: currentCart,
          ),
        ),
      );
    }

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: CartList(
                      currentCart: currentCart,
                      countChange: (String item) {
                        countChange(item);
                      },
                      countDecrease: (String item) {
                        countDecrease(item);
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        seeAll(context);
                      },
                      child: const Text('Add more services'),
                    ),
                  ),
                  const SizedBox(
                    height: 300,
                    child: FreqAddService(),
                  ),
                  Card.outlined(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 233, 233, 233),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10))),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              child: Text(
                                'Coupon Code',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0.25),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 268.9,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Apply',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 300,
                    child: BillDetails(
                      currentCart: currentCart,
                      totalPrice: totalPrice,
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 100,
                child: CartFloat(totalPrice: totalPrice),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 50,
                child: InkWell(
                  child: Card(
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'Book Slot',
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
