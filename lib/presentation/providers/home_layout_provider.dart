import 'package:flutter/material.dart';

import 'package:commons/domain/entities/tabs/items_tabs_navigations.dart';
import 'package:repositories/domain/repositories/tabs/items_tabs_repository.dart';
import 'package:repositories/infrastructure/datasource/tabs/items_tabs_datasource_impl.dart';
import 'package:repositories/infrastructure/repositories/tabs/items_tabs_repository_impl.dart';

class HomeLayoutProvider extends ChangeNotifier {

  List<ItemsTabsNavigation> items = [];
  ItemsTabsRepository? repository;

  HomeLayoutProvider({ this.repository }) {
    repository = ItemsTabsRepositoryImpl(datasource: ItemsTabsDatasourceImpl());
  }

  Future<void> getItemsTabs() async {
    final newItems = await repository?.getItems();
    items = newItems ?? [];
    notifyListeners();
  }
}
