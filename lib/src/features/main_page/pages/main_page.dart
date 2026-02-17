import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/shared_providers/navigation_panel_provider/navigation_panel_provider.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';
import 'package:daily_leaf/src/common/widgets/custom_nav_panel/custom_nav_panel.dart';
import 'package:daily_leaf/src/features/main_page/widgets/main_body_selector.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    final initialPage = context.read<NavigationPanelProvider>().navigationIndex;
    _pageController = PageController(initialPage: initialPage);
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<NavigationPanelProvider>();
    final currentIndex = navProvider.navigationIndex;

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: MainBodySelector(
        pageController: _pageController,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomNavPanel(
        selectedIndex: currentIndex,
        items: [
          NavPanelItem(
            icon: Icons.auto_awesome_mosaic_rounded,
          ),
          NavPanelItem(
            icon: Icons.bookmarks_rounded,
          ),
          NavPanelItem(
            icon: Icons.settings_suggest_rounded,
          ),
        ],
        onIndexChanged: (index) {
          navProvider.updateNavigationIndex(
            index,
          );
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
