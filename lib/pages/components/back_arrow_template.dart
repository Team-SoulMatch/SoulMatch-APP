import 'package:flutter/material.dart';

class BackArrowTemplate extends StatelessWidget {
  final Widget child;

  const BackArrowTemplate({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ),
      body: Center(child: child),
    );
  }
}
