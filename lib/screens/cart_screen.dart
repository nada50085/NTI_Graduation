import 'package:task7/categories/totalbox.dart';
import 'package:task7/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final Function(Map<String, dynamic>)? onRemove;
  final Function(Map<String, dynamic>, int)? onQuantityChange;

  const CartScreen({
    super.key,
    required this.cartItems,
    this.onRemove,
    this.onQuantityChange,
  });

  @override
  Widget build(BuildContext context) {
    // حساب السعر الكلي
    double totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += (item['product'].price * item['quantity']);
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
  translate("cart"), // بدون const
  style: const TextStyle(
    color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  ),
),

      ),
      body: cartItems.isEmpty
          ? Center(
              child: Column(
              
                children: [
                   SizedBox(height: 220,),
                   Icon(Icons.shopping_bag_outlined,
                    size: 60, color: const Color.fromARGB(255, 132, 130, 130)),
                 SizedBox(height: 10,),
                  Text(translate(
                    "Your cart is empty"),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(bottom: 150),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                final product = item['product'] as Product;
                final quantity = item['quantity'] as int;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Card(
                    color: Theme.of(context).cardColor, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              product.imageUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Category: ${product.category}",
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontSize: 14,
                                        color: Theme.of(context).brightness == Brightness.dark
                                            ? Colors.white54
                                            : Colors.black54,
                                      ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "${product.price * quantity} L.E",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle_outline,
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white70
                                        : Colors.black),
                                onPressed: () {
                                  if (quantity > 1) {
                                    onQuantityChange?.call(item, quantity - 1);
                                  } else {
                                    onRemove?.call(item);
                                  }
                                },
                              ),
                              Text(
                                "$quantity",
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add_circle_outline,
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white70
                                        : Colors.black),
                                onPressed: () {
                                  onQuantityChange?.call(item, quantity + 1);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      bottomSheet: CartBottomSheet(
        totalPrice: totalPrice,
        onCheckout: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Proceed to Checkout")),
          );
        },
      ),
    );
  }
}
