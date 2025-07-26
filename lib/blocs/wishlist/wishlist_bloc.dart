import 'package:elvtrix_ui_task/blocs/wishlist/wishlist_event.dart';
import 'package:elvtrix_ui_task/blocs/wishlist/wishlist_state.dart';
import 'package:elvtrix_ui_task/core/product_data_models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListBloc extends Bloc<WishListEvent ,WishListState>{
  final List<Product>wishListItem = [];

  WishListBloc():super(WishListInitialState()){
    on<AddToWishListEvent>((event, emit){
      wishListItem.add(event.product);
      emit(WishListSuccessState(wishListItems:List.from(wishListItem)));
    });
    on<RemoveFromWishList>((event, emit){
      wishListItem.remove(event.product);
      emit(WishListSuccessState(wishListItems: List.from(wishListItem)));
    });
  }
}