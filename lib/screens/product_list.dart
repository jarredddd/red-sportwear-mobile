// Dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:red_sportswear/models/product_entry.dart';
import 'package:red_sportswear/widgets/product_entry_card.dart';
import 'package:red_sportswear/widgets/drawer.dart';
import 'package:red_sportswear/screens/product_detail.dart';

class ProductListPage extends StatefulWidget {
  final bool mineOnly;
  const ProductListPage({super.key, required this.mineOnly});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late Future<List<ProductEntry>> _future;

  Future<List<ProductEntry>> _load(CookieRequest request) async {
    final url = widget.mineOnly
        ? "http://localhost:8000/show-json/mine/"
        : "http://localhost:8000/show-json/";
    final resp = await request.get(url);
    // resp is a List<dynamic> already; encode/decode to reuse existing parser
    return productEntryFromJson(const JsonEncoder().convert(resp));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final request = context.read<CookieRequest>();
    _future = _load(request);
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.mineOnly ? "My Products" : "All Products";
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
          style: const TextStyle(
            fontSize: 23,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder<List<ProductEntry>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Column(
                children: [
                  Text(
                    'There are no products in Red Sportswear yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductEntryCard(
                  product: snapshot.data![index],
                  onTap: () {
                    // Navigate to product detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}
