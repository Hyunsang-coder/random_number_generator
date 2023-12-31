import 'package:flutter/material.dart';


class NumberRow extends StatelessWidget {
  final int number;
  const NumberRow({required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
        number
            .toString()
            .split('')
            .map((x) => Image.asset('asset/img/$x.png',
          width: 40.0,
          height: 60.0,)).
        toList()
    );
  }
}
