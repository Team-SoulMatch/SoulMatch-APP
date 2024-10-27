import 'package:flutter/material.dart';

class OptionSelector extends StatefulWidget {
  final List<Option> children;
  final void Function(List<int> selectedIndices)? onItemsSelected;
  final int maxSelection;
  final Axis direction;

  const OptionSelector({
    super.key,
    required this.children,
    this.onItemsSelected,
    this.direction = Axis.vertical,
    this.maxSelection = -1
  });

  @override
  OptionSelectorState createState() => OptionSelectorState();
}

class OptionSelectorState extends State<OptionSelector> {
  List<int> _selectedIndices = [];

  void _toggleSelectedIndex(int index) {
    setState(() {
      if (widget.maxSelection == 1) {
        if (_selectedIndices.contains(index)) {
          _selectedIndices.clear();
        } else {
          _selectedIndices = [index];
        }
      } else {
        if (_selectedIndices.contains(index)) {
          _selectedIndices.remove(index);
        } else if (widget.maxSelection > _selectedIndices.length) {
          _selectedIndices.add(index);
        }
      }
    });
    if (widget.onItemsSelected != null) {
      widget.onItemsSelected!(_selectedIndices);
    }
  }

  List<int> get selectedIndices => _selectedIndices;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: widget.direction,
      children: List.generate(widget.children.length, (index) {
        bool isSelected = _selectedIndices.contains(index);
        return GestureDetector(
          onTap: () => _toggleSelectedIndex(index),
          child: isSelected
            ? widget.children[index].selectedChild
            : widget.children[index].defaultChild,
        );
      })
    );
  }
}

class Option extends StatelessWidget {
  late final Widget defaultChild;
  late final Widget selectedChild;

  Option({super.key, required Widget defaultChild, required Widget selectedChild, required EdgeInsetsGeometry padding}){
    this.defaultChild = Padding(
      padding: padding,
      child: defaultChild
    );
    this.selectedChild = Padding(
      padding: padding,
      child: selectedChild,
    );
  }

  @override
  Widget build(BuildContext context) {
    return defaultChild;
  }
}