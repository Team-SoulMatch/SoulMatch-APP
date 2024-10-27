import 'package:flutter/material.dart';
import 'package:soul_match/pages/provide_self/adult.dart';

import 'components/route_animation.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF74526),
        automaticallyImplyLeading: false
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue[200],
              child: const Icon(Icons.person, size: 50, color: Colors.blue),
            ),
            const SizedBox(height: 16),
            const Text('홍길동', style: TextStyle(fontSize: 18, color: Colors.black)),
            const SizedBox(height: 24),
            const Text('사용자 설정', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                PageRouteWithAnimation route = PageRouteWithAnimation(const ProvideSelf());
                Navigator.push(
                  context,
                  route.slideRightToLeft()
                );
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
              ),
              child: const Text('사용자 선호 봉사활동 변경하기', style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 24),
            const Text('계정 설정', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
              ),
              child: const Text('프로필 이미지 변경하기', style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
              ),
              child: const Text('비밀번호 수정하기', style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 40),
              ),
              child: const Text('탈퇴하기', style: TextStyle(color: Colors.white)),
            ),
          ],
        )
      )
    );
  }
}