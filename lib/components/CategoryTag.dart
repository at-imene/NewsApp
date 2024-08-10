import 'package:flutter/material.dart';

class CategoryTag extends StatelessWidget {
  const CategoryTag(
      {super.key, required this.category, this.isActive = true, this.onClick});

  final String category;
  final bool isActive;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10.0),
        decoration: BoxDecoration(
            color: isActive ? Colors.blue : Colors.grey.shade200,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Text(
          '${category}',
          style: TextStyle(
              color: isActive ? Colors.white : Colors.grey,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
