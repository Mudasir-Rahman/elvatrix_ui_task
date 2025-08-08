import 'package:elvtrix_ui_task/blocs/cart/cart_event.dart';
import 'package:elvtrix_ui_task/blocs/cart/cart_state.dart';
import 'package:elvtrix_ui_task/core/product_data_models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartListBloc extends Bloc<CartEvent, CartState> {
  final List<Product> cartListItem = [];

  CartListBloc():super(CartInitialState()) {
    on<AddItemsToCart>((event, emit) {
      if (!cartListItem.contains(event.product)) {
        cartListItem.add(event.product);
        emit(CartSuccessState(cartedItem: List.from(cartListItem)));
      }
    });
    on<RemoveItemFromCart>((event, emit) {
      cartListItem.remove(event.product);
      emit(CartSuccessState(cartedItem: List.from(cartListItem)));
    });
  }
}
