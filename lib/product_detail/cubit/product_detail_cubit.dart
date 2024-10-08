import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecogrow_customer/data/model/product_detail_response_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/product_repo.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit(this.productRepo) : super(ProductDetailLoading());

  final ProductRepo productRepo;

  bool get isSelectedOption => state.isSelectedOption;
  int get priceAfterSelection => state.priceAfterSelection;

  Future<void> getProductDetail() async {
    try {
      final res = await productRepo.getProductDetail();
      emit(ProductDetailLoaded(data: res));
    } catch (e) {
      emit(ProductFailure(message: e.toString()));
    }
  }


  Future<void> getProductDetailById({required String id}) async {
    try {
      final res = await productRepo.getProductDetailById(id: id);
      emit(ProductDetailLoaded(data: res));
    } catch (e) {
      emit(ProductFailure(message: e.toString()));
    }
  }





  // void selectOption(ProductVariation productVariation) {
  //  emit(state.priceAfterSelection == productVariation.price
  //       ? state.copyWith(isSelectedOption: false, priceAfterSelection: 0)
  //       : state.copyWith(isSelectedOption: true, priceAfterSelection: productVariation.price));
  //
  // }
}
