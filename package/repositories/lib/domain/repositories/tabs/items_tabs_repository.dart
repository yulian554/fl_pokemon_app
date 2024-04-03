import 'package:commons/domain/entities/tabs/items_tabs_navigations.dart';

abstract class ItemsTabsRepository {

  Future<List<ItemsTabsNavigation>> getItems();
  
}