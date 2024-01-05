import 'package:flutter/material.dart';

class Category {
  final String title;
  final Color color1;
  final Color color2;

  Category({required this.title, required this.color1, required this.color2});
}

List<Category> listCategory = [
  Category(
      title: 'Educationn',
      color1: const Color.fromRGBO(245, 160, 24, 1),
      color2: const Color.fromRGBO(241, 56, 17, 1)),
  Category(
      title: 'Society',
      color1: const Color.fromARGB(255, 99, 90, 220),
      color2: const Color.fromARGB(255, 13, 2, 154)),
  Category(
      title: 'Sports',
      color1: const Color.fromARGB(255, 98, 226, 124),
      color2: const Color.fromARGB(255, 6, 145, 20)),
  Category(
      title: 'Films',
      color1: const Color.fromARGB(255, 241, 97, 97),
      color2: const Color.fromARGB(255, 160, 31, 5))
];
