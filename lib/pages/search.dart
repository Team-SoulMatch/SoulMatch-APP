import 'package:flutter/material.dart';
import 'package:soul_match/pages/search_result.dart';

import '../core/data.dart';
import 'components/route_animation.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  final List<String> popularVolunteers = ['도서관', '청소', '캠페인'];
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFF74526)),
      body: Padding(padding: const EdgeInsets.all(20), child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('무슨 봉사활동을 찾으세요?', style: TextStyle(color: Colors.black, fontSize: 18)),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length * 2,
                itemBuilder: (context, index) {
                  final actualIndex = index % categories.length;
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Image.asset('assets/volunteer_${actualIndex + 1}.png', width: 60, height: 60),
                        Text(categories[actualIndex])
                      ]
                    )
                  );
                }
              )
            ),
            const Center(child: Text("봉사활동 검색하기", style: TextStyle(fontSize: 20))),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
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
              )
            ),
            const SizedBox(height: 16),
            const Text('요즘 인기있는 봉사활동', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            AspectRatio(
              aspectRatio: 2,
              child: Row(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Card(
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset('assets/popular1.png', fit: BoxFit.cover),
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: Text(popularVolunteers[0], style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))
                            ),
                            const Positioned(
                              top: 8,
                              right: 8,
                              child: Text('1위', style: TextStyle(color: Colors.white, fontSize: 14))
                            )
                          ]
                        )
                      )
                    )
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Card(
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset('assets/popular2.png', fit: BoxFit.cover),
                                  Positioned(
                                    bottom: 8,
                                    left: 8,
                                    child: Text(popularVolunteers[1], style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))
                                  ),
                                  const Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Text('2위', style: TextStyle(color: Colors.white, fontSize: 14))
                                  )
                                ]
                              )
                            )
                          )
                        ),
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Card(
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset('assets/popular3.png', fit: BoxFit.cover),
                                  Positioned(
                                    bottom: 8,
                                    left: 8,
                                    child: Text(popularVolunteers[2], style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))
                                  ),
                                  const Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Text('3위', style: TextStyle(color: Colors.white, fontSize: 14))
                                  )
                                ]
                              )
                            )
                          )
                        )
                      ]
                    )
                  )
                ]
              )
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('꼭 지켜야 할 봉사활동 예절', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
            )
          ]
        )
      )
    ));
  }
}