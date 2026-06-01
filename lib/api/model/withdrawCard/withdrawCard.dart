import 'package:flutter/material.dart';

class Tag {
  final String name;
  final Color backgroundColor;
  final Color textColor;

  const Tag({
    required this.name,
    this.backgroundColor = const Color(0xFFF0F0F0),
    this.textColor = Colors.black54,
  });
}

class WithdrawCard {

  final String title;
  final String description;
  final List<Tag> tags;
  final String imageUrl;

  const WithdrawCard({
    this.title = "",
    this.description = "",
    this.tags = const [],
    this.imageUrl = "",
  });
}