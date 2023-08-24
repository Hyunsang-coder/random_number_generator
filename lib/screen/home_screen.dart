import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumber = [123, 456, 789];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Primary_Color,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(),
              _Body(
                randomNumber: randomNumber,
              ),
              _Footer(onPressed: generateRandomNumber)
            ],
          ),
        ),
      ),
    );
  }

  void generateRandomNumber() {
    Set<int> newRandomNumber = {};

    while (newRandomNumber.length != 3) {
      int rand = Random().nextInt(999);
      newRandomNumber.add(rand);
    }

    setState(() {
      randomNumber = newRandomNumber.toList();
    });
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'RANDOM NUMBER GENERATOR',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings),
          color: Colors.red,
        )
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNumber;
  const _Body({required this.randomNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: randomNumber
                .asMap()
                .entries
                .map((x) => Padding(
                      padding: EdgeInsets.only(bottom: x.key == 2 ? 0 : 10),
                      child: Row(
                          children: x.value
                              .toString()
                              .split('')
                              .map((y) => Image.asset(
                                    'asset/img/$y.png',
                                    height: 70,
                                    width: 50,
                                  ))
                              .toList()),
                    ))
                .toList()));
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;
  const _Footer({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Red_Color,
        ),
        onPressed: onPressed,
        child: Text('Generate'),
      ),
    );
  }
}
