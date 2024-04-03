import 'package:commons/domain/entities/tabs/items_tabs_navigations.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBarMobile extends StatefulWidget {
  final Function(String) onPressed;
  final List<ItemsTabsNavigation> itemsTabs;

  const CustomBottomNavigationBarMobile(
    {super.key, required this.onPressed, required this.itemsTabs}
  );

  @override
  State<CustomBottomNavigationBarMobile> createState() => _CustomBottomNavigationBarMobileState();
}

class _CustomBottomNavigationBarMobileState extends State<CustomBottomNavigationBarMobile> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      items: getBottomTabs(widget.itemsTabs),
      currentIndex: _selectedIndex,
      selectedItemColor: colors.primary,
      unselectedItemColor: colors.secondary,
      onTap: (index) { 
        if (_selectedIndex == index) { return; }
        setState(() { _selectedIndex = index; });
        widget.onPressed(widget.itemsTabs[index].route);
      },
      type: BottomNavigationBarType.fixed
    );
  }

  List<BottomNavigationBarItem> getBottomTabs(List<ItemsTabsNavigation> tabs) {
    return tabs
        .map((item) => BottomNavigationBarItem(
            icon: item.icon,
            label: item.title,
          ),
        ).toList();
  }
}
