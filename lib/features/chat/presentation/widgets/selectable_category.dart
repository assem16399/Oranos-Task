import 'package:flutter/material.dart';

import 'checked_icon.dart';
import 'unchecked_icon.dart';

class SelectableCategory extends StatefulWidget {
  const SelectableCategory({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  final String categoryName;

  @override
  State<SelectableCategory> createState() => _SelectableCategoryState();
}

class _SelectableCategoryState extends State<SelectableCategory> {
  var _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  _isSelected = !_isSelected;
                });
              },
              child: _isSelected ? const CheckedIcon() : const UncheckedIcon()),
          const SizedBox(width: 5),
          Text(widget.categoryName)
        ],
      ),
    );
  }
}
