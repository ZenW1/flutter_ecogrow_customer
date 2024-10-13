part of 'cart_selection_cubit.dart';
 class CartSelectionState extends Equatable {

  CartSelectionState();

  int totalSelectPrice = 0;
  int totalQuantity = 0;
  bool isSelected = false;
  bool isAllSelected = false;
  CartModel? cartListResponseModelAdd;
  CartProductModel? cartProductModelAdd;

  @override
  List<Object> get props => [totalSelectPrice, totalQuantity, isSelected, isAllSelected,cartListResponseModelAdd!,cartProductModelAdd!];
}


extension CartSelectionStateCopyWith on CartSelectionState {
  CartSelectionState copyWith({
    int? totalSelectPrice,
    int? totalQuantity,
    bool? isSelected,
    bool? isAllSelected,
    CartModel? cartListResponseModelAdd,
    CartProductModel? cartProductModelAdd,
  }) {
    return CartSelectionState()
      ..totalSelectPrice = totalSelectPrice ?? this.totalSelectPrice
      ..totalQuantity = totalQuantity ?? this.totalQuantity
      ..isSelected = isSelected ?? this.isSelected
      ..isAllSelected = isAllSelected ?? this.isAllSelected
      ..cartListResponseModelAdd = cartListResponseModelAdd ?? this.cartListResponseModelAdd
      ..cartProductModelAdd = cartProductModelAdd ?? this.cartProductModelAdd;
  }
}

