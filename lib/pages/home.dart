import 'package:flutter/material.dart';
import 'package:soul_match/pages/components/list_item.dart';
import 'package:soul_match/pages/mypage.dart';
import 'package:soul_match/pages/search.dart';
import '../core/data.dart';
import '../models/volunteer.dart';
import './components/buttons.dart' as button;
import 'components/route_animation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String nowLocal = "서울특별시";
  String name = "홍길동";

  List<Volunteer> volunteerList = [
    Volunteer(
        id: 1,
        title: "서울복지관 주말 식사관 청소",
        date: "2024.07.29~2024.09.29",
        location: "서울복지관 3층 식사관",
        imageUrl: "https://i.namu.wiki/i/Y5S6RD8ecECEKOERSydguPG7XtSQXb9n67o2C0C7EHPZuQ2qmZCl4Adfr3Jf97ToLd-rMydGJ1tktpgU4B16RA.webp"
    ),
    Volunteer(
        id: 2,
        title: "강남구 지역사회 봉사활동",
        date: "2024.08.01~2024.08.31",
        location: "강남구청 2층 회의실",
        imageUrl: "https://i.namu.wiki/i/Y5S6RD8ecECEKOERSydguPG7XtSQXb9n67o2C0C7EHPZuQ2qmZCl4Adfr3Jf97ToLd-rMydGJ1tktpgU4B16RA.webp"
    ),
    Volunteer(
        id: 3,
        title: "종로구 어린이집 정리정돈",
        date: "2024.09.05~2024.10.05",
        location: "종로구 어린이집 1층",
        imageUrl: "https://i.namu.wiki/i/Y5S6RD8ecECEKOERSydguPG7XtSQXb9n67o2C0C7EHPZuQ2qmZCl4Adfr3Jf97ToLd-rMydGJ1tktpgU4B16RA.webp"
    ),
    Volunteer(
        id: 4,
        title: "노원구 주말 무료 급식 배식",
        date: "2024.10.01~2024.10.31",
        location: "노원구 복지관 식당",
        imageUrl: "https://i.namu.wiki/i/Y5S6RD8ecECEKOERSydguPG7XtSQXb9n67o2C0C7EHPZuQ2qmZCl4Adfr3Jf97ToLd-rMydGJ1tktpgU4B16RA.webp"
    ),
    Volunteer(
        id: 5,
        title: "마포구 공원 환경 정화 활동",
        date: "2024.11.01~2024.12.01",
        location: "마포구 시민공원",
        imageUrl: "https://i.namu.wiki/i/Y5S6RD8ecECEKOERSydguPG7XtSQXb9n67o2C0C7EHPZuQ2qmZCl4Adfr3Jf97ToLd-rMydGJ1tktpgU4B16RA.webp"
    )
  ];

  void changeLocal(String newLocal) {
    setState(() {
      nowLocal = newLocal;
    });
  }

  DropdownButton<String> _buildDropdownButton() {
    return DropdownButton<String>(
      value: nowLocal,
      iconEnabledColor: Colors.white,
      focusColor: Colors.transparent,
      items: locals.map((local) => _buildDropdownMenuItem(local)).toList(),
      onChanged: (String? value) {
        if (value != null) {
          changeLocal(value);
        }
      },
      underline: const SizedBox(),
    );
  }

  DropdownMenuItem<String> _buildDropdownMenuItem(String local) {
    return DropdownMenuItem<String>(
      value: local,
      enabled: local != nowLocal,
      child: Text(
        local,
        style: TextStyle(
          color: (local != nowLocal) ? Colors.black : Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF74526),
        title: _buildDropdownButton(),
        actions: [
          IconButton(
            onPressed: () {
              PageRouteWithAnimation route = PageRouteWithAnimation(const Search());
              Navigator.push(
                  context,
                  route.slideRightToLeft()
              );
            },
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("반가워요, $name님!", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("맞춤 봉사활동 추천을\n확인해 보세요", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, height: 1.1)),
                    button.FilledButton(
                      onClick: () {
                        PageRouteWithAnimation route = PageRouteWithAnimation(const MyPage());
                        Navigator.push(
                            context,
                            route.slideRightToLeft()
                        );
                      },
                      padding: const EdgeInsets.all(6),
                      color: Colors.black,
                      child: const Text("더보기", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: volunteerList.length,
              itemBuilder: (context, index) => ListItem(data: volunteerList[index]),
            ),
          ),
        ],
      ),
    );
  }
}
