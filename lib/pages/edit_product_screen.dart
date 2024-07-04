import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_sm_app/Providers/prodact.dart';
import 'package:shopping_sm_app/Providers/product_providers.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
  static const routeName = 'edit-product-screen';
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageFocusUrl = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editProduct = Product(
    id: '',
    title: '',
    description: '',
    imageURL: '',
    price: 0,
  );
  var initValue = {
    "title": "",
    "description": "",
    "price": "",
    "imageURL": "",
  };
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    _imageFocusUrl.addListener(updateImageUrl);
    super.initState();
  }

  void didChangeDependencies() {
    if (_isInit) {
      // to check only runs this code onec since didChan... runs multiple times
      final productId =
          ModalRoute.of(context)!.settings.arguments; // extracting the id
      // find the above Id from the provider
      if (productId != null) {
        // to check if it is not new product
        _editProduct =
            Provider.of<ProductProvider>(context).findId(productId.toString());
        initValue = {
          "title": _editProduct.title,
          "description": _editProduct.description,
          "price": _editProduct.price.toString(),
          //"imageurl": _editProduct.imageURL
          "imageURL": ""
        };
        _imageUrlController.text = _editProduct.imageURL;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void dispose() {
    _imageFocusUrl.removeListener(updateImageUrl);
    _descriptionFocusNode.dispose();
    _priceFocusNode.dispose();
    _imageUrlController.dispose();
    _imageFocusUrl.dispose();

    super.dispose();
  }

  void updateImageUrl() {
    if (!_imageFocusUrl.hasFocus) {
      if ((!_imageUrlController.text.startsWith("http") &&
              !_imageUrlController.text.startsWith("https")) ||
          (!_imageUrlController.text.endsWith("jpg") &&
              !_imageUrlController.text.endsWith("png") &&
              !_imageUrlController.text.endsWith("jpeg"))) {
        return;
      }
      setState(
        () {},
      );
    }
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    setState(() {
      _isLoading = true;
    });

    _form.currentState!.save();
    if (_editProduct.id != '') {
      try {
        await Provider.of<ProductProvider>(context, listen: false)
            .updateProduct(_editProduct.id, _editProduct);
      } catch (error) {
        await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: const Text("An error has been ocurred"),
                  content: Text(error.toString()),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: const Text("Close"))
                  ],
                ));
      }

      // setState(() {
      //   _isLoading = false;
      // });
      // Navigator.of(context).pop();
    } else {
      try {
        await Provider.of<ProductProvider>(context, listen: false)
            .addProduct(_editProduct);
      } catch (error) {
        await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: const Text("An error has been ocurred"),
                  content: Text(error.toString()),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: const Text("Close"))
                  ],
                ));
        // } finally {
        //   setState(() {
        //     _isLoading = false;
        //   });
        //   Navigator.of(context).pop();
        // }
      }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Producit",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: _saveForm,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
              child: Form(
                  key: _form,
                  child: Card(
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: ListView(
                        children: [
                          TextFormField(
                            initialValue: initValue["title"],
                            decoration: InputDecoration(
                              labelText: "Title",
                              labelStyle:
                                  Theme.of(context).textTheme.bodyMedium,
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_priceFocusNode);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter a title";
                              }
                              //return ;
                            },
                            onSaved: (newValue) => _editProduct = Product(
                              id: _editProduct.id,
                              isFavorite: _editProduct.isFavorite,
                              title: newValue as String,
                              description: _editProduct.description,
                              imageURL: _editProduct.imageURL,
                              price: _editProduct.price,
                            ),
                          ),
                          TextFormField(
                            initialValue: initValue["price"],
                            decoration: InputDecoration(
                              labelText: "Price",
                              labelStyle:
                                  Theme.of(context).textTheme.bodyMedium,
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            focusNode: _priceFocusNode,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_descriptionFocusNode);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter a price";
                              }
                              if (double.tryParse(value) == null) {
                                return "Please enter a valid price.";
                              }
                              if (double.parse(value) <= 0) {
                                return "Please enter a price greater than 0";
                              }
                              //return null;
                            },
                            onSaved: (newValue) => _editProduct = Product(
                              id: _editProduct.id,
                              isFavorite: _editProduct.isFavorite,
                              title: _editProduct.title,
                              description: _editProduct.description,
                              imageURL: _editProduct.imageURL,
                              price: double.parse(newValue as String),
                            ),
                          ),
                          TextFormField(
                            initialValue: initValue["description"],
                            decoration: InputDecoration(
                              labelText: "Description",
                              labelStyle:
                                  Theme.of(context).textTheme.bodyMedium,
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                            //textInputAction: TextInputAction.next,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            focusNode: _descriptionFocusNode,
                            // onFieldSubmitted: (_) {
                            //   FocusScope.of(context).requestFocus(_imageFocusUrl);
                            // },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter a a description";
                              }
                              if (value.length < 10) {
                                return "description should be at list 10 charactors ";
                              }
                            },
                            onSaved: (newValue) => _editProduct = Product(
                              id: _editProduct.id,
                              isFavorite: _editProduct.isFavorite,
                              title: _editProduct.title,
                              description: newValue as String,
                              imageURL: _editProduct.imageURL,
                              price: _editProduct.price,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                margin: const EdgeInsets.only(top: 8, right: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                )),
                                child: _imageUrlController.text.isEmpty
                                    ? Text("Image url")
                                    : Image.network(
                                        _imageUrlController.text,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Image url",
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  keyboardType: TextInputType.url,
                                  textInputAction: TextInputAction.done,
                                  focusNode: _imageFocusUrl,
                                  controller: _imageUrlController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter a url.";
                                    }
                                    if (!value.startsWith("http") ||
                                        !value.startsWith("https")) {
                                      return "Please enter a valid url.";
                                    }

                                    if (!value.endsWith(".jpg") &&
                                        !value.endsWith(".jpeg") &&
                                        !value.endsWith(".png")) {
                                      return "The image must be one of png,jpg or jpeg";
                                    }
                                    //return null;
                                  },
                                  onSaved: (newValue) => _editProduct = Product(
                                    id: _editProduct.id,
                                    isFavorite: _editProduct.isFavorite,
                                    title: _editProduct.title,
                                    description: _editProduct.description,
                                    imageURL: newValue.toString(),
                                    price: _editProduct.price,
                                  ),
                                  onFieldSubmitted: (_) {
                                    _saveForm();
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
            ),
    );
  }
}
