import 'package:flutter/material.dart';
import 'package:red_sportswear/widgets/drawer.dart';
import 'package:form_field_validator/form_field_validator.dart';

class NewsFormPage extends StatefulWidget {
  const NewsFormPage({super.key});

  @override
  State<NewsFormPage> createState() => _NewsFormPageState();
}

class _NewsFormPageState extends State<NewsFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  final _thumbnailController = TextEditingController();

  String _name = "";
  int _price = 0;
  String _description = "";
  int _stock = 0;
  String _category = "topi";
  String _thumbnail = "";
  bool _isFeatured = false;

  final List<String> _categories = [
    'sepatu running',
    'jersey',
    'sepatu futsal',
    'topi',
    'sepatu bola',
    'celana training',
  ];

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _thumbnailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Product Form',
          ),
        ),
        backgroundColor: Color(0xFF900D16),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding( // Product Name
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Product Name",
                    labelText: "Product Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name cannot be empty!";
                    }
                    if (value.length < 3) {
                      return "Name must be at least 3 characters long!";
                    }
                    if (value.length > 100) {
                      return "Name cannot exceed 100 characters!";
                    }
                    return null;
                  },
                ),
              ),

              Padding( // Product Description
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _descriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Product Description",
                    labelText: "Product Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Description cannot be empty!";
                    }
                    if (value.length < 10) {
                      return "Description must be at least 10 characters long!";
                    }
                    if (value.length > 500) {
                      return "Description cannot exceed 500 characters!";
                    }
                    return null;
                  },
                ),
              ),

              Padding( // Product Price
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    hintText: "Product Price",
                    labelText: "Product Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value ?? '0') ?? 0;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Price cannot be empty!";
                    }
                    final parsedValue = int.tryParse(value);
                    if (parsedValue == null) {
                      return "Price must be a valid number!";
                    }
                    if (parsedValue < 0) {
                      return "Price must be a positive number!";
                    }
                    return null;
                  },
                ),
              ),

              Padding( // Product Stock
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _stockController,
                  decoration: InputDecoration(
                    hintText: "Product Stock",
                    labelText: "Product Stock",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _stock = int.tryParse(value ?? '0') ?? 0;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Stock cannot be empty!";
                    }
                    final parsedValue = int.tryParse(value);
                    if (parsedValue == null) {
                      return "Stock must be a valid number!";
                    }
                    if (parsedValue < 0) {
                      return "Stock must be a positive number!";
                    }
                    return null;
                  },
                ),
              ),

              Padding( // Category
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _category,
                  items: _categories
                      .map((cat) => DropdownMenuItem(
                    value: cat,
                    child: Text(
                        cat[0].toUpperCase() + cat.substring(1)),
                  ))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
              ),

              Padding( // Thumbnail
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _thumbnailController,
                  decoration: InputDecoration(
                    hintText: "URL Thumbnail (optional)",
                    labelText: "URL Thumbnail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: validateThumbnailUrl,
                  onChanged: (String? value) {
                    setState(() {
                      _thumbnail = value!;
                    });
                  },
                ),
              ),

              Padding( // Is Featured
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text("Mark as Featured Product"),
                  value: _isFeatured,
                  onChanged: (bool value) {
                    setState(() {
                      _isFeatured = value;
                    });
                  },
                ),
              ),

              Align( // Tombol Simpan
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF900D16),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Product successfully added!'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text('Name : $_name'),
                                    Text('Description : $_description'),
                                    Text('Price : $_price'),
                                    Text('Stock : $_stock'),
                                    Text('Category : $_category'),
                                    Text('Thumbnail : $_thumbnail'),
                                    Text(
                                        'Featured : ${_isFeatured ? "Yes" : "No"}'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      _nameController.clear();
                                      _descriptionController.clear();
                                      _priceController.clear();
                                      _stockController.clear();
                                      _thumbnailController.clear();

                                      _name = "";
                                      _price = 0;
                                      _description = "";
                                      _stock = 0;
                                      _category = "topi";
                                      _thumbnail = "";
                                      _isFeatured = false;
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        _formKey.currentState!.reset();
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
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

String? validateThumbnailUrl(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }

  Uri? uri;
  try {
    uri = Uri.parse(value);
  } catch (e) {
    return 'Please enter a valid URL';
  }

  if (!uri.hasScheme || (!uri.scheme.startsWith('http'))) {
    return 'URL must start with http:// or https://';
  }
  return null;
}
