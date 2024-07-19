import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/product_dto.dart';

class ProductApi {
  final http.Client client;

  ProductApi(this.client);

  Future<List<ProductDTO>> fetchProducts() async {
    final response = await client.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body)['products'];
      List<ProductDTO> products = jsonList.map((e) => ProductDTO.fromJson(e)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
