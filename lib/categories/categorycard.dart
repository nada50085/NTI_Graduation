import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String duration;
  final VoidCallback? onAddToCart;

  const CategoryCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.duration,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        width: 100,
        height: 220,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: imagePath.startsWith('http')
                    ? Image.network(
                        imagePath,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        imagePath,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
              ),
            ),
            const SizedBox(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(translate(
                title),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium?.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(translate(
                subtitle),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(translate(
                    " $duration"),
                    style: theme.textTheme.titleMedium?.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle_outline, size: 25, color: theme.brightness == Brightness.dark ? Colors.white70 : Colors.black),
                    onPressed: onAddToCart,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
