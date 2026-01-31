import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_details.dart';
import 'categorycard.dart';
class ProductsGrid extends StatelessWidget {
  final List<Product> products;
  final Function(Product)? onAddToCart; // 👈 callback

  const ProductsGrid({super.key, required this.products, this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(child: Text("No products found"));
    }

    return Padding(
      padding: const EdgeInsets.all(15),
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetails(product: product),
                ),
              );
            },
            child: CategoryCard(
              imagePath: product.imageUrl,
              title: product.title,
              subtitle: product.category,
              duration: "${product.price} L.E",
              onAddToCart: () => onAddToCart?.call(product), // 👈 هنا
            ),
          );
        },
      ),
    );
  }
}
