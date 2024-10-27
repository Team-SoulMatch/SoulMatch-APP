import 'package:flutter/material.dart';
import 'package:soul_match/pages/components/back_arrow_template.dart';
import 'package:soul_match/pages/components/provide_self_alert.dart';
import 'package:soul_match/pages/components/title_with_sub.dart';
import '../components/buttons.dart' as button;
import '../components/option_selector.dart';
import '../components/route_animation.dart';
import 'local.dart';

class ProvideSelf extends StatefulWidget {
  const ProvideSelf({super.key});

  @override
  State<ProvideSelf> createState() => _ProvideSelfState();
}

class _ProvideSelfState extends State<ProvideSelf> {
  int isAdult = -1;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return BackArrowTemplate(
      child: Column(
        children: [
          const Align(alignment: Alignment.topLeft, child: TitleWithSub(title: "나이대를 알려주세요")),
          SizedBox(height: height*0.125),
          OptionSelector(
              maxSelection: 1,
              direction: Axis.horizontal,
              onItemsSelected: (value){
                setState(() {
                  isAdult = (value.isEmpty) ? -1 : value[0];
                });
              },
              children: List.generate(2, (index) {
                return Option(
                  padding: const EdgeInsets.all(4),
                  defaultChild: Container(
                    width: 140,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: const Color(0xfff74526),
                        width: 2
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(index == 0 ? "assets/blue_user.png" : "assets/green_user.png", width: 80),
                        const SizedBox(width: 5),
                        Text(index == 0 ? "미성년자" : "성인")
                      ]
                    )
                  ),
                  selectedChild: Container(
                    width: 140,
                    height: 180,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xfff74526)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(index == 0 ? "assets/blue_user.png" : "assets/green_user.png", width: 80),
                        const SizedBox(width: 5),
                        Text(index == 0 ? "미성년자" : "성인", style: const TextStyle(color: Colors.white))
                      ]
                    )
                  )
                );
              }, growable: false)
          ),
          Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            button.FilledButton(
              onClick: () {
                if (isAdult == -1) {
                  return;
                }
                PageRouteWithAnimation route = PageRouteWithAnimation(const Local());
                Navigator.push(
                  context,
                  route.slideRightToLeft()
                );
              },
              child: const Text("다음", style: TextStyle(color: Colors.white))
            ),
            const ProvideSelfAlert()
          ])),
        ],
      )
    );
  }
}
