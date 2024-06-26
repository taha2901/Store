import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/components/custom_text_field.dart';
import 'package:store/model/product_model.dart';
import 'package:store/components/custom_buttom.dart';
import 'package:store/services/update_product.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = "update product";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? image, desc, productName;

  String? price;

  bool? isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productt = ModalRoute.of(context)!.settings.arguments
        as ProductModel; 
    return ModalProgressHUD(
      inAsyncCall: isLoading!,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Update Product",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomField(
                  onChange: (data) {
                    productName = data;
                  },
                  hint: "Product Name",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomField(
                  onChange: (data) {
                    desc = data;
                  },
                  hint: "Desciption",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomField(
                  onChange: (data) {
                    price = data;
                  },
                  inputType: TextInputType.number,
                  hint: "Price",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomField(
                  onChange: (data) {
                    image = data;
                  },
                  hint: "Image",
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: "Update",
                  color: Colors.blue,
                  colorText: Colors.white,
                  onTap: () async {
                    isLoading = true;   
                    setState(() {});
                    try {
                      await updateProduct(productt);
                      print('success');
                    } on Exception catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel productt) async {
    await UpdateProductService().updateProduct(
      id: productt.id,
        title: productName==null?productt.title : productName!,
        price: price==null?productt.price.toString():price!,
        desc: desc==null?productt.description:desc!,
        image: image==null?productt.image:image!,
        category: productt.category);
  }
}
