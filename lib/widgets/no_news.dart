import 'package:flutter/material.dart';

class NoNews extends StatelessWidget {
   const NoNews({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SliverFillRemaining(
      child: Center(
        child: Column(
          children: [
            Image(image: AssetImage('assets/error.png')),
            Text('Oops, there is an error, please try later',
                style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
