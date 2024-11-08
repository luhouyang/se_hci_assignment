import 'package:flutter/material.dart';

class H1Text extends StatelessWidget {
  final String text;

  const H1Text({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayLarge);
  }
}
