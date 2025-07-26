import 'package:elvtrix_ui_task/core/product_data_models/product.dart';

abstract class WishListState {}
class WishListInitialState extends WishListState{}
class  WishListSuccessState extends WishListState{
  final List<Product>wishListItems;

  WishListSuccessState({required this.wishListItems});
}