import 'package:flutter/material.dart';
import 'package:soul_match/pages/components/back_arrow_template.dart';
import 'package:soul_match/pages/components/provide_self_alert.dart';
import 'package:soul_match/pages/components/title_with_sub.dart';
import 'package:soul_match/pages/provide_self/favorite.dart';
import '../components/buttons.dart' as button;
import '../components/route_animation.dart';
import '../../core/data.dart';

class Local extends StatefulWidget {
  const Local({super.key});

  @override
  State<Local> createState() => _LocalState();
}

class _LocalState extends State<Local> {
  String selected = "";

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return BackArrowTemplate(
      child: Column(
        children: [
          const Align(alignment: Alignment.topLeft, child: TitleWithSub(title: "봉사활동을 할 지역을 알려주세요")),
          SizedBox(height: height*0.25),
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue value) {
              if (value.text.isEmpty) {
                return locals.where((_)=>true);
              }
              setState(() {
                selected = "";
              });
              return locals.where((item) {
                return item.startsWith(value.text);
              });
            },
            optionsViewBuilder: (context, onSelected, options) {
              return SingleChildScrollView(child: SizedBox(height: 100, child: ListView(
                children: options
                .map((s){
                  return GestureDetector(
                    onTap: ()=>onSelected(s),
                    child: Padding(padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 7), child: Text(s))
                  );
                }).toList()
              )));
            },
            fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
              return Padding(padding: const EdgeInsets.only(left: 20, right: 20), child: TextField(
                controller: textEditingController,
                focusNode: focusNode,
                decoration: const InputDecoration(
                  labelText: "여기에 지역을 입력하세요",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF74526), width: 2)
                  )
                ),
                onSubmitted: (_)=>onFieldSubmitted,
              ));
            },
            onSelected: (item){
              setState(() {
                selected = item;
              });
            }
          ),
          Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            button.FilledButton(
              onClick: () {
                if (selected.isEmpty) {
                  return;
                }
                PageRouteWithAnimation route = PageRouteWithAnimation(const Favorite());
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
