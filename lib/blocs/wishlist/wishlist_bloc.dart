import 'package:flutter_bloc/flutter_bloc.dart';
import 'wishlist_event.dart';
import 'wishlist_state.dart';
import '../../core/product_data_models/product.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  final List<Product> wishListItem = [];

  WishListBloc() : super(WishListInitialState()) {
    on<AddToWishListEvent>((event, emit) {
      if (!wishListItem.contains(event.product)) {
        wishListItem.add(event.product);
        emit(WishListSuccessState(wishListItems: List.from(wishListItem)));
      }
    });

    on<RemoveFromWishList>((event, emit) {
      wishListItem.remove(event.product);
      emit(WishListSuccessState(wishListItems: List.from(wishListItem)));
    });
  }
}
