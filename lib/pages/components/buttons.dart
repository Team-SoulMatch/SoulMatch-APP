import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onClick;
  final EdgeInsets padding;
  final Color color;

  const FilledButton({super.key, required this.child, required this.onClick, this.padding = EdgeInsets.zero, this.color = const Color(0xfff74526)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: padding == EdgeInsets.zero ?
      Container(
        width: 280,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: color
        ),
        child: Center(child: child)
      ) :
      Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: color
        ),
        child: Center(child: child)
      )
    );
  }
}

class OutlinedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onClick;
  final EdgeInsets? padding;

  const OutlinedButton({super.key, required this.child, required this.onClick, this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: padding == EdgeInsets.zero ?
      Container(
        width: 280,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: const Color(0xfff74526),
            width: 2
          )
        ),
        child: Center(child: child)
      ) :
      Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: const Color(0xfff74526),
            width: 2
          )
        ),
        child: Center(child: child)
      )
    );
  }
}
