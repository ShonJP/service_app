import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/screens/cart.dart';
import 'package:service_app/widgets/available_services.dart';
import 'package:service_app/widgets/cleaning_services.dart';
import 'package:service_app/widgets/search_bar.dart';
import 'package:service_app/screens/service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final address = '406, Skyline Park Dale, MM Road North Mumbai, Mumbai';

  //Map<String,dynamic> currentCart = {};
  final user = FirebaseAuth.instance.currentUser;

Future getCart() async {
  final cartData = await FirebaseFirestore.instance.collection('cart').doc(user!.uid).get();
  final cart = cartData.data();
  return cart;
}


void seeAll(BuildContext context) {
    getCart().then((cartItems) {
      Map<String,dynamic> currentCart = cartItems == null ? {}: cartItems;
      Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ServiceScreen(currentCart: currentCart,),
      ),
    );
    });
    
  }

  void cart(BuildContext context) {
    getCart().then((cartItems) {
      Map<String,dynamic> currentCart = cartItems;
      Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => CartScreen(currentCart: currentCart),
      ),
    );
    });
    
  }

  @override
  Widget build(BuildContext context) {

    
    //FirebaseFirestore.instance.collection('cart').doc(user!.uid).set(currentCart);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          children: [
            const Center(
              child: Text('         👋'),
            ),
            const SizedBox(
              height: 2,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '  406, Skyline Park Dale, MM Road.... ⌄',
                style: GoogleFonts.getFont(
                  'Nunito',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 1.2,
                  color: const Color.fromARGB(255, 114, 114, 114),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              cart(context);
            },
            icon: const Icon(
              Icons.shopping_cart_sharp,
              color: Color.fromARGB(255, 78, 152, 81),
              size: 36,
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(215, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Image(
                image: AssetImage('assets/images/intro.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SearchBarApp(),
            const SizedBox(
              height: 20,
            ),
            AvailableServices(seeAll: (context) {
                seeAll(context);
              }),
            SizedBox(
              height: 315,
              child: CleaningServices(seeAll: (context) {
                seeAll(context);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
