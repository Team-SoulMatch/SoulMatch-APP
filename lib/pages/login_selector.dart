import 'package:flutter/material.dart';
import 'components/back_arrow_template.dart';
import 'components/buttons.dart' as button;
import 'components/route_animation.dart';
import 'provide_self_selector.dart';

class LoginSelector extends StatelessWidget {
  const LoginSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BackArrowTemplate(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("간편로그인으로 시작하세요", style: TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          button.OutlinedButton(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Image.asset(
                  'assets/google.png',
                  width: 20,
                  height: 20
                ),
                const SizedBox(width: 10),
                const Text("NANU ID로 계속하기")
              ]
            ),
            onClick: (){
              PageRouteWithAnimation route = PageRouteWithAnimation(const ProvideSelfSelector());
              Navigator.push(
                context,
                route.slideRightToLeft()
              );
            },
          ),
          /*
          const SizedBox(height: 8),
          button.OutlinedButton(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 5),
                Image.asset(
                  'assets/logo.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 5),
                const Text("SoulMatch 계정으로 계속하기")
              ],
            ),
            onClick: (){
              PageRouteWithAnimation route = PageRouteWithAnimation(const ProvideSelfSelector());
              Navigator.push(
                context,
                route.slideRightToLeft()
              );
            },
          )
          */
        ],
      )
    );
  }
}
