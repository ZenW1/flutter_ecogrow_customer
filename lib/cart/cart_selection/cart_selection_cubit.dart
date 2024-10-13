import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecogrow_customer/data/model/cart_list_response_model.dart';

part 'cart_selection_state.dart';

class CartSelectionCubit extends Cubit<CartSelectionState> {
  CartSelectionCubit() : super(CartSelectionState());

  void selectAll() {
    emit(state.copyWith(isAllSelected: !state.isAllSelected,isSelected: state.isSelected));
  }

  void deselectAll(){
    emit(state.copyWith(isAllSelected: false,isSelected: false));
  }

  void isSelected(int index){
     emit(state.copyWith(isSelected: !state.isSelected));
  }

  int totalSelectPrice(int price){
    return state.totalSelectPrice + price;
  }

  int totalQuantity(int quantity){
    return state.totalQuantity + quantity;
  }

  void addCartListResponseModel(CartModel cartModel){
    emit(state.copyWith(cartListResponseModelAdd: cartModel));
  }

  void removeCartListResponseModel(){
    emit(state.copyWith(cartListResponseModelAdd: null));
  }

  void removeCartProductModel(){
    emit(state.copyWith(cartProductModelAdd: null));
  }

  void addCartProductModel(CartProductModel cartProductModel){
    emit(state.copyWith(cartProductModelAdd: cartProductModel));
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
