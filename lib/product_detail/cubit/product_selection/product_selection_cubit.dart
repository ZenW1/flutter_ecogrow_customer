import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecogrow_customer/data/model/product_detail_response_model.dart';

part 'product_selection_state.dart';

class ProductSelectionCubit extends Cubit<ProductSelectionState> {
  ProductSelectionCubit() : super(ProductSelectionState());

  List<bool> get isSelectedOption => state.isSelectedOption;
  int get priceAfterSelection => state.priceAfterSelection;
  int get quantity => state.quantity;

  int get totalPrice => priceAfterSelection * quantity;

  void selectOption(ProductVariation productVariation) {
    emit(state.priceAfterSelection == productVariation.price
        ? state.copyWith(
            isSelectedOption: [false, true],
            priceAfterSelection: state.priceAfterSelection)
        : state.copyWith(
            isSelectedOption: [true, false],
            priceAfterSelection: productVariation.price));
  }

  void incrementQuantity() {
    emit(state.copyWith(quantity: state.quantity + 1));
  }

  void decrementQuantity() {
    if (state.quantity >= 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }
}
