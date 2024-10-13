import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecogrow_customer/data/model/product_detail_response_model.dart';

part 'product_selection_state.dart';

class ProductSelectionCubit extends Cubit<ProductSelectionState> {
  ProductSelectionCubit() : super(ProductSelectionState());

  int get id => state.id!;
  String get unitTypeOption => state.unitTypeOption;

  int get priceAfterSelection => state.priceAfterSelection;

  int get quantity => state.quantity;

  int get totalPrice => priceAfterSelection * quantity;

  void selectOption(ProductVariation productVariation,int variationId,String unitTypeName ) {
    // emit(state.priceAfterSelection == productVariation.price
    //     ? state.copyWith(
    //         isSelectedOption: true,
    //         priceAfterSelection: state.priceAfterSelection)
    //     : state.copyWith(
    //         isSelectedOption: false,
    //         priceAfterSelection: productVariation.price));
    log('ID change $variationId');
    log('ID change $variationId');

    emit(state.copyWith( id: variationId , priceAfterSelection: productVariation.price,unitTypeOption: unitTypeName));
    emit(state.copyWith(unitTypeOption: productVariation.unitTypeName));
  }

  void incrementQuantity() {
    emit(state.copyWith(quantity: state.quantity + 1));
  }

  void resetQuantity() {
    emit(state.copyWith(quantity: 1));
  }

  void decrementQuantity() {
    if (state.quantity >= 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  // @override
  // Future<void> close() {
  //   resetQuantity();
  //   isSelectedOption.clear();
  //   return super.close();
  // }
}
