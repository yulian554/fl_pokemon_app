import 'package:commons/domain/entities/tabs/items_tabs_navigations.dart';

abstract class ItemsTabsDatasource {

  Future<List<ItemsTabsNavigation>> getItems();
  
}