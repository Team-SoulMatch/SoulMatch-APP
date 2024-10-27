import 'package:flutter/material.dart';

import 'components/route_animation.dart';

class SearchResult extends StatelessWidget {
  final String keyword;
  final TextEditingController controller = TextEditingController();
  SearchResult({super.key, required this.keyword});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Text("'$keyword' 검색결과", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    filled: true,
                    hintText: '여기에 키워드를 입력하세요',
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none
                    ),
                    fillColor: Color(0xFFF8583C)
                  )
                )
              ),
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: const Color(0xFF58D84F),
                  padding: const EdgeInsets.all(5),
                  child: IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () {
                      PageRouteWithAnimation route = PageRouteWithAnimation(SearchResult(keyword: controller.text));
                      Navigator.push(
                        context,
                        route.slideRightToLeft()
                      );
                    }
                  )
                )
              )
            ]
          ),
          const SizedBox(height: 100),
          const Text('검색 결과가 없습니다', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text('조금 더 짧은 키워드로 검색하여 주세요', style: TextStyle(fontSize: 16))
        ]
      )
    ));
  }
}
