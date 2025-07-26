import 'package:elvtrix_ui_task/core/product_data_models/product.dart';

abstract class WishListEvent{}
class AddToWishListEvent extends WishListEvent{
  final Product product ;

  AddToWishListEvent({required this.product});
}
class RemoveFromWishList extends WishListEvent{
  final Product product;
  RemoveFromWishList({ required this.product});
}