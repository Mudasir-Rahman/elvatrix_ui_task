import 'package:elvtrix_ui_task/core/product_data_models/product.dart';

abstract class CartState{}
class CartInitialState extends CartState{}
class CartSuccessState extends CartState{
  final List<Product>cartedItem;

  CartSuccessState({required this.cartedItem});
}