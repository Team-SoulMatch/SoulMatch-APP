import 'package:flutter/material.dart';
import 'package:soul_match/models/volunteer.dart';
import 'package:soul_match/pages/components/back_arrow_template.dart';
import 'package:soul_match/pages/components/buttons.dart' as button;

class Detail extends StatefulWidget {
  final Volunteer volunteer;
  const Detail({super.key, required this.volunteer});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff74526),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.volunteer.imageUrl,
                height: 200
              ),
              Text(
                widget.volunteer.title,
                style: const TextStyle(fontSize: 20)
              ),
              const SizedBox(height: 20),
              const Text('위치', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(
                widget.volunteer.location,
                style: const TextStyle(fontSize: 12)
              ),
              const SizedBox(height: 20),
              const Text('모집기간', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const Text(
                '2024.08.20 ~ 2024.09.20',
                style: TextStyle(fontSize: 16)
              ),
              const SizedBox(height: 10),
              const Text('봉사기간', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(
                widget.volunteer.date,
                style: const TextStyle(fontSize: 16)
              ),
              const SizedBox(height: 10),
              const Text('청소년 가능 여부', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Text(widget.volunteer.date, style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 5),
                  const Icon(Icons.emoji_emotions, size: 20)
                ]
              ),
              const SizedBox(height: 30),
              Center(
                child: button.FilledButton(
                  onClick: () {},
                  child: const Text(
                    '지원하기',
                    style: TextStyle(fontSize: 16, color: Colors.white)
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}
