import 'package:flutter/material.dart';

void main() {
  runApp(const WaslnyRider());
}

class WaslnyRider extends StatelessWidget {
  const WaslnyRider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
