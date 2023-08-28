import 'package:flutter/material.dart';
import 'package:random_number_generator/layout/main_layout.dart';
import 'package:random_number_generator/main.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      body: MainLayout(titleText: 'Route Two', children:
      [
        Text('Argument: $arguments', textAlign: TextAlign.center,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Route_Three, arguments: "route 3 argument");
            },
            child: Text('PushNamed')),

        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop("Result");
            },
            child: Text('Pop')),
      ],),

      );
  }
}
