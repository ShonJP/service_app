import 'package:flutter/material.dart';


class CleaningServices extends StatelessWidget {
  const CleaningServices({super.key, required this.seeAll});

  final void Function(BuildContext context) seeAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cleaning Services',
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () {
                      seeAll(context);
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(fontSize: 18, color: Colors.green)
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const Column(
                      children: [
                        Image(
                          image: AssetImage('assets/images/big1.png'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Home Cleaning'),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Column(
                      children: [
                        Image(
                          image: AssetImage('assets/images/big2.png'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Carpet Cleaning'),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Column(
                      children: [
                        Image(
                          image: AssetImage('assets/images/big1.png'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Home Cleaning'),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        seeAll(context);
                      },
                      child:const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/mini4.png'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('See More'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
