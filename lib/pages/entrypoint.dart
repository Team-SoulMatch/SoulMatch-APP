import 'package:flutter/material.dart';
import 'package:soul_match/pages/login_selector.dart';
import 'components/route_animation.dart';
import 'components/buttons.dart' as button;

class Entrypoint extends StatelessWidget {
  const Entrypoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(padding: const EdgeInsets.all(20), child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "빠르고 간편한\n자원봉사 매칭 서비스",
                textAlign: TextAlign.start, style: TextStyle(fontSize: 20)
              )
            ),
            Image.asset(
              'assets/logo_with_text.png',
              width: 150,
              height: 150
            ),
            button.FilledButton(
              child: const Text("시작하기", style: TextStyle(color: Colors.white)),
              onClick: (){
                PageRouteWithAnimation route = PageRouteWithAnimation(const LoginSelector());
                Navigator.push(
                  context,
                  route.slideRightToLeft()
                );
              },
            )
          ],
        ),
      ),
    ));
  }
}
