import 'package:flutter/material.dart';
import 'package:random_number_generator/layout/main_layout.dart';
import 'package:random_number_generator/screen/route_one_screen.dart';


class NvgHomeScreen extends StatelessWidget {
  const NvgHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(titleText: "Home",
      children: [
      ElevatedButton(
          onPressed: () async{
           final result = await Navigator.of(context).pushNamed("/one", arguments: "P1 Arg");

           print(result);
          },
          child: Text("Push"))
    ], );
  }
}
