import 'package:flutter/material.dart';
import 'package:soul_match/pages/components/back_arrow_template.dart';
import 'package:soul_match/pages/provide_self/adult.dart';
import 'components/buttons.dart' as button;
import 'components/route_animation.dart';

class ProvideSelfSelector extends StatelessWidget {
  const ProvideSelfSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BackArrowTemplate(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("시작하려면 선호 봉사활동\n정보가 필요해요", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 60),
          button.FilledButton(
            child: const Text("정보 등록하기", style: TextStyle(color: Colors.white)),
            onClick: (){
              PageRouteWithAnimation route = PageRouteWithAnimation(const ProvideSelf());
              Navigator.push(
                  context,
                  route.slideRightToLeft()
              );
            }
          ),
          const SizedBox(height: 8),
          button.OutlinedButton(
            child: const Text("정보 등록 없이 계속하기"),
            onClick: (){}
          )
        ],
      )
    );
  }
}
