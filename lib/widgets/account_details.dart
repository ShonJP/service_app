import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Color.fromARGB(255, 116, 176, 118),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Text(
                    user!.email.toString(),
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 88, 88, 88)),
                  ),
                ),
              ],
            ),
            Container(
              height: 40,
              width: double.infinity,
              color: const Color.fromARGB(255, 196, 240, 198),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Wallet',
                    style: TextStyle(
                        color: Color.fromARGB(255, 25, 99, 27), fontSize: 18),
                  ),
                  Container(
                    width: 150,
                    height: 30,
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        'Balance - 125',
                        style: TextStyle(
                            color: Color.fromARGB(255, 25, 99, 27),
                            fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(249, 200, 200, 200),
                        width: 0.75)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.manage_accounts,
                        color: Color.fromARGB(255, 81, 80, 80),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(249, 200, 200, 200),
                        width: 0.75)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color.fromARGB(255, 81, 80, 80),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        'Saved Address',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(249, 200, 200, 200),
                        width: 0.75)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.policy,
                        color: Color.fromARGB(255, 81, 80, 80),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        'Terms and Conditions',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(249, 200, 200, 200),
                        width: 0.75)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.privacy_tip,
                        color: Color.fromARGB(255, 81, 80, 80),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        'Privacy Policy',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(249, 200, 200, 200),
                        width: 0.75)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.people_alt_rounded,
                        color: Color.fromARGB(255, 81, 80, 80),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        'Refer a friend',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(249, 200, 200, 200),
                        width: 0.75)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.support_agent_rounded,
                        color: Color.fromARGB(255, 81, 80, 80),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        'Customer Support',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(249, 200, 200, 200),
                          width: 0.75)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Color.fromARGB(255, 81, 80, 80),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          'Log Out',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
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
