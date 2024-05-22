import 'package:repositories/shared/data/mock_items_tabs.dart';
import 'package:repositories/data/data_models/tabs/items_tabs_model.dart';
import 'package:commons/domain/entities/tabs/items_tabs_navigations.dart';
import 'package:repositories/data/data_source/tabs/items_tabs_datasource.dart';

class ItemsTabsDatasourceImpl implements ItemsTabsDatasource {
  @override
  Future<List<ItemsTabsNavigation>> getItems() async {
    // await Future.delayed(const Duration(seconds: 1));
    final List<ItemsTabsNavigation> newItemsTabs = mockItemsTabs
        .map((item) => ItemsTabsModel.fromJson(item).toItemTabEntity())
        .toList();
    return newItemsTabs;
  }
}
