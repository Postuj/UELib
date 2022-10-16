import 'package:flutter/material.dart';

class UELogo extends StatelessWidget {
  const UELogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/uelogo.png',
      scale: 1.5,
    );
  }
}
