import 'package:flutter/material.dart';
import 'package:service_app/widgets/account_details.dart';



class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() {
    return _AccountScreenState();
  }
}

class _AccountScreenState extends State<AccountScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        backgroundColor: Colors.white,
      ),
      body: const AccountDetails(),
      backgroundColor: Colors.white,
    );
  }
}