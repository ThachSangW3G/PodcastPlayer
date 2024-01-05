import 'package:flutter/material.dart';
import 'package:podcast_player/models/category_model.dart';

class CategoryComponent extends StatefulWidget {
  final Category category;

  const CategoryComponent({super.key, required this.category});

  @override
  State<CategoryComponent> createState() => _CategoryComponentState();
}

class _CategoryComponentState extends State<CategoryComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 100,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [widget.category.color1, widget.category.color2],
              begin: Alignment.topLeft),
          borderRadius: BorderRadius.circular(10.0)),
      child: Center(
        child: Text(
          widget.category.title,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'SF Pro Display',
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
