import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'BLoC/product_bloc.dart';
import 'data/dataSource/remote/product_api.dart';
import 'data/rrepositories/product_repository_impl.dart';
import 'domain/useCase/get_products_usecase.dart';
import 'ui/screens/product_list_screen.dart';

void main() {
  final productApi = ProductApi(http.Client());
  final productRepository = ProductRepositoryImpl(productApi);
  final getProductsUseCase = GetProductsUseCase(productRepository);

  runApp(MyApp(getProductsUseCase: getProductsUseCase));
}

class MyApp extends StatelessWidget {
  final GetProductsUseCase getProductsUseCase;

  MyApp({required this.getProductsUseCase});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932), minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => ProductBloc(getProductsUseCase),
          child: ProductListScreen(),
        ),
      );
    });
  }
}
