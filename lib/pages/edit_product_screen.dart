import 'package:flutter/material.dart';
import 'package:shopping_sm_app/Providers/prodact.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    _imageFocusUrl.addListener(updateImageUrl);
    super.initState();
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
    if (!_imageFocusUrl.hasFocus)
      setState(
        () {},
      );
  }

  void _saveForm() {
    _form.currentState!.save();
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
      body: Padding(
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
                      decoration: InputDecoration(
                        labelText: "Title",
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                      onSaved: (newValue) => Product(
                        id: '',
                        title: newValue.toString(),
                        description: '',
                        imageURL: '',
                        price: 0,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Price",
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      focusNode: _priceFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_descriptionFocusNode);
                      },
                      onSaved: (newValue) => Product(
                        id: '',
                        title: '',
                        description: '',
                        imageURL: '',
                        price: double.parse(newValue.toString()),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Description",
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                      //textInputAction: TextInputAction.next,
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      focusNode: _descriptionFocusNode,
                      // onFieldSubmitted: (_) {
                      //   FocusScope.of(context).requestFocus(_imageFocusUrl);
                      // },
                      onSaved: (newValue) => Product(
                        id: '',
                        title: '',
                        description: newValue.toString(),
                        imageURL: '',
                        price: 0,
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
                            onFieldSubmitted: (_) {
                              _saveForm();
                            },
                            onSaved: (newValue) => Product(
                              id: '',
                              title: '',
                              description: '',
                              imageURL: newValue.toString(),
                              price: 0,
                            ),
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
