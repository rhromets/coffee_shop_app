import 'package:flutter/material.dart';

@immutable
class Coffee {
  final String id;
  final String imageUrl;
  final String name;
  final String cardSubtitle;
  final String price;
  final String raiting;
  final String description;

  const Coffee({
    required this.id,
    required this.imageUrl,
    this.name = '',
    this.cardSubtitle = '',
    this.price = '',
    this.raiting = '',
    this.description = '',
  });

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      id: json['id'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      cardSubtitle: json['card_subtitle'],
      price: json['price'],
      raiting: json['raiting'],
      description: json['description'],
    );
  }
}
