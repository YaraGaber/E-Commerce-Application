import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../BLoC/product_bloc.dart';
import '../../BLoC/product_event.dart';
import '../../BLoC/product_state.dart';
import '../widgets/product_list_item.dart';


class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 50),
            child: Image.asset('assets/images/Group 5.png'),
          ),
      Row(
        children: [
          SizedBox(
            height: 50.h,
            width: 348.w,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'What do you search for?',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      'assets/images/🦆 icon _search_ (2).png', // Updated path
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset('assets/images/🦆 icon _shopping cart_ (1).png'),
          )
        ],
      ),
          Expanded(
            flex: 10,
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductLoaded) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 2 / 3,
                    ),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return ProductListItem(product: state.products[index]);
                    },
                  );
                } else if (state is ProductError) {
                  return Center(child: Text(state.message));
                } else {
                  return Center(child: Text('Press the button to fetch products'));
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ProductBloc>().add(FetchProducts());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
