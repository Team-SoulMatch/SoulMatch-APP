import 'package:flutter/material.dart';
import 'package:soul_match/pages/components/back_arrow_template.dart';
import 'package:soul_match/pages/components/provide_self_alert.dart';
import 'package:soul_match/pages/components/title_with_sub.dart';
import 'package:soul_match/pages/provide_self/experience.dart';
import '../components/buttons.dart' as button;
import '../components/option_selector.dart';
import '../components/route_animation.dart';

const List<String> options = [
  "활동적인",
  "섬세한",
  "외향적",
  "내향적",
  "책임감",
  "친절한"
];

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return BackArrowTemplate(
      child: Column(
        children: [
          const Align(alignment: Alignment.topLeft, child: TitleWithSub(title: "자신을 나타내는\n키워드를 알려주세요")),
          SizedBox(height: height*0.25),
          OptionSelector(
            maxSelection: 3,
            direction: Axis.horizontal,
            onItemsSelected: (value){
              setState(() {
                selected = value.map((i)=>options[i]).toList();
              });
            },
            children: List.generate(options.length, (index) {
              return Option(
                padding: const EdgeInsets.only(top: 4, left: 4),
                defaultChild: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    border: Border.all(
                      color: const Color(0xfff74526),
                      width: 2
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(options[index]),
                  )
                ),
                selectedChild: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    border: Border.all(
                      color: const Color(0xfff74526),
                      width: 2
                    ),
                    color: const Color(0xfff74526)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(options[index], style: const TextStyle(color: Colors.white)),
                  )
                )
              );
            }, growable: false)
          ),
          Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            button.FilledButton(
              onClick: () {
                if (selected.isEmpty) {
                  return;
                }
                PageRouteWithAnimation route = PageRouteWithAnimation(const Experience());
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
