import 'package:flutter/material.dart';
import 'package:red_sportswear/models/product_entry.dart';
import 'package:red_sportswear/widgets/drawer.dart';
import 'package:red_sportswear/screens/product_detail.dart';
import 'package:red_sportswear/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  const ProductEntryListPage({super.key});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  bool _showOnlyUserItems = false;

  Future<List<ProductEntry>> fetchProduct(CookieRequest request, bool filterByUser) async {
    final url = filterByUser
        ? 'http://localhost:8000/show-product-user/'
        : 'http://localhost:8000/json/';

    final response = await request.get(url);
    var data = response;

    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List',
          style: TextStyle(
            fontSize: 23,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          // Filter button section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _showOnlyUserItems = !_showOnlyUserItems;
                    });
                  },
                  icon: Icon(
                    _showOnlyUserItems ? Icons.filter_alt : Icons.filter_alt_off_outlined,
                  ),
                  label: Text(
                    _showOnlyUserItems ? 'Show All Items' : 'Show My Items Only',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _showOnlyUserItems
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey.shade300,
                    foregroundColor: _showOnlyUserItems
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          // Product list section
          Expanded(
            child: FutureBuilder(
              future: fetchProduct(request, _showOnlyUserItems),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(
                      'There are no products to display.',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => ProductEntryCard(
                      product: snapshot.data![index],
                      onTap: () {
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
