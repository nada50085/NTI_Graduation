import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController searchController;
  final VoidCallback onCartPressed;
  final int cartCount;

  const HomeAppBar({
    super.key,
    required this.searchController,
    required this.onCartPressed,
    required this.cartCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: theme.primaryColor,
      centerTitle: true,
      title: const Text(
        'Trendify',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          padding: const EdgeInsets.only(right: 20),
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                Icons.shopping_cart,
                size: 30,
                color: theme.brightness == Brightness.dark ? Colors.white70 : Colors.black,
              ),
              if (cartCount > 0)
                Positioned(
                  right: -6,
                  top: -6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      '$cartCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          onPressed: onCartPressed,
        ),
      ],
      bottom: PreferredSize(
  preferredSize: const Size.fromHeight(60),
  child: Padding(
    padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: theme.inputDecorationTheme.fillColor, // اللون حسب الثيم
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText:translate( "Search about..."),
            prefixIcon: Icon(
              Icons.search,
              color: theme.inputDecorationTheme.prefixIconColor,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 10), // يحافظ على ارتفاع ثابت
          ),
        ),
      ),
    ),
  ),
),

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 60);
}
