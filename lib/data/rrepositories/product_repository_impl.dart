

import 'package:task_futter/domain/%20Repository/product_repository.dart';

import '../../domain/models/product_model.dart';
import '../dataSource/remote/product_api.dart';
import '../models/product_dto.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApi productApi;

  ProductRepositoryImpl(this.productApi);

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      List<ProductDTO> productDtos = await productApi.fetchProducts();
      List<ProductModel> products = productDtos.map((dto) => ProductModel(
        id: dto.id,
        title: dto.title,
        description: dto.description,
        price: dto.price,
        thumbnail: dto.thumbnail,
      )).toList();
      return products;
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
