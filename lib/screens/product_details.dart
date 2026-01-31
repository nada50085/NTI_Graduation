import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: theme.primaryColor,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.75,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: theme.cardColor, // ✅ اللون حسب الثيم
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ---------- الصورة ----------
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    product.imageUrl,
                    height: 250,
                    width: 250,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              /// ---------- الاسم ----------
              Text(
                product.title,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              /// ---------- السعر ----------
              Text(
                "${product.price} L.E",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple, // ممكن نخليه ثابت عشان يبان
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 12),

              /// ---------- الكاتيجوري ----------
              Text(
                "Category: ${product.category}",
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16),
              ),

              const SizedBox(height: 12),

              /// ---------- الوصف ----------
              Text(
                "Description",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    "No description available",
                    style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
