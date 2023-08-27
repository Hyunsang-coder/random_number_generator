import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/component/number_row.dart';
import 'package:random_number_generator/constant/color.dart';
import 'package:random_number_generator/screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumber = [123, 456, 789];
  int maxNumber = 1000;

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
              _Header(onPressed: onSettingChanged,),
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
      int rand = Random().nextInt(maxNumber);
      newRandomNumber.add(rand);
    }

    setState(() {
      randomNumber = newRandomNumber.toList();
    });
  }

  void onSettingChanged() async {
    final result = await Navigator
        .of(context)
        .push<int>(
        MaterialPageRoute(
            builder:
                (BuildContext context) {
              return SettingsScreen(maxNumber: maxNumber,);
            }
        ));
    setState(() {
      if (result != null)
      {
        maxNumber = result;
      }
    });
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;
  const _Header({required this.onPressed, super.key});

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
          onPressed: onPressed,
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
                      padding: EdgeInsets.only(bottom: x.key == 2 ? 0 : 20),
                      child: NumberRow(number: x.value),
                    ))
                .toList())
    );
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
