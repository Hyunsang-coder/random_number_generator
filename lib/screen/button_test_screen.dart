import 'package:flutter/material.dart';


class ButtonTestScreen extends StatelessWidget {
  const ButtonTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Buttons'),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(onPressed: (){},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                            if(states.contains(MaterialState.pressed))
                            {
                              return Colors.yellow;
                            }
                            return Colors.red;
                          }),
                  foregroundColor: MaterialStateProperty.all(Colors.white)


                ),
                  child: Text('ElevatedButton'),
              ),
              OutlinedButton(onPressed: (){},
                  child: Text('OutlinedButton')
              ),
              TextButton(onPressed: (){},
                  child: Text('TextButton')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
