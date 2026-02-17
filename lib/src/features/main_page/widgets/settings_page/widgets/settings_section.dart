import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/constants/app_dimensions.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';

class SettingsSection extends StatelessWidget {
  final String? title;
  final List<SettingsItem> items;

  const SettingsSection({
    super.key,
    this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              bottom: 8,
              top: 16,
            ),
            child: Text(
              title!.toUpperCase(),
              style: context.themeData.textTheme.labelLarge?.copyWith(
                color: context.theme.secondaryTextColor,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        Container(
          decoration: BoxDecoration(
            color: context.theme.surfaceColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(
              AppDimensions.largeBorderRadius,
            ),
          ),
          child: Column(
            children: List.generate(items.length, (index) {
              final isLast = index == items.length - 1;
              return Column(
                children: [
                  _SettingsItem(item: items[index]),
                  if (!isLast)
                    Divider(
                      height: 1,
                      indent: 56,
                      endIndent: 16,
                      color: context.theme.surfaceColor.withValues(
                        alpha: 0.1,
                      ),
                    ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final SettingsItem item;

  const _SettingsItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: item.onTap,
      leading: Icon(
        item.icon,
        color: context.theme.primaryColor,
      ),
      title: Text(
        item.title,
        style: context.themeData.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: context.theme.primaryTextColor,
        ),
      ),
      trailing:
          item.trailing ??
          Icon(
            Icons.chevron_right_rounded,
            color: context.theme.secondaryTextColor,
          ),
    );
  }
}

final class SettingsItem {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;

  SettingsItem({
    required this.icon,
    required this.title,
    this.onTap,
    this.trailing,
  });
}
