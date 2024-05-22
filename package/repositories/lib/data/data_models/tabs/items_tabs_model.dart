import 'package:commons/domain/entities/tabs/items_tabs_navigations.dart';
import 'package:flutter/material.dart';

class ItemsTabsModel {
  final String title;
  final String route;
  final int index;

  final icons = <Icon>[
    const Icon(Icons.home_outlined),
    const Icon(Icons.search_rounded), 
    const Icon(Icons.favorite_border),
    const Icon(Icons.contacts), 
  ];

  ItemsTabsModel({
    required this.title,
    required this.route,
    required this.index
  });

  factory ItemsTabsModel.fromJson(Map<String, dynamic> json) =>
    ItemsTabsModel(
      title: json['title'] ?? 'no title',
      route: json['route'] ?? 0,
      index: json['index'] ?? 0,
    );

  ItemsTabsNavigation toItemTabEntity() => ItemsTabsNavigation(
    title: title,
    icon: icons[index],
    route: route
  );
}