import 'package:elvtrix_ui_task/blocs/wishlist/wishlist_bloc.dart';
import 'package:elvtrix_ui_task/blocs/wishlist/wishlist_state.dart';
import 'package:elvtrix_ui_task/core/wishlist_ui/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class WishlistUi extends StatefulWidget {
  const WishlistUi({super.key});

  @override
  State<WishlistUi> createState() => _WishlistUiState();
}

class _WishlistUiState extends State<WishlistUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WishList'),
        backgroundColor: Colors.red,
      ),
      body: BlocBuilder<WishListBloc ,WishListState>(builder: (context,state){
        if(state is WishListSuccessState){
          if(state.wishListItems.isEmpty){
            return Center(child: Text("No Items in WishList"),);
          }
          return ListView.builder(
              itemCount:  state.wishListItems.length,
              itemBuilder: (context, index){
                return WishlistTileWidget(product: state.wishListItems[index]);
              });
        }
        return Center(child: CircularProgressIndicator(),);
      }),
    );
  }
}
