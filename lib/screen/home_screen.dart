import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Random number genrator'),
                  Icon(Icons.settings)
                ],),
              Expanded(
                child: Column(
                  mainAxisAlignment:
                    MainAxisAlignment.center,
                  children: [
                  Text('1,2,3'),
                  Text('4,5,6'),
                  Text('7,8,9'),
                  ]
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Generate'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
