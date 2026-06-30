import 'package:flutter/material.dart';
import 'package:titan/core/theme/brand_colors.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Total width of the screen
    double displayWidth = MediaQuery.of(context).size.width;

    // Navbar width: displayWidth - horizontal margins (20 * 2)
    // We want it floating, so we add margin.
    double navBarWidth = displayWidth - 40;

    // We have 4 items
    double itemWidth = navBarWidth / 4;

    // Bubble dimensions
    double bubbleWidth = 50.0;
    double bubbleHeight = 50.0;

    return Container(
      height: 100, // Height of the area including bottom padding/margin
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
      ), // Floating margin
      color:
          Colors.transparent, // Transparent to let body show through if needed
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Moving Bubble
            AnimatedPositionedDirectional(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutBack,
              start:
                  (selectedIndex * itemWidth) + (itemWidth - bubbleWidth) / 2,
              top: (65 - bubbleHeight) / 2,
              child: Container(
                width: bubbleWidth,
                height: bubbleHeight,
                decoration: BoxDecoration(
                  gradient: BrandColors.blueGreenGradient,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: BrandColors.mediumBlue.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
            // Icons Layer
            Row(
              children: [
                _navItem(Icons.grid_view, 0, itemWidth, "Dashboard"),
                _navItem(Icons.assignment_outlined, 1, itemWidth, "Reports"),
                _navItem(Icons.map_outlined, 2, itemWidth, "Map"),
                _navItem(Icons.settings_outlined, 3, itemWidth, "Settings"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, int index, double width, String label) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        onItemSelected(index);
      },
      child: Container(
        width: width,
        height: 65,
        color: Colors.transparent, // Hit test behavior
        child: Tooltip(
          message: label,
          child: Icon(
            icon,
            color: isSelected ? Colors.white : Colors.grey.shade400,
            size: 28,
          ),
        ),
      ),
    );
  }
}
