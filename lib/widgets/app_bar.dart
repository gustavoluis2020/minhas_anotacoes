import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String sectionName;
  const AppBarWidget({Key? key, required this.sectionName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/firebase_logo.png',
          height: 20,
        ),
        const SizedBox(
          width: 8,
        ),
        const Text(
          'Minhas ',
          style: TextStyle(color: Colors.yellowAccent, fontSize: 18),
        ),
        Text(
          sectionName,
          style: const TextStyle(color: Colors.yellowAccent, fontSize: 18),
        ),
      ],
    );
  }
}
