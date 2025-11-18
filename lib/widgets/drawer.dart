// lib/widgets/drawer.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:red_sportswear/screens/menu.dart';
import 'package:red_sportswear/screens/add_product_form.dart';
import 'package:red_sportswear/screens/product_entry_list.dart';
import 'package:red_sportswear/screens/login.dart'; // Ensure this exists
import 'package:pbp_django_auth/pbp_django_auth.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF900D16)),
            child: Column(
              children: [
                Text(
                  'Red Sportswear',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  'We have the best sportswear products here!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('Product List'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductEntryListPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Add Product'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductFormPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout'),
            onTap: () async {
              try {
                // Adjust URL if your logout path differs
                final resp = await request.logout("http://localhost:8000/auth/logout/");
                // Optionally check resp content
              } catch (_) {
                // Silent fallback
              }
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                      (route) => false,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
