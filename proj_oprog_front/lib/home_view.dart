import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Home Page', style: Theme.of(context).textTheme.headlineMedium),
        ],
      ),
    );
  }
}
