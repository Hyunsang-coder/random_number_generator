import 'package:flutter/material.dart';
import '../layout/main_layout.dart';

class RouteThreeScreen extends StatelessWidget {
  const RouteThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      body: MainLayout(titleText: 'Route Three', children:
      [
        Text('Argument: $arguments', textAlign: TextAlign.center,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Pop')),
      ],),

    );
  }
}
