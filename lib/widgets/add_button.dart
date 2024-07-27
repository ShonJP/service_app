import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:service_app/models/service.dart';

class AddButton extends StatefulWidget {
  const AddButton(
      {super.key, required this.service, required this.currentCart, required this.count});

  final Service service;
  final Map<String, dynamic> currentCart;
  final num count;

  @override
  State<AddButton> createState() {
    return _AddButtonState();
  }
}

class _AddButtonState extends State<AddButton> {
  final user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    final currentService = widget.service;
    final Map<String, dynamic> currentCart = widget.currentCart;

    var currentCount = currentCart.containsKey(currentService.name)
        ? currentCart[currentService.name]!.toInt()
        : 0;
    var currentText = currentCart.containsKey(currentService.name)
        ? currentCart[currentService.name]!.toString()
        : 'Add';

    void addItem() {
      currentCount == 0
          ? currentCart.remove(currentService.name)
          : currentCart[currentService.name] = currentCount;

      FirebaseFirestore.instance.collection('cart').doc(user!.uid).set(currentCart);
    }

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 30,
        width: 105,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            color: Color.fromARGB(150, 114, 208, 117)),
        child: currentText == 'Add'
            ? InkWell(
                onTap: () {
                  setState(() {
                    currentCount++;
                    currentText = currentCount.toString();
                    addItem();
                  });
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Add'),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.add,
                      size: 20,
                    ),
                  ],
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      currentCount == 9
                          ? null
                          : setState(() {
                              currentCount++;
                              currentText = currentCount.toString();
                              addItem();
                            });
                    },
                    iconSize: 20,
                    icon: const Icon(Icons.add),
                  ),
                  Text(currentText),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentCount--;
                        currentCount == 0
                            ? currentText = 'Add'
                            : currentText = currentCount.toString();
                        addItem();
                      });
                    },
                    iconSize: 20,
                    icon: const Icon(Icons.remove),
                  )
                ],
              ),
      ),
    );
  }
}
