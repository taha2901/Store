// import 'package:store/helper/api.dart';
// import 'package:store/model/product_model.dart';

// class AllProductsService {
//   Future<List<ProductModel>> getAllProducts() async {
//     List<dynamic> data =
//         await Api().get(url: 'https://fakestoreapi.com/products');

//     List<ProductModel> productsList = [];
//     for (int i = 0; i < data.length; i++) {
//       productsList.add(
//         ProductModel.fromJson(data[i]),
//       );
//     }
//     return productsList;
//   }
// }

import 'package:dio/dio.dart';
import 'package:store/model/product_model.dart';

class AllProductServices {
  Dio dio = Dio();
  Future<List<ProductModel>> getAllProduct() async {
    try {
      Response response = await dio.get('https://fakestoreapi.com/products');
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        List<ProductModel> productsList = [];
        for (int i = 0; i < jsonData.length; i++) {
          productsList.add(ProductModel.fromJson(
            jsonData[i],
          ));
        }
        return productsList;
      } else {
        throw Exception(
            'there is a problem with status code ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch products');
    }
  }
}
