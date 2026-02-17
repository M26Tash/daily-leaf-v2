import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/constants/app_dimensions.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';

class CustomNavPanel extends StatelessWidget {
  final int selectedIndex;
  final List<NavPanelItem> items;
  final ValueChanged<int>? onIndexChanged;

  const CustomNavPanel({
    required this.selectedIndex,
    required this.items,
    required this.onIndexChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimensions.superLarge,
        vertical: AppDimensions.large,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.large,
      ),
      height: kBottomNavigationBarHeight,
      decoration: BoxDecoration(
        color: context.theme.accentColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.large,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var index = 0; index < items.length; index++)
            _NavPanelItem(
              itemIndex: index,
              selectedIndex: selectedIndex,
              item: items[index],
              onIndexChanged: onIndexChanged,
            ),
        ],
      ),
    );
  }
}

class _NavPanelItem extends StatelessWidget {
  final int itemIndex;
  final int selectedIndex;
  final NavPanelItem item;
  final ValueChanged<int>? onIndexChanged;

  const _NavPanelItem({
    required this.itemIndex,
    required this.selectedIndex,
    required this.item,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    const selectedIconScale = 1.2;
    const unselectedIconScale = 1.0;

    final activeColor = context.theme.primaryColor;
    final inactiveColor = context.theme.backgroundColor.withValues(
      alpha: 0.6,
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onIndexChanged?.call(itemIndex),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.medium),
        child: Column(
          children: [
            AnimatedScale(
              scale: itemIndex == selectedIndex
                  ? selectedIconScale
                  : unselectedIconScale,
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              child: Icon(
                item.icon,
                color: itemIndex == selectedIndex ? activeColor : inactiveColor,
                size: AppDimensions.panelNavigationIconSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class NavPanelItem {
  final IconData icon;

  const NavPanelItem({
    required this.icon,
  });
}
