import 'package:flutter/cupertino.dart';

class TitleWithSub extends StatelessWidget {
  final String title;
  const TitleWithSub({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(children: [const SizedBox(width: 20), Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Text("추후 바꿀 수 있어요", style: TextStyle(fontSize: 14, color: Color(0xFF787878)))
      ])]
    );
  }
}
