import 'package:flutter/material.dart';

class AvailableServices extends StatelessWidget {
  const AvailableServices({super.key, required this.seeAll});

  final void Function(BuildContext context) seeAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Available Services',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image(
                          image: AssetImage('assets/images/mini1.png'),
                        ),
                        Text('Cleaning'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Image(
                          image: AssetImage('assets/images/mini2.png'),
                        ),
                        Text('Waste Disposal'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Image(
                          image: AssetImage('assets/images/mini3.png'),
                        ),
                        Text('Plumbing'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Image(
                          image: AssetImage('assets/images/mini3.png'),
                        ),
                        Text('Plumbing'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Image(
                          image: AssetImage('assets/images/mini1.png'),
                        ),
                        Text('Cleaning'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Column(
                      children: [
                        Image(
                          image: AssetImage('assets/images/mini2.png'),
                        ),
                        Text('Waste Disposal'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Column(
                      children: [
                        Image(
                          image: AssetImage('assets/images/mini3.png'),
                        ),
                        Text('Plumbing'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        seeAll(context);
                      },
                        child: const Column(
                         children: [
                           Image(
                             image: AssetImage('assets/images/mini4.png'),
                           ),
                           Text('See All'),
                         ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
      ),
    );
  }
}
