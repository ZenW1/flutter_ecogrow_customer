part of 'product_selection_cubit.dart';

class ProductSelectionState extends Equatable {
  ProductSelectionState();
  List<bool> isSelectedOption = [true, false];
  int priceAfterSelection = 0;
  int quantity = 1;
  int get totalPrice => priceAfterSelection * quantity;

  @override
  List<Object> get props =>
      [isSelectedOption, priceAfterSelection, quantity, totalPrice];
}

extension ProductSelectionStateCopyWith on ProductSelectionState {
  ProductSelectionState copyWith({
    List<bool>? isSelectedOption,
    int? priceAfterSelection,
    int? quantity,
  }) {
    return ProductSelectionState()
      ..isSelectedOption = isSelectedOption ?? this.isSelectedOption
      ..priceAfterSelection = priceAfterSelection ?? this.priceAfterSelection
      ..quantity = quantity ?? this.quantity;
  }
}
