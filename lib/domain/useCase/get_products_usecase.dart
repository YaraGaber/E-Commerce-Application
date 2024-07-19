

import '../ Repository/product_repository.dart';
import '../models/product_model.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<ProductModel>> call() {
    return repository.getProducts();
  }
}
