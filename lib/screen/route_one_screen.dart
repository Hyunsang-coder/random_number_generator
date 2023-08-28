import 'package:flutter/material.dart';
import 'package:random_number_generator/layout/main_layout.dart';
import 'package:random_number_generator/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  const RouteOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String? textArg = ModalRoute.of(context)?.settings.arguments.toString();

    return MainLayout(
      titleText: "Route One",
      children: [
        Text(textArg.toString(), textAlign: TextAlign.center,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(
                  MaterialPageRoute(
                      builder: (_) => RouteTwoScreen(),
                      settings: RouteSettings(
                        arguments: 'argument',)
                  )
              );
            },
            child: Text('Push')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop("Result");
            },
            child: Text('Pop')),

      ],
    );
  }
}
