import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/core/theme/app_colors.dart';

class App extends StatelessWidget {
  const new({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      floatingActionButtonLocation: .centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        tooltip: 'Add new',
        elevation: 0,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisSize: .min,
          mainAxisAlignment: .spaceBetween,
          children: [
            _buildTabItem(
              unselectedIcon: Icons.dashboard_outlined,
              selectedIcon: Icons.dashboard_rounded,
              label: 'Home',
              index: 0,
              onPressed: _onTap,
            ),
            _buildTabItem(
              unselectedIcon: Icons.receipt_long_outlined,
              selectedIcon: Icons.receipt_long_rounded,
              label: 'Transactions',
              index: 1,
              onPressed: _onTap,
            ),
            _buildTabItem(
              unselectedIcon: Icons.bar_chart_outlined,
              selectedIcon: Icons.bar_chart_rounded,
              label: 'Reports',
              index: 2,
              onPressed: _onTap,
            ),
            _buildTabItem(
              unselectedIcon: Icons.person_outlined,
              selectedIcon: Icons.person_rounded,
              label: 'Profile',
              index: 3,
              onPressed: _onTap,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required IconData unselectedIcon,
    required IconData selectedIcon,
    required String label,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    final isSelected = navigationShell.currentIndex == index;
    Color color = isSelected ? AppColors.primary : AppColors.textMuted;
    IconData icon = isSelected ? selectedIcon : unselectedIcon;
    return Expanded(
      child: SizedBox(
        child: InkResponse(
          radius: 30,
          onTap: () => onPressed(index),
          child: Column(
            mainAxisSize: .min,
            mainAxisAlignment: .center,
            children: [
              Icon(icon, size: 24, color: color),
              Text(
                label,
                style: TextStyle(color: color, fontWeight: .bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
