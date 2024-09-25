import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecogrow_customer/data/model/product_list_response_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/product_repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo repo;
  ProductBloc(this.repo) : super(const ProductState()) {
    on<FetchProductEvent>(_fetchProductList);
  }


  Future<void> _fetchProductList(FetchProductEvent event ,Emitter<ProductState> emit) async {
    emit(ProductInitial());
    try{
      final res = await repo.getProductList();
      emit(ProductLoaded(data: res));
    } catch (e){
      emit(ProductFailure(message: e.toString()));
    }
  }
}
