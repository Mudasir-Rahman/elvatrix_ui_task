import 'package:elvtrix_ui_task/core/product_data_models/product.dart';

abstract class CartEvent{}
class AddItemsToCart extends CartEvent{
  final Product product;

  AddItemsToCart({required this.product});
}
class RemoveItemFromCart extends CartEvent{
  final  Product product;

  RemoveItemFromCart({required this.product});

}