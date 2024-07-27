import 'package:flutter/material.dart';

class FreqAddService extends StatefulWidget {
  const FreqAddService({super.key});

  @override
  State<FreqAddService> createState() {
    return _FreqAddService();
  }
}

class _FreqAddService extends State<FreqAddService> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Frequently Added Services',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/images/cart.png'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Home Cleaning'),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Text(
                              '₹ 499',
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              width: 17,
                            ),
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.green, ),
                              height: 40,
                              width: 40,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                  color: Colors.white,
                                ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/images/cart.png'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Carpet Cleaning'),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Text(
                              '₹ 499',
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              width: 17,
                            ),
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.green, ),
                              height: 40,
                              width: 40,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                  color: Colors.white,
                                ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/images/cart.png'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Home Cleaning'),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Text(
                              '₹ 499',
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              width: 17,
                            ),
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.green, ),
                              height: 40,
                              width: 40,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                  color: Colors.white,
                                ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/images/cart.png'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Home Cleaning'),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Text(
                              '₹ 499',
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              width: 17,
                            ),
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.green, ),
                              height: 40,
                              width: 40,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                  color: Colors.white,
                                ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
