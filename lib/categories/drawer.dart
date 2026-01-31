import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  final Function(int) onSelectItem;

  const HomeDrawer({super.key, required this.onSelectItem});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: const Color.fromARGB(255, 110, 48, 246),
            ),
            child: Row(
              children: const [
                Icon(Icons.shopping_bag_outlined,
                    size: 50, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  "Welcome to noon",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              onSelectItem(0); // Home
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 10,),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () {
              // ممكن تضيفي صفحة Profile بعدين
              Navigator.pop(context);
            },
          ),
           SizedBox(height: 10,),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              onSelectItem(2); // Settings
              Navigator.pop(context);
            },
          ),
           SizedBox(height: 10,),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text("Categories"),
            onTap: () {
              // ممكن تضيفي صفحة Categories بعدين
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
