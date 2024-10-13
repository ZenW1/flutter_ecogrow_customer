part of 'product_selection_cubit.dart';

class ProductSelectionState extends Equatable {
  ProductSelectionState();
  int priceAfterSelection = 1;
  int quantity = 1;
  String unitTypeOption = '';
  int id = 1;
  int get totalPrice => priceAfterSelection * quantity;

  @override
  List<Object> get props =>
      [priceAfterSelection, quantity, totalPrice,unitTypeOption,id];
}

extension ProductSelectionStateCopyWith on ProductSelectionState {
  ProductSelectionState copyWith({
    bool? isSelectedOption,
    int? priceAfterSelection,
    int? quantity,
    int? id,
    String? unitTypeOption,
  }) {
    return ProductSelectionState()
      ..id  =  id ?? this.id
      ..priceAfterSelection = priceAfterSelection ?? this.priceAfterSelection
      ..quantity = quantity ?? this.quantity
      ..unitTypeOption = unitTypeOption ?? this.unitTypeOption;
  }
}
