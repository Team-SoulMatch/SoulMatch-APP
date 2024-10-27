import 'package:flutter/material.dart';
import 'package:soul_match/pages/components/back_arrow_template.dart';
import 'package:soul_match/pages/components/provide_self_alert.dart';
import 'package:soul_match/pages/components/title_with_sub.dart';
import 'package:soul_match/pages/home.dart';
import '../components/buttons.dart' as button;
import '../components/option_selector.dart';
import '../components/route_animation.dart';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  int _time = -1;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return BackArrowTemplate(
      child: Column(
        children: [
          const Align(alignment: Alignment.topLeft, child: TitleWithSub(title: "봉사활동 선호 시간을 알려주세요")),
          SizedBox(height: height*0.25),
          OptionSelector(
            maxSelection: 1,
            direction: Axis.horizontal,
            onItemsSelected: (value){
              setState(() {
                if (value.isEmpty) {
                  _time = -1;
                } else {
                  _time = value[0];
                }
              });
            },
            children: List.generate(2, (index) {
              return Option(
                padding: const EdgeInsets.only(top: 4, left: 4),
                defaultChild: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 1.0
                    ),
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Text(
                    index == 0 ? "평일에도 봉사할 수 있어요" : "평일에는 봉사할 수 없어요",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black
                    )
                  )
                ),
                selectedChild: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    border: Border.all(
                      color: const Color(0xfff74526),
                      width: 1
                    ),
                    color: const Color(0xfff74526)
                  ),
                  child: Text(
                    index == 0 ? "평일에도 봉사할 수 있어요" : "평일에는 봉사할 수 없어요",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white
                    )
                  )
                )
              );
            }, growable: false)
          ),
          Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            button.FilledButton(
              onClick: () {
                if (_time == -1) {
                  return;
                }
                PageRouteWithAnimation route = PageRouteWithAnimation(const Home());
                Navigator.push(
                  context,
                  route.slideRightToLeft()
                );
              },
              child: const Text("끝내기", style: TextStyle(color: Colors.white))
            ),
            const ProvideSelfAlert()
          ])),
        ],
      )
    );
  }
}
