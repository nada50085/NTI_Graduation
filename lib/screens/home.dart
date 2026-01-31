import 'package:task7/categories/appbar.dart';
import 'package:task7/categories/build_product.dart';
import 'package:task7/categories/drawer.dart';
import 'package:task7/screens/settings.dart';
import 'package:flutter/material.dart';
import 'cart_screen.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Product>> _futureProducts;
   late List<Product> allProducts; // قائمة كاملة
  List<Product> filteredProducts = [];
  int _currentIndex = 0; 
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> cartItems = [];

  @override
  void initState() {
    super.initState();
    _futureProducts = ApiService.fetchProducts().then((products) {
      allProducts = products;
      filteredProducts = List.from(allProducts); // اولًا كل المنتجات
      return products;
    });

    _searchController.addListener(_filterProducts);
  }

  void addToCart(Product product) {
    setState(() {
      final existing = cartItems.indexWhere(
        (item) => item['product'].title == product.title,
      );
      if (existing >= 0) {
        cartItems[existing]['quantity'] += 1;
      } else {
        cartItems.add({"product": product, "quantity": 1});
      }
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text("${product.title} added to cart")),
      // );
    });
  }
void _filterProducts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredProducts = allProducts
          .where((product) => product.title.toLowerCase().startsWith(query))
          .toList();
    });
  }
  void removeFromCart(Map<String, dynamic> item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  void updateQuantity(Map<String, dynamic> item, int quantity) {
    setState(() {
      final index = cartItems.indexOf(item);
      if (index >= 0) {
        cartItems[index]['quantity'] = quantity;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      Column(
        children: [
          Expanded(
            child:FutureBuilder<List<Product>>(
  future: _futureProducts,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text(snapshot.error.toString()));
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const Center(child: Text("No products found"));
    }
    // بدل ما نستخدم snapshot.data مباشرة
    return ProductsGrid(
      products: filteredProducts,
      onAddToCart: addToCart,
    );
  },
),

          ),
        ],
      ),
      CartScreen(
        cartItems: cartItems,
        onRemove: removeFromCart,
        onQuantityChange: updateQuantity,
      ),
      const SettingsScreen(),
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _currentIndex == 0
    ? HomeAppBar(
        searchController: _searchController,
        cartCount: cartItems.length, 
        onCartPressed: () {
          setState(() {
            _currentIndex = 1;
          });
        },
      )
    : null,

        drawer: HomeDrawer(
          onSelectItem: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
