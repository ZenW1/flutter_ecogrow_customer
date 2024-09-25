import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecogrow_customer/data/model/product_detail_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/product_repo.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit(this.productRepo) : super(ProductInitial());

  final ProductRepo productRepo;

  Future<void> getProductDetail() async {
    emit(ProductInitial());
    try {
      final res = await productRepo.getProductDetail();
      emit(ProductDetailLoaded(data: res));
    } catch (e) {
      emit(ProductFailure(message: e.toString()));
    }
  }
}
