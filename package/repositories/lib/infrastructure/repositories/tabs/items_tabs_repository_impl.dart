
import 'package:commons/domain/entities/tabs/items_tabs_navigations.dart';
import 'package:repositories/domain/datasources/tabs/items_tabs_datasource.dart';
import 'package:repositories/domain/repositories/tabs/items_tabs_repository.dart';

class ItemsTabsRepositoryImpl implements ItemsTabsRepository {

  final ItemsTabsDatasource datasource;

  ItemsTabsRepositoryImpl({
    required this.datasource
  });

  @override
  Future<List<ItemsTabsNavigation>> getItems() async {
    return datasource.getItems();
  }


}