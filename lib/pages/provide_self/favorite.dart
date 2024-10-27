import 'package:flutter/material.dart';
import 'package:soul_match/pages/components/back_arrow_template.dart';
import 'package:soul_match/pages/components/provide_self_alert.dart';
import 'package:soul_match/pages/components/title_with_sub.dart';
import 'package:soul_match/pages/provide_self/me.dart';
import '../components/buttons.dart' as button;
import '../components/option_selector.dart';
import '../components/route_animation.dart';
import '../../core/data.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return BackArrowTemplate(
        child: Column(
          children: [
            const Align(alignment: Alignment.topLeft, child: TitleWithSub(title: "선호하는 봉사활동을 알려주세요")),
            SizedBox(height: height*0.25),
            OptionSelector(
              maxSelection: 3,
              direction: Axis.horizontal,
              onItemsSelected: (value){
                setState(() {
                  selected = value.map((i)=>categories[i]).toList();
                });
              },
              children: List.generate(categories.length, (index) {
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
                      child: Text("${categories[index]} 봉사"),
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
                      child: Text("${categories[index]} 봉사", style: const TextStyle(color: Colors.white)),
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
                  PageRouteWithAnimation route = PageRouteWithAnimation(const AboutMe());
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
