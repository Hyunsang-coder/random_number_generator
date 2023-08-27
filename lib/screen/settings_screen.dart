import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/component/number_row.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  final maxNumber;
  const SettingsScreen({required this.maxNumber, super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 1000;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    maxNumber = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Primary_Color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Body(maxNumber: maxNumber),
              _Footer(maxNumber: maxNumber,
                onSliderChanged: onSliderChanged,
                onButtonPressed: onSaveButtonClicked,
              ),
            ]
          ),
        ),
        ),
      );
  }

  void onSliderChanged(double val)
  {
    setState(() {
      maxNumber = val;
    });
  }

  void onSaveButtonClicked()
  {
    Navigator.of(context).pop(maxNumber.toInt());
  }

}


class _Body extends StatelessWidget {
  final double maxNumber;
  const _Body({required this.maxNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(number: maxNumber.toInt()),
    );
  }
}


class _Footer extends StatelessWidget {
  final double maxNumber;
  final VoidCallback onButtonPressed;
  final ValueChanged<double>? onSliderChanged;

  const _Footer({required this.maxNumber,
    required this.onSliderChanged,
    required this.onButtonPressed,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
            value: maxNumber,
            min: 1000,
            max: 10000000,
            onChanged: onSliderChanged),
        ElevatedButton(
            onPressed: onButtonPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Red_Color,
            ),
            child: Text('Save!'))
      ],
    );
  }
}
